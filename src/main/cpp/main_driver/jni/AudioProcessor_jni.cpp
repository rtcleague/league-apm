#include <jni.h>
#include "Apm_Wrapper.h"
#include <memory>
#include <vector>

// Cache the Java class and method IDs
static jclass audioProcessorClass;
static jmethodID midConstructor;

// JNI wrapper for APM
class JNIAudioProcessor {
private:
    std::unique_ptr<Apm_Wrapper> apm;
    static constexpr int kSampleRateHz = 8000;
    static constexpr int kNumChannels = 1;
    std::vector<int16_t> tempBuffer;

public:
    JNIAudioProcessor() 
        : apm(std::make_unique<Apm_Wrapper>())
        , tempBuffer(80) // 10ms at 8kHz
    {
        apm->Initialize(kSampleRateHz, kNumChannels);
    }

    int ProcessFrame(const int16_t* input, int16_t* output) {
        // Copy input to ensure proper alignment
        std::copy(input, input + 80, tempBuffer.data());
        
        // Process audio
        if (!apm->ProcessStream(tempBuffer.data())) {
            return -1;
        }

        // Copy processed audio to output
        std::copy(tempBuffer.begin(), tempBuffer.end(), output);
        return tempBuffer.size() * sizeof(int16_t);
    }
};

// JNI method implementations
extern "C" {

JNIEXPORT jlong JNICALL
Java_com_care_audio_AudioProcessor_createNativeProcessor(JNIEnv* env, jobject obj) {
    auto* processor = new JNIAudioProcessor();
    return reinterpret_cast<jlong>(processor);
}

JNIEXPORT void JNICALL
Java_com_care_audio_AudioProcessor_destroyNativeProcessor(JNIEnv* env, jobject obj, jlong handle) {
    auto* processor = reinterpret_cast<JNIAudioProcessor*>(handle);
    delete processor;
}

JNIEXPORT jint JNICALL
Java_com_care_audio_AudioProcessor_processFrameNative(
    JNIEnv* env, jobject obj, jlong handle, jbyteArray input, jbyteArray output) {
    
    auto* processor = reinterpret_cast<JNIAudioProcessor*>(handle);
    
    // Get input bytes
    jbyte* inputBytes = env->GetByteArrayElements(input, nullptr);
    jbyte* outputBytes = env->GetByteArrayElements(output, nullptr);
    
    // Process the frame
    int bytesWritten = processor->ProcessFrame(
        reinterpret_cast<int16_t*>(inputBytes),
        reinterpret_cast<int16_t*>(outputBytes));
    
    // Release arrays
    env->ReleaseByteArrayElements(input, inputBytes, JNI_ABORT);
    env->ReleaseByteArrayElements(output, outputBytes, 0);
    
    return bytesWritten;
}

} // extern "C" 