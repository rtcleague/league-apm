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
        this.nativeHandle = createNativeProcessor(sampleRate);
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

        int result = processFrameNative(nativeHandle, nearend, farend, output);
        if (result < 0) {
            throw new RuntimeException("Failed to process audio frame");
        }
        return result;
    }

    @Override
    public void close() {
        if (!isClosed) {
            destroyNativeProcessor(nativeHandle);
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
    private native long createNativeProcessor(int sampleRate);
    private native void destroyNativeProcessor(long handle);
    private native int processFrameNative(long handle, byte[] nearend, byte[] farend, byte[] output);
} 