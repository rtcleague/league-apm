/*
Author: Muhammad Usman Bashir
Senior WebRTC Architect

Description: This file contains the implementation of the AudioProcessor class, 
which is used to process the audio data for the near end and far end from the 
native layer.

Date: 27/11/2024
*/


package com.care.audio;

public class AudioProcessor implements AutoCloseable {
    private long nativeHandle;
    private final int sampleRate;
    private final int frameSize;
    private boolean isClosed = false;

    static {
        System.loadLibrary("care_audio_processing");
    }

    public AudioProcessor(int sampleRate) {
        this.sampleRate = sampleRate;
        this.frameSize = (sampleRate * 10) / 1000; // 10ms frame size
        this.nativeHandle = nativeInit();
        if (this.nativeHandle == 0) {
            throw new RuntimeException("Failed to create native audio processor");
        }
    }

    public int processFrame(byte[] nearend, byte[] farend, byte[] output) {
        if (isClosed) {
            throw new IllegalStateException("AudioProcessor is closed");
        }
        
        // Verify buffer sizes
        if (nearend == null || farend == null || output == null) {
            throw new IllegalArgumentException("Input and output buffers cannot be null");
        }
        
        int expectedSize = frameSize * 2; // 2 bytes per sample
        if (nearend.length != expectedSize || farend.length != expectedSize || output.length != expectedSize) {
            throw new IllegalArgumentException(
                String.format("Buffer sizes must be %d bytes (10ms at %dHz)", expectedSize, sampleRate));
        }

        // Convert byte arrays to short arrays
        short[] nearendShorts = new short[frameSize];
        short[] farendShorts = new short[frameSize];
        
        // Convert bytes to shorts
        for (int i = 0; i < frameSize; i++) {
            nearendShorts[i] = (short) ((nearend[i*2] & 0xFF) | (nearend[i*2 + 1] << 8));
            farendShorts[i] = (short) ((farend[i*2] & 0xFF) | (farend[i*2 + 1] << 8));
        }

        // Process audio
        nativeProcess(nativeHandle, nearendShorts, farendShorts);

        // Convert shorts back to bytes
        for (int i = 0; i < frameSize; i++) {
            output[i*2] = (byte) (nearendShorts[i] & 0xFF);
            output[i*2 + 1] = (byte) ((nearendShorts[i] >> 8) & 0xFF);
        }

        return frameSize * 2;
    }

    @Override
    public void close() {
        if (!isClosed) {
            nativeDestroy(nativeHandle);
            isClosed = true;
            nativeHandle = 0;
        }
    }

    @Override
    protected void finalize() throws Throwable {
        try {
            close();
        } finally {
            super.finalize();
        }
    }

    // Native methods
    private native long nativeInit();
    private native void nativeProcess(long handle, short[] nearend, short[] farend);
    private native void nativeDestroy(long handle);
} 