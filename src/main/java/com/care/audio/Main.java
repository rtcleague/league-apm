package com.care.audio;

public class Main {
    private static final int DEFAULT_SAMPLE_RATE = 48000;

    public static void main(String[] args) {
        if (args.length != 3) {
            System.err.println("Usage: java -jar audio-processor.jar <nearend.wav> <farend.wav> <output.wav>");
            System.exit(1);
        }

        String nearendPath = args[0];
        String farendPath = args[1];
        String outputPath = args[2];

        try {
            WavFileProcessor processor = new WavFileProcessor(DEFAULT_SAMPLE_RATE);
            processor.processFiles(nearendPath, farendPath, outputPath);
            System.out.printf("Successfully processed %d frames\n", processor.getTotalFramesProcessed());
        } catch (Exception e) {
            System.err.println("Error processing audio files: " + e.getMessage());
            e.printStackTrace();
            System.exit(1);
        }
    }
}