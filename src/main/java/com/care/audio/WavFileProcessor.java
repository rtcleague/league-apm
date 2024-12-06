package com.care.audio;

import javax.sound.sampled.AudioFormat;
import javax.sound.sampled.AudioInputStream;
import javax.sound.sampled.AudioSystem;
import java.io.File;
import java.io.IOException;
import java.nio.ByteBuffer;
import java.nio.ByteOrder;

public class WavFileProcessor {
    private static final int SAMPLE_RATE = 48000;
    private static final int FRAME_SIZE = 480; // 10ms at 48kHz
    private static final int BITS_PER_SAMPLE = 16;
    private static final int CHANNELS = 1;

    private final AudioProcessor audioProcessor;
    private final String nearendPath;
    private final String farendPath;

    public WavFileProcessor(String nearendPath, String farendPath) {
        this.nearendPath = nearendPath;
        this.farendPath = farendPath;
        this.audioProcessor = new AudioProcessor();
    }

    public void process() throws Exception {
        AudioInputStream nearendStream = AudioSystem.getAudioInputStream(new File(nearendPath));
        AudioInputStream farendStream = AudioSystem.getAudioInputStream(new File(farendPath));

        // Verify audio format
        AudioFormat format = nearendStream.getFormat();
        if (format.getSampleRate() != SAMPLE_RATE || 
            format.getSampleSizeInBits() != BITS_PER_SAMPLE || 
            format.getChannels() != CHANNELS) {
            throw new IllegalArgumentException("Unsupported audio format. Expected: 48kHz, 16-bit, mono");
        }

        // Process audio frames
        byte[] nearendBuffer = new byte[FRAME_SIZE * 2]; // 16-bit = 2 bytes per sample
        byte[] outputBuffer = new byte[FRAME_SIZE * 2];

        while (nearendStream.read(nearendBuffer) != -1) {
            // Process frame
            int bytesWritten = audioProcessor.processFrame(nearendBuffer, outputBuffer);
            if (bytesWritten < 0) {
                throw new IOException("Error processing audio frame");
            }
            // Here you might want to write outputBuffer to a file or handle it in some way
        }

        nearendStream.close();
        farendStream.close();
    }
} 