/*
 *  Copyright (c) 2020 The WebRTC project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

#ifndef API_VOIP_VOIP_ENGINE_FACTORY_H_
#define API_VOIP_VOIP_ENGINE_FACTORY_H_

#include <memory>

#include "api/audio/audio_device.h"
#include "api/audio/audio_processing.h"
#include "api/audio_codecs/audio_decoder_factory.h"
#include "api/audio_codecs/audio_encoder_factory.h"
#include "api/scoped_refptr.h"
#include "api/task_queue/task_queue_factory.h"
#include "api/voip/voip_engine.h"

namespace webrtc {

// VoipEngineConfig is a struct that defines parameters to instantiate a
// VoipEngine instance through CreateVoipEngine factory method. Each member is
// marked with comments as either mandatory or optional and default
// implementations that applications can use.
struct VoipEngineConfig {
  // TODO: bugs.webrtc.org/369904700 - Remove explicit default constructors
  // when deprecated `audio_processing` is removed and thus implicit
  // constructors won't be considered deprecated.
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wdeprecated-declarations"
  VoipEngineConfig() = default;
  VoipEngineConfig(VoipEngineConfig&&) = default;
  VoipEngineConfig& operator=(VoipEngineConfig&&) = default;
#pragma clang diagnostic pop

  // Mandatory (e.g. api/audio_codec/builtin_audio_encoder_factory).
  // AudioEncoderFactory provides a set of audio codecs for VoipEngine to encode
  // the audio input sample. Application can choose to limit the set to reduce
  // application footprint.
  scoped_refptr<AudioEncoderFactory> encoder_factory;

  // Mandatory (e.g. api/audio_codec/builtin_audio_decoder_factory).
  // AudioDecoderFactory provides a set of audio codecs for VoipEngine to decode
  // the received RTP packets from remote media endpoint. Application can choose
  // to limit the set to reduce application footprint.
  scoped_refptr<AudioDecoderFactory> decoder_factory;

  // Mandatory (e.g. api/task_queue/default_task_queue_factory).
  // TaskQeueuFactory provided for VoipEngine to work asynchronously on its
  // encoding flow.
  std::unique_ptr<TaskQueueFactory> task_queue_factory;

  // Mandatory (e.g. modules/audio_device/include).
  // AudioDeviceModule that periocally provides audio input samples from
  // recording device (e.g. microphone) and requests audio output samples to
  // play through its output device (e.g. speaker).
  scoped_refptr<AudioDeviceModule> audio_device_module;

  // Optional (e.g. api/audio/builtin_audio_processing_builder).
  // AudioProcessing provides audio procesing functionalities (e.g. acoustic
  // echo cancellation, noise suppression, gain control, etc) on audio input
  // samples for VoipEngine. When optionally not set, VoipEngine will not have
  // such functionalities to perform on audio input samples received from
  // AudioDeviceModule.
  std::unique_ptr<AudioProcessingBuilderInterface> audio_processing_builder;

  // TODO: bugs.webrtc.org/369904700 - Remove when users are migrated to set
  // `audio_processing_builder` instead.
  [[deprecated]] scoped_refptr<AudioProcessing> audio_processing;
};

// Creates a VoipEngine instance with provided VoipEngineConfig.
std::unique_ptr<VoipEngine> CreateVoipEngine(VoipEngineConfig config);

}  // namespace webrtc

#endif  // API_VOIP_VOIP_ENGINE_FACTORY_H_