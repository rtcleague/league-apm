/*
Author: Muhammad Usman Bashir
Senior WebRTC Architect

Description: This file contains the implementation of the AudioProcessor class, 
which is used to process the audio data for the near end and far end from the 
native layer.

Date: 27/11/2024
*/


package com.care.audio;

public class AudioProcessor {
    static {
        System.loadLibrary("care_audio_processing");
    }

    private long nativeHandle;

    public AudioProcessor() {
        nativeHandle = createNativeProcessor();
    }

    public void processAudio(byte[] nearend, byte[] farend, byte[] output) {
        processAudioNative(nativeHandle, nearend, farend, output);
    }

    @Override
    protected void finalize() throws Throwable {
        destroyNativeProcessor(nativeHandle);
        super.finalize();
    }

    private native long createNativeProcessor();
    private native void destroyNativeProcessor(long handle);
    private native void processAudioNative(long handle, byte[] nearend, byte[] farend, byte[] output);
} 