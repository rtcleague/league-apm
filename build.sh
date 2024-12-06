#!/bin/bash

# Create required directories
mkdir -p src/main/java/com/care/audio
mkdir -p src/main/cpp
mkdir -p src/main/resources
mkdir -p src/test/resources/audio
mkdir -p build/libs/native

# Convert nearend.wav to mono if needed
if [ ! -f src/test/resources/audio/nearend_mono.wav ]; then
    sox src/test/resources/audio/nearend.wav -b 16 -c 1 src/test/resources/audio/nearend_mono.wav
fi

# Build the project
./gradlew clean build

# Copy native library
cp src/main/cpp/build/lib/libcare_audio_processing.so build/libs/native/ 