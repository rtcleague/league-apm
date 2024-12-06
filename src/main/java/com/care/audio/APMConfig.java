package com.care.audio;

public class APMConfig {
    static {
        System.loadLibrary("care_audio_processing");
    }

    private long nativeHandle;

    // Configuration flags
    private boolean echoControllerEnabled = true;
    private boolean noiseSuppressionEnabled = true;
    private boolean gainControlEnabled = true;

    public APMConfig() {
        nativeHandle = createAPM();
    }

    public void setEchoControllerEnabled(boolean enabled) {
        echoControllerEnabled = enabled;
        applyConfig(nativeHandle);
    }

    public void setNoiseSuppressionEnabled(boolean enabled) {
        noiseSuppressionEnabled = enabled;
        applyConfig(nativeHandle);
    }

    public void setGainControlEnabled(boolean enabled) {
        gainControlEnabled = enabled;
        applyConfig(nativeHandle);
    }

    public void close() {
        if (nativeHandle != 0) {
            destroyAPM(nativeHandle);
            nativeHandle = 0;
        }
    }

    private native long createAPM();
    private native void applyConfig(long handle);
    private native void destroyAPM(long handle);
} 