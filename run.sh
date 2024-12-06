#!/bin/bash

# Build everything
./build.sh

# Set library path
export LD_LIBRARY_PATH=build/libs/native:$LD_LIBRARY_PATH

# Run Java program with WAV files
java -Djava.library.path=build/libs/native \
     -cp build/libs/care-audio-processing-1.0-SNAPSHOT.jar \
     com.care.audio.WavFileProcessor \
     src/test/resources/audio/nearend_mono.wav \
     src/test/resources/audio/farend.wav