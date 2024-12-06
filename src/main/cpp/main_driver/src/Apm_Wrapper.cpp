/*
Author: Muhammad Usman Bashir
Senior WebRTC Architect

Description: This file contains the implementation of the Apm_Wrapper class, 
which is used to process the audio data for the near end and far end.

Date: 27/11/2024
*/

#include "../include/Apm_Wrapper.h"
#include "../utils/logging_macros.h"
#include "rtc_base/ref_counted_object.h"
#include "common_audio/resampler/include/push_resampler.h"

using rtc::scoped_refptr;

Apm_Wrapper::Apm_Wrapper()
    : capture_config(8000, 1),  // 8kHz mono by default
      render_config(8000, 1) {
    // Create the AudioProcessing instance using the new builder
    webrtc::AudioProcessingBuilder builder;
    apm_ = builder.Create();

    // Configure default settings
    webrtc::AudioProcessing::Config config;
    config.echo_canceller.enabled = true;
    config.echo_canceller.mobile_mode = false;
    config.noise_suppression.enabled = true;
    config.noise_suppression.level = webrtc::AudioProcessing::Config::NoiseSuppression::kHigh;
    config.gain_controller1.enabled = true;
    config.gain_controller1.mode = webrtc::AudioProcessing::Config::GainController1::kAdaptiveAnalog;
    config.gain_controller1.analog_gain_controller.enabled = true;
    config.gain_controller1.analog_gain_controller.clipped_level_min = 70;

    // Apply the configuration
    apm_->ApplyConfig(config);
}

Apm_Wrapper::~Apm_Wrapper() {
    // scoped_refptr will handle cleanup
}

bool Apm_Wrapper::Initialize(int sample_rate_hz, int num_channels) {
    if (!apm_) return false;
    
    capture_config = webrtc::StreamConfig(sample_rate_hz, num_channels);
    render_config = webrtc::StreamConfig(sample_rate_hz, num_channels);
    
    return true;
}

void Apm_Wrapper::ApmProcessNearEnd(int16_t* input, int16_t* output) {
    if (!apm_) return;
    
    apm_->set_stream_analog_level(analog_level);
    apm_->ProcessStream(input, capture_config, capture_config, output);
    analog_level = apm_->recommended_stream_analog_level();
}

void Apm_Wrapper::ApmProcessFarEnd(int16_t* input, int16_t* output) {
    if (!apm_) return;
    apm_->ProcessReverseStream(input, render_config, render_config, output);
}

void Apm_Wrapper::SetStreamDelay(int delay_ms) {
    if (!apm_) return;
    apm_->set_stream_delay_ms(delay_ms);
}

void Apm_Wrapper::SetAnalogLevel(int level) {
    analog_level = level;
}

int Apm_Wrapper::GetRecommendedAnalogLevel() const {
    return analog_level;
}

// Configuration methods
void Apm_Wrapper::SetEchoControllerEnabled(bool enabled) {
    if (!apm_) return;
    webrtc::AudioProcessing::Config config = apm_->GetConfig();
    config.echo_canceller.enabled = enabled;
    apm_->ApplyConfig(config);
}

void Apm_Wrapper::SetNoiseSuppressionEnabled(bool enabled) {
    if (!apm_) return;
    webrtc::AudioProcessing::Config config = apm_->GetConfig();
    config.noise_suppression.enabled = enabled;
    apm_->ApplyConfig(config);
}

void Apm_Wrapper::SetGainControlEnabled(bool enabled) {
    if (!apm_) return;
    webrtc::AudioProcessing::Config config = apm_->GetConfig();
    config.gain_controller1.enabled = enabled;
    apm_->ApplyConfig(config);
}

// Resampling methods
void Apm_Wrapper::DownSampleNearEnd(int16_t* input, int16_t* output) {
    near_resampler_.Resample(input, 480, output, 160);
}

void Apm_Wrapper::UpSampleNearEnd(int16_t* input, int16_t* output) {
    near_resampler_.Resample(input, 160, output, 480);
}

void Apm_Wrapper::DownSampleFarEnd(int16_t* input, int16_t* output) {
    far_resampler_.Resample(input, 480, output, 160);
}

void Apm_Wrapper::UpSampleFarEnd(int16_t* input, int16_t* output) {
    far_resampler_.Resample(input, 160, output, 480);
}



