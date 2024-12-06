#include <jni.h>
#include "../utils/logging_macros.h"
#include "../Driver.h"

extern "C" {

JNIEXPORT void JNICALL Java_com_care_audio_APMConfig_applyConfig
  (JNIEnv* env, jobject thiz, jlong handle)
{
    if (handle == 0) {
        logError("Invalid APM handle");
        return;
    }

    try {
        Driver* driver = reinterpret_cast<Driver*>(handle);
        Apm_Wrapper* apm_wrapper = driver->GetApmWrapper();
        
        // Get APM configuration from Java object
        jclass cls = env->GetObjectClass(thiz);
        
        // Get field IDs
        jfieldID echoControllerEnabledId = env->GetFieldID(cls, "echoControllerEnabled", "Z");
        jfieldID noiseSuppressionEnabledId = env->GetFieldID(cls, "noiseSuppressionEnabled", "Z");
        jfieldID gainControlEnabledId = env->GetFieldID(cls, "gainControlEnabled", "Z");
        
        // Get field values
        jboolean echoControllerEnabled = env->GetBooleanField(thiz, echoControllerEnabledId);
        jboolean noiseSuppressionEnabled = env->GetBooleanField(thiz, noiseSuppressionEnabledId);
        jboolean gainControlEnabled = env->GetBooleanField(thiz, gainControlEnabledId);
        
        // Apply configuration
        apm_wrapper->SetEchoControllerEnabled(echoControllerEnabled);
        apm_wrapper->SetNoiseSuppressionEnabled(noiseSuppressionEnabled);
        apm_wrapper->SetGainControlEnabled(gainControlEnabled);
        
        env->DeleteLocalRef(cls);
        
    } catch (const std::exception& e) {
        logError("%s", e.what());
    }
}

JNIEXPORT void JNICALL Java_com_care_audio_APMConfig_destroyAPM
  (JNIEnv* env, jobject thiz, jlong handle)
{
    if (handle != 0) {
        Driver* driver = reinterpret_cast<Driver*>(handle);
        delete driver;
    }
}

} // extern "C" 