package com.care.audio;

import java.io.*;
import javax.sound.sampled.*;

public class WavFileProcessor {
    private final AudioProcessor processor;
    private final int frameSize;
    private final int sampleRate;
    private long totalFramesProcessed = 0;

    public WavFileProcessor(int sampleRate) {
        this.sampleRate = sampleRate;
        this.processor = new AudioProcessor(sampleRate);
        this.frameSize = (sampleRate * 10) / 1000; // 10ms frame size
    }

    public void processFiles(String nearendPath, String farendPath, String outputPath) throws IOException {
        try (AudioInputStream nearendStream = AudioSystem.getAudioInputStream(new File(nearendPath));
             AudioInputStream farendStream = AudioSystem.getAudioInputStream(new File(farendPath))) {
            
            // Verify audio format
            AudioFormat nearendFormat = nearendStream.getFormat();
            AudioFormat farendFormat = farendStream.getFormat();
            
            verifyAudioFormat(nearendFormat, "nearend");
            verifyAudioFormat(farendFormat, "farend");
            
            // Create output file with same format
            AudioFormat outputFormat = new AudioFormat(
                sampleRate,
                16, // bits per sample
                1,  // channels
                true, // signed
                false // little endian
            );
            
            try (AudioInputStream nearendConverted = AudioSystem.getAudioInputStream(outputFormat, nearendStream);
                 AudioInputStream farendConverted = AudioSystem.getAudioInputStream(outputFormat, farendStream);
                 AudioInputStream bufferedNearend = new AudioInputStream(
                     new BufferedInputStream(nearendConverted), outputFormat, nearendConverted.getFrameLength());
                 AudioInputStream bufferedFarend = new AudioInputStream(
                     new BufferedInputStream(farendConverted), outputFormat, farendConverted.getFrameLength())) {
                
                processStreams(bufferedNearend, bufferedFarend, outputPath, outputFormat);
            }
        } catch (UnsupportedAudioFileException e) {
            throw new IOException("Unsupported audio format", e);
        }
    }

    private void processStreams(
        AudioInputStream nearendStream,
        AudioInputStream farendStream,
        String outputPath,
        AudioFormat format) throws IOException {

        // Create output file
        File outputFile = new File(outputPath);
        try (AudioInputStream outputStream = new AudioInputStream(
                new ProcessingInputStream(nearendStream, farendStream),
                format,
                nearendStream.getFrameLength())) {
            AudioSystem.write(outputStream, AudioFileFormat.Type.WAVE, outputFile);
        }
    }

    private void verifyAudioFormat(AudioFormat format, String streamName) {
        if (format.getChannels() != 1) {
            throw new IllegalArgumentException(
                String.format("%s audio must be mono, got %d channels", 
                    streamName, format.getChannels()));
        }
        
        if (format.getSampleRate() != sampleRate) {
            throw new IllegalArgumentException(
                String.format("%s sample rate must be %dHz, got %dHz", 
                    streamName, sampleRate, (int)format.getSampleRate()));
        }
    }

    private class ProcessingInputStream extends InputStream {
        private final AudioInputStream nearendStream;
        private final AudioInputStream farendStream;
        private final byte[] nearendBuffer;
        private final byte[] farendBuffer;
        private final byte[] outputBuffer;
        private int outputPos = 0;
        private int outputAvailable = 0;

        ProcessingInputStream(AudioInputStream nearend, AudioInputStream farend) {
            this.nearendStream = nearend;
            this.farendStream = farend;
            this.nearendBuffer = new byte[frameSize * 2]; // 2 bytes per sample
            this.farendBuffer = new byte[frameSize * 2];
            this.outputBuffer = new byte[frameSize * 2];
        }

        @Override
        public int read() throws IOException {
            if (outputPos >= outputAvailable) {
                if (!fillBuffers()) {
                    return -1;
                }
            }
            return outputBuffer[outputPos++] & 0xFF;
        }

        @Override
        public int read(byte[] b, int off, int len) throws IOException {
            if (outputPos >= outputAvailable) {
                if (!fillBuffers()) {
                    return -1;
                }
            }
            
            int bytesToCopy = Math.min(len, outputAvailable - outputPos);
            System.arraycopy(outputBuffer, outputPos, b, off, bytesToCopy);
            outputPos += bytesToCopy;
            return bytesToCopy;
        }

        private boolean fillBuffers() throws IOException {
            // Read input frames
            int nearendRead = readFully(nearendStream, nearendBuffer);
            int farendRead = readFully(farendStream, farendBuffer);
            
            if (nearendRead <= 0 || farendRead <= 0) {
                return false;
            }
            
            if (nearendRead != farendRead) {
                throw new IOException("Nearend and farend streams have different lengths");
            }
            
            // Process frame
            try {
                outputAvailable = processor.processFrame(nearendBuffer, farendBuffer, outputBuffer);
                outputPos = 0;
                totalFramesProcessed++;
                return true;
            } catch (RuntimeException e) {
                throw new IOException("Failed to process audio frame", e);
            }
        }

        private int readFully(InputStream in, byte[] buffer) throws IOException {
            int totalRead = 0;
            while (totalRead < buffer.length) {
                int read = in.read(buffer, totalRead, buffer.length - totalRead);
                if (read == -1) {
                    break;
                }
                totalRead += read;
            }
            return totalRead;
        }
    }

    @Override
    protected void finalize() throws Throwable {
        try {
            processor.close();
        } finally {
            super.finalize();
        }
    }

    public long getTotalFramesProcessed() {
        return totalFramesProcessed;
    }
} 