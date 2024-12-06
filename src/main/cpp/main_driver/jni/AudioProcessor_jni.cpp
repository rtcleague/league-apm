#include <jni.h>
#include <memory>
#include <modules/audio_processing/include/audio_processing.h>
#include "com_care_audio_AudioProcessor.h"

// Helper class to manage WebRTC APM lifecycle
class AudioProcessorHandle {
public:
    AudioProcessorHandle(int sample_rate_hz) {
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
        apm = webrtc::AudioProcessingBuilder().Create();
        if (!apm) {
            throw std::runtime_error("Failed to create APM instance");
        }

        // Apply configuration
        apm->ApplyConfig(config);

        // Set up audio format
        stream_config.sample_rate_hz = sample_rate_hz;
        stream_config.num_channels = 1;  // Mono
        stream_config.has_keyboard = false;
    }

    webrtc::AudioProcessing* getApm() { return apm.get(); }
    const webrtc::StreamConfig& getConfig() const { return stream_config; }

private:
    std::unique_ptr<webrtc::AudioProcessing> apm;
    webrtc::StreamConfig stream_config;
};

// Convert Java byte array to float array
void byteArrayToFloat(JNIEnv* env, jbyteArray input, float* output, int length) {
    jbyte* bytes = env->GetByteArrayElements(input, nullptr);
    for (int i = 0; i < length/2; i++) {
        int16_t sample = (bytes[i*2] & 0xFF) | (bytes[i*2 + 1] << 8);
        output[i] = static_cast<float>(sample) / 32768.0f;
    }
    env->ReleaseByteArrayElements(input, bytes, JNI_ABORT);
}

// Convert float array to Java byte array
void floatToByteArray(JNIEnv* env, const float* input, jbyteArray output, int length) {
    jbyte* bytes = env->GetByteArrayElements(output, nullptr);
    for (int i = 0; i < length/2; i++) {
        int16_t sample = static_cast<int16_t>(input[i] * 32768.0f);
        bytes[i*2] = sample & 0xFF;
        bytes[i*2 + 1] = (sample >> 8) & 0xFF;
    }
    env->ReleaseByteArrayElements(output, bytes, 0);
}

/*
 * Class:     com_care_audio_AudioProcessor
 * Method:    createNativeProcessor
 */
JNIEXPORT jlong JNICALL Java_com_care_audio_AudioProcessor_createNativeProcessor
  (JNIEnv* env, jobject obj, jint sample_rate) {
    try {
        auto* handle = new AudioProcessorHandle(sample_rate);
        return reinterpret_cast<jlong>(handle);
    } catch (const std::exception& e) {
        return 0;
    }
}

/*
 * Class:     com_care_audio_AudioProcessor
 * Method:    destroyNativeProcessor
 */
JNIEXPORT void JNICALL Java_com_care_audio_AudioProcessor_destroyNativeProcessor
  (JNIEnv* env, jobject obj, jlong handle) {
    if (handle) {
        auto* processor = reinterpret_cast<AudioProcessorHandle*>(handle);
        delete processor;
    }
}

/*
 * Class:     com_care_audio_AudioProcessor
 * Method:    processFrameNative
 */
JNIEXPORT jint JNICALL Java_com_care_audio_AudioProcessor_processFrameNative
  (JNIEnv* env, jobject obj, jlong handle, jbyteArray nearend, jbyteArray farend, jbyteArray output) {
    if (!handle) return -1;

    auto* processor = reinterpret_cast<AudioProcessorHandle*>(handle);
    auto* apm = processor->getApm();
    const auto& config = processor->getConfig();

    // Get array lengths
    jsize nearend_len = env->GetArrayLength(nearend);
    jsize farend_len = env->GetArrayLength(farend);
    jsize output_len = env->GetArrayLength(output);

    // Verify buffer sizes
    int samples = nearend_len / 2;  // 2 bytes per sample
    if (samples * 2 != nearend_len || samples * 2 != farend_len || samples * 2 != output_len) {
        return -1;
    }

    try {
        // Convert input buffers to float
        std::vector<float> nearend_float(samples);
        std::vector<float> farend_float(samples);
        byteArrayToFloat(env, nearend, nearend_float.data(), nearend_len);
        byteArrayToFloat(env, farend, farend_float.data(), farend_len);

        // Process farend first (reference signal)
        if (apm->ProcessReverseStream(farend_float.data(), config, config, farend_float.data()) != 0) {
            return -1;
        }

        // Process nearend (captured signal)
        if (apm->ProcessStream(nearend_float.data(), config, config, nearend_float.data()) != 0) {
            return -1;
        }

        // Convert output back to bytes
        floatToByteArray(env, nearend_float.data(), output, output_len);

        return output_len;
    } catch (const std::exception& e) {
        return -1;
    }
}