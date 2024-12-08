/*
Author: Muhammad Usman Bashir
Senior WebRTC Architect

Description: This is header file for the Apm_Wrapper class, which is used to 
process the audio data for the near end and far end. 

Date: 27/11/2024
*/

#ifndef APM_WRAPPER_H
#define APM_WRAPPER_H

#include "modules/audio_processing/include/audio_processing.h"
#include "rtc_base/ref_counted_object.h"
#include "common_audio/resampler/include/push_resampler.h"

class Apm_Wrapper {
public:
    Apm_Wrapper();
    ~Apm_Wrapper();

    bool Initialize(int sample_rate_hz, int num_channels);
    void ApmProcessNearEnd(int16_t* input, int16_t* output);
    void ApmProcessFarEnd(int16_t* input, int16_t* output);
    void SetStreamDelay(int delay_ms);
    void SetAnalogLevel(int level);
    int GetRecommendedAnalogLevel() const;

    bool ProcessStream(int16_t* audio_frame);

    void SetEchoControllerEnabled(bool enabled);
    void SetNoiseSuppressionEnabled(bool enabled);
    void SetGainControlEnabled(bool enabled);

    void DownSampleNearEnd(int16_t* input, int16_t* output);
    void UpSampleNearEnd(int16_t* input, int16_t* output);
    void DownSampleFarEnd(int16_t* input, int16_t* output);
    void UpSampleFarEnd(int16_t* input, int16_t* output);

private:
    void configureAPM();
    rtc::scoped_refptr<webrtc::AudioProcessing> apm_;
    webrtc::StreamConfig capture_config;
    webrtc::StreamConfig render_config;
    int analog_level = 100;
    webrtc::PushResampler<int16_t> near_resampler_;
    webrtc::PushResampler<int16_t> far_resampler_;
};

#endif // APM_WRAPPER_H
