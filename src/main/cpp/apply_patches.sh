#!/bin/bash

# Apply patches
patch -p0 < patches/audio_processing_impl_h.patch
patch -p0 < patches/audio_processing_impl_cc.patch
patch -p0 < patches/noise_suppression_impl.patch