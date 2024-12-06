package com.care.audio;

import java.io.*;
import javax.sound.sampled.*;

public class WavFileProcessor {
    private static final int SAMPLE_RATE = 8000;
    private static final int BITS_PER_SAMPLE = 16;
    private static final int CHANNELS = 1;
    private static final int FRAME_SIZE = 2;  // 2 bytes per frame for 16-bit mono
    private static final int CHUNK_SIZE_10MS = SAMPLE_RATE / 100 * FRAME_SIZE; // 10ms of audio

    private AudioProcessor audioProcessor;

    public WavFileProcessor() {
        audioProcessor = new AudioProcessor();
    }

    public void processFiles(String nearendPath, String farwsendPath) throws Exception {
        // Read WAV files
        AudioInputStream nearendStream = AudioSystem.getAudioInputStream(new File(nearendPath));
        AudioInputStream farendStream = AudioSystem.getAudioInputStream(new File(farendPath));

        // Get audio format
        AudioFormat format = nearendStream.getFormat();
        System.out.println("Input format: " + format);

        // Verify format matches our requirements
        if (format.getSampleRate() != SAMPLE_RATE ||
            format.getSampleSizeInBits() != BITS_PER_SAMPLE ||
            format.getChannels() != CHANNELS ||
            format.isBigEndian()) {
            throw new UnsupportedAudioFileException(
                "Audio format must be: " + SAMPLE_RATE + "Hz, " +
                BITS_PER_SAMPLE + "-bit, mono, little-endian PCM");
        }

        // Create output file
        File outputFile = new File("processed_output.wav");
        AudioInputStream outputStream = null;

        try {
            // Process audio in 10ms chunks
            byte[] nearendBuffer = new byte[CHUNK_SIZE_10MS];
            byte[] farendBuffer = new byte[CHUNK_SIZE_10MS];
            byte[] outputBuffer = new byte[CHUNK_SIZE_10MS];
            ByteArrayOutputStream processedOutput = new ByteArrayOutputStream();

            System.out.println("Processing audio...");
            int chunksProcessed = 0;

            while (true) {
                int nearendRead = nearendStream.read(nearendBuffer);
                int farendRead = farendStream.read(farendBuffer);

                if (nearendRead < 0 || farendRead < 0) break;

                // Process the chunks
                audioProcessor.processAudio(nearendBuffer, farendBuffer, outputBuffer);
                processedOutput.write(outputBuffer, 0, CHUNK_SIZE_10MS);

                chunksProcessed++;
                if (chunksProcessed % 100 == 0) {
                    System.out.println("Processed " + chunksProcessed + " chunks");
                }
            }

            System.out.println("Finished processing " + chunksProcessed + " chunks");

            // Create output stream
            byte[] processedData = processedOutput.toByteArray();
            AudioInputStream processedStream = new AudioInputStream(
                new ByteArrayInputStream(processedData),
                format,
                processedData.length / format.getFrameSize()
            );

            // Write to WAV file
            AudioSystem.write(processedStream, AudioFileFormat.Type.WAVE, outputFile);
            System.out.println("Saved processed audio to: " + outputFile.getAbsolutePath());

        } finally {
            nearendStream.close();
            farendStream.close();
            if (outputStream != null) {
                outputStream.close();
            }
        }
    }

    public static void main(String[] args) {
        if (args.length != 2) {
            System.out.println("Usage: WavFileProcessor <nearend.wav> <farend.wav>");
            return;
        }

        try {
            WavFileProcessor processor = new WavFileProcessor();
            processor.processFiles(args[0], args[1]);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
} 