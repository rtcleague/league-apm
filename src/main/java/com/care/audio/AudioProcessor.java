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
    private static final int FRAME_SIZE = 80; // 10ms at 8kHz

    public AudioProcessor() {
        nativeHandle = createNativeProcessor();
    }

    /**
     * Process a frame of audio data
     * @param input Input audio frame (PCM 16-bit, 8kHz, mono)
     * @param output Output buffer for processed audio (same format as input)
     * @return Number of bytes written to output buffer
     */
    public int processFrame(byte[] input, byte[] output) {
        if (input.length != FRAME_SIZE * 2) { // 2 bytes per sample
            throw new IllegalArgumentException(
                "Input buffer must be exactly 10ms of audio (" + 
                FRAME_SIZE * 2 + " bytes)");
        }
        return processFrameNative(nativeHandle, input, output);
    }

    @Override
    protected void finalize() throws Throwable {
        destroyNativeProcessor(nativeHandle);
        super.finalize();
    }

    private native long createNativeProcessor();
    private native void destroyNativeProcessor(long handle);
    private native int processFrameNative(long handle, byte[] input, byte[] output);
} 