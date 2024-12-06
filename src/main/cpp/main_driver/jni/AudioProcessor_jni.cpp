#include <jni.h>
#include <memory>
#include <modules/audio_processing/include/audio_processing.h>
#include "com_care_audio_AudioProcessor.h"

// Helper class to manage WebRTC APM lifecycle
class AudioProcessorHandle {
public:
    AudioProcessorHandle() {
        webrtc::AudioProcessing::Config config;
        
        // Configure Echo Cancellation
        config.echo_canceller.enabled = true;
        config.echo_canceller.mobile_mode = false;
        
        // Configure Noise Suppression
        config.noise_suppression.enabled = true;
        config.noise_suppression.level = webrtc::AudioProcessing::Config::NoiseSuppression::kHigh;
        
        // Configure Gain Control
        config.gain_controller1.enabled = true;
        config.gain_controller1.mode = webrtc::AudioProcessing::Config::GainController1::kAdaptiveDigital;
        
        // Configure High Pass Filter
        config.high_pass_filter.enabled = true;

        // Create APM instance
        apm_.reset(webrtc::AudioProcessingBuilder().Create());
        if (!apm_) {
            throw std::runtime_error("Failed to create APM instance");
        }

        // Apply configuration
        apm_->ApplyConfig(config);

        // Set up audio format (8kHz mono)
        stream_config_ = webrtc::StreamConfig(8000, 1, false);
    }

    webrtc::AudioProcessing* getApm() { return apm_.get(); }
    const webrtc::StreamConfig& getConfig() const { return stream_config_; }

private:
    std::unique_ptr<webrtc::AudioProcessing> apm_;
    webrtc::StreamConfig stream_config_;
};

extern "C" {

/*
 * Class:     com_care_audio_AudioProcessor
 * Method:    nativeInit
 * Signature: ()J
 */
JNIEXPORT jlong JNICALL Java_com_care_audio_AudioProcessor_nativeInit
  (JNIEnv* env, jobject thiz) {
    try {
        auto* handle = new AudioProcessorHandle();
        return reinterpret_cast<jlong>(handle);
    } catch (const std::exception& e) {
        return 0;
    }
}

/*
 * Class:     com_care_audio_AudioProcessor
 * Method:    nativeProcess
 * Signature: (J[S[S)V
 */
JNIEXPORT void JNICALL Java_com_care_audio_AudioProcessor_nativeProcess
  (JNIEnv* env, jobject thiz, jlong handle, jshortArray nearend, jshortArray farend) {
    if (!handle) return;

    auto* processor = reinterpret_cast<AudioProcessorHandle*>(handle);
    auto* apm = processor->getApm();
    const auto& config = processor->getConfig();

    // Get array elements
    jshort* nearend_data = env->GetShortArrayElements(nearend, nullptr);
    jshort* farend_data = env->GetShortArrayElements(farend, nullptr);
    
    try {
        // Process farend first (reference signal)
        if (apm->ProcessReverseStream(
                reinterpret_cast<const int16_t*>(farend_data),
                config,
                config,
                reinterpret_cast<int16_t*>(farend_data)) != 0) {
            // Handle error
        }

        // Process nearend (captured signal)
        if (apm->ProcessStream(
                reinterpret_cast<const int16_t*>(nearend_data),
                config,
                config,
                reinterpret_cast<int16_t*>(nearend_data)) != 0) {
            // Handle error
        }
    } catch (const std::exception& e) {
        // Handle error
    }

    // Release arrays
    env->ReleaseShortArrayElements(nearend, nearend_data, 0);
    env->ReleaseShortArrayElements(farend, farend_data, JNI_ABORT);
}

/*
 * Class:     com_care_audio_AudioProcessor
 * Method:    nativeDestroy
 * Signature: (J)V
 */
JNIEXPORT void JNICALL Java_com_care_audio_AudioProcessor_nativeDestroy
  (JNIEnv* env, jobject thiz, jlong handle) {
    if (handle) {
        auto* processor = reinterpret_cast<AudioProcessorHandle*>(handle);
        delete processor;
    }
}

} // extern "C"