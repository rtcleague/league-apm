cmake_minimum_required(VERSION 3.4.1)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

# Add common compile definitions
add_definitions(
    -DWEBRTC_POSIX
    -DWEBRTC_LINUX
    -DWEBRTC_APM_DEBUG_DUMP=0
    -DWEBRTC_ENABLE_PROTOBUF=0
)

# Check for AVX2 support
include(CheckCXXCompilerFlag)
check_cxx_compiler_flag("-mavx2" COMPILER_SUPPORTS_AVX2)

# Create lists for regular and AVX2-specific source files
set(MODULES_SOURCES
    async_audio_processing/async_audio_processing.cc
    audio_coding/acm2/acm_receiver.cc
#    audio_coding/acm2/acm_receive_test.cc
    audio_coding/acm2/acm_remixing.cc
    audio_coding/acm2/acm_resampler.cc
#    audio_coding/acm2/acm_send_test.cc
    audio_coding/acm2/audio_coding_module.cc
    audio_coding/acm2/call_statistics.cc
    audio_coding/audio_network_adaptor/audio_network_adaptor_config.cc
    audio_coding/audio_network_adaptor/audio_network_adaptor_impl.cc
    audio_coding/audio_network_adaptor/bitrate_controller.cc
    audio_coding/audio_network_adaptor/channel_controller.cc
    audio_coding/audio_network_adaptor/controller.cc
    audio_coding/audio_network_adaptor/controller_manager.cc
#    audio_coding/audio_network_adaptor/debug_dump_writer.cc
    audio_coding/audio_network_adaptor/dtx_controller.cc
    audio_coding/audio_network_adaptor/event_log_writer.cc
    audio_coding/audio_network_adaptor/fec_controller_plr_based.cc
    audio_coding/audio_network_adaptor/frame_length_controller.cc
    audio_coding/audio_network_adaptor/frame_length_controller_v2.cc
    audio_coding/codecs/cng/audio_encoder_cng.cc
    audio_coding/codecs/cng/webrtc_cng.cc
    audio_coding/codecs/g711/audio_decoder_pcm.cc
    audio_coding/codecs/g711/audio_encoder_pcm.cc
#    audio_coding/codecs/g711/test/testG711.cc
    audio_coding/codecs/g722/audio_decoder_g722.cc
    audio_coding/codecs/g722/audio_encoder_g722.cc
#    audio_coding/codecs/g722/test/testG722.cc
    audio_coding/codecs/ilbc/audio_decoder_ilbc.cc
    audio_coding/codecs/ilbc/audio_encoder_ilbc.cc
#    audio_coding/codecs/ilbc/test/empty.cc
    audio_coding/codecs/isac/empty.cc
    audio_coding/codecs/isac/fix/source/audio_decoder_isacfix.cc
    audio_coding/codecs/isac/fix/source/audio_encoder_isacfix.cc
#    audio_coding/codecs/isac/fix/test/isac_speed_test.cc
#    audio_coding/codecs/isac/fix/test/kenny.cc
#    audio_coding/codecs/isac/isac_webrtc_api_test.cc
    audio_coding/codecs/isac/main/source/audio_decoder_isac.cc
    audio_coding/codecs/isac/main/source/audio_encoder_isac.cc
    audio_coding/codecs/isac/main/source/isac_vad.c
    audio_coding/codecs/isac/main/source/pitch_estimator.c
    audio_coding/codecs/isac/main/source/filter_functions.c
    audio_coding/codecs/isac/main/source/pitch_filter.c
    #    audio_coding/codecs/isac/main/test/ReleaseTest-API/ReleaseTest-API.cc
#    audio_coding/codecs/isac/main/test/SwitchingSampRate/SwitchingSampRate.cc
    audio_coding/codecs/legacy_encoded_audio_frame.cc
    audio_coding/codecs/opus/audio_coder_opus_common.cc
    audio_coding/codecs/opus/audio_decoder_multi_channel_opus_impl.cc
    audio_coding/codecs/opus/audio_decoder_opus.cc
    audio_coding/codecs/opus/audio_encoder_multi_channel_opus_impl.cc
    audio_coding/codecs/opus/audio_encoder_opus.cc
#    audio_coding/codecs/opus/opus_fec_test.cc
    audio_coding/codecs/opus/opus_interface.cc
#    audio_coding/codecs/opus/opus_speed_test.cc
#    audio_coding/codecs/opus/test/audio_ring_buffer.cc
#    audio_coding/codecs/opus/test/blocker.cc
#    audio_coding/codecs/opus/test/lapped_transform.cc
    audio_coding/codecs/pcm16b/audio_decoder_pcm16b.cc
    audio_coding/codecs/pcm16b/audio_encoder_pcm16b.cc
    audio_coding/codecs/pcm16b/pcm16b_common.cc
    audio_coding/codecs/red/audio_encoder_copy_red.cc
#    audio_coding/codecs/tools/audio_codec_speed_test.cc
    audio_coding/neteq/accelerate.cc
    audio_coding/neteq/accelerate.h
    audio_coding/neteq/audio_multi_vector.cc
    audio_coding/neteq/audio_vector.cc
    audio_coding/neteq/background_noise.cc
    audio_coding/neteq/buffer_level_filter.cc
    audio_coding/neteq/comfort_noise.cc
    audio_coding/neteq/cross_correlation.cc
    audio_coding/neteq/decision_logic.cc
    audio_coding/neteq/decoder_database.cc
    audio_coding/neteq/default_neteq_factory.cc
    audio_coding/neteq/delay_manager.cc
    audio_coding/neteq/dsp_helper.cc
    audio_coding/neteq/dtmf_buffer.cc
    audio_coding/neteq/dtmf_tone_generator.cc
    audio_coding/neteq/expand.cc
    audio_coding/neteq/expand_uma_logger.cc
    audio_coding/neteq/histogram.cc
    audio_coding/neteq/merge.cc
    audio_coding/neteq/nack_tracker.cc
    audio_coding/neteq/neteq_impl.cc
    audio_coding/neteq/normal.cc
    audio_coding/neteq/packet.cc
    audio_coding/neteq/packet_buffer.cc
    audio_coding/neteq/post_decode_vad.cc
    audio_coding/neteq/preemptive_expand.cc
    audio_coding/neteq/random_vector.cc
    audio_coding/neteq/red_payload_splitter.cc
    audio_coding/neteq/statistics_calculator.cc
    audio_coding/neteq/sync_buffer.cc
#    audio_coding/neteq/test/neteq_decoding_test.cc
#    audio_coding/neteq/test/neteq_ilbc_quality_test.cc
#    audio_coding/neteq/test/neteq_isac_quality_test.cc
#    audio_coding/neteq/test/neteq_opus_quality_test.cc
#    audio_coding/neteq/test/neteq_pcm16b_quality_test.cc
#    audio_coding/neteq/test/neteq_pcmu_quality_test.cc
#    audio_coding/neteq/test/neteq_speed_test.cc
#    audio_coding/neteq/test/result_sink.cc
    audio_coding/neteq/timestamp_scaler.cc
    audio_coding/neteq/time_stretch.cc
#    audio_coding/neteq/tools/audio_loop.cc
#    audio_coding/neteq/tools/audio_sink.cc
#    audio_coding/neteq/tools/constant_pcm_packet_source.cc
#    audio_coding/neteq/tools/encode_neteq_input.cc
#    audio_coding/neteq/tools/fake_decode_from_file.cc
#    audio_coding/neteq/tools/initial_packet_inserter_neteq_input.cc
#    audio_coding/neteq/tools/input_audio_file.cc
#    audio_coding/neteq/tools/neteq_delay_analyzer.cc
#    audio_coding/neteq/tools/neteq_event_log_input.cc
#    audio_coding/neteq/tools/neteq_input.cc
#    audio_coding/neteq/tools/neteq_packet_source_input.cc
#    audio_coding/neteq/tools/neteq_performance_test.cc
#    audio_coding/neteq/tools/neteq_quality_test.cc
#    audio_coding/neteq/tools/neteq_replacement_input.cc
#    audio_coding/neteq/tools/neteq_rtpplay.cc
#    audio_coding/neteq/tools/neteq_stats_getter.cc
#    audio_coding/neteq/tools/neteq_stats_plotter.cc
#    audio_coding/neteq/tools/neteq_test.cc
#    audio_coding/neteq/tools/neteq_test_factory.cc
#    audio_coding/neteq/tools/packet.cc
#    audio_coding/neteq/tools/packet_source.cc
#    audio_coding/neteq/tools/resample_input_audio_file.cc
#    audio_coding/neteq/tools/rtc_event_log_source.cc
#    audio_coding/neteq/tools/rtpcat.cc
#    audio_coding/neteq/tools/rtp_analyze.cc
#    audio_coding/neteq/tools/rtp_encode.cc
#    audio_coding/neteq/tools/rtp_file_source.cc
#    audio_coding/neteq/tools/rtp_generator.cc
#    audio_coding/neteq/tools/rtp_jitter.cc
#    audio_coding/test/Channel.cc
#    audio_coding/test/EncodeDecodeTest.cc
#    audio_coding/test/iSACTest.cc
#    audio_coding/test/opus_test.cc
#    audio_coding/test/PacketLossTest.cc
#    audio_coding/test/PCMFile.cc
#    audio_coding/test/RTPFile.cc
#    audio_coding/test/TestAllCodecs.cc
#    audio_coding/test/Tester.cc
#    audio_coding/test/TestRedFec.cc
#    audio_coding/test/TestStereo.cc
#    audio_coding/test/TestVADDTX.cc
#    audio_coding/test/TwoWayCommunication.cc
#    audio_device/android/aaudio_player.cc
#    audio_device/android/aaudio_recorder.cc
#    audio_device/android/aaudio_wrapper.cc
#    audio_device/android/audio_manager.cc
#    audio_device/android/audio_record_jni.cc
#    audio_device/android/audio_track_jni.cc
#    audio_device/android/build_info.cc
#    audio_device/android/ensure_initialized.cc
#    audio_device/android/opensles_common.cc
#   audio_device/android/opensles_player.cc
#  audio_device/android/opensles_recorder.cc
#    audio_device/audio_device_buffer.cc
#    audio_device/audio_device_data_observer.cc
#    audio_device/audio_device_generic.cc
#    audio_device/audio_device_impl.cc
#    audio_device/audio_device_name.cc
#    audio_device/dummy/audio_device_dummy.cc
#    audio_device/dummy/file_audio_device.cc
#    audio_device/dummy/file_audio_device_factory.cc
#    audio_device/fine_audio_buffer.cc
#    audio_device/include/audio_device_factory.cc
#    audio_device/include/test_audio_device.cc
#    audio_device/linux/alsasymboltable_linux.cc
#    audio_device/linux/audio_device_alsa_linux.cc
#    audio_device/linux/audio_device_pulse_linux.cc
#    audio_device/linux/audio_mixer_manager_alsa_linux.cc
#    audio_device/linux/audio_mixer_manager_pulse_linux.cc
#    audio_device/linux/latebindingsymboltable_linux.cc
#    audio_device/linux/pulseaudiosymboltable_linux.cc
#    audio_device/mac/audio_device_mac.cc
#    audio_device/mac/audio_mixer_manager_mac.cc
#    audio_device/win/audio_device_core_win.cc
#    audio_device/win/audio_device_module_win.cc
#    audio_device/win/core_audio_base_win.cc
#    audio_device/win/core_audio_input_win.cc
#    audio_device/win/core_audio_output_win.cc
#    audio_device/win/core_audio_utility_win.cc
    audio_mixer/audio_frame_manipulator.cc
    audio_mixer/audio_mixer_impl.cc
#    audio_mixer/audio_mixer_test.cc
    audio_mixer/default_output_rate_calculator.cc
    audio_mixer/frame_combiner.cc
    audio_mixer/gain_change_calculator.cc
    audio_mixer/sine_wave_generator.cc
    audio_processing/aec3/adaptive_fir_filter.cc
    audio_processing/aec3/adaptive_fir_filter_erl.cc
    audio_processing/aec3/aec3_common.cc
    audio_processing/aec3/aec3_fft.cc
    audio_processing/aec3/aec_state.cc
    audio_processing/aec3/alignment_mixer.cc
    audio_processing/aec3/api_call_jitter_metrics.cc
    audio_processing/aec3/block_buffer.cc
    audio_processing/aec3/block_delay_buffer.cc
    audio_processing/aec3/block_framer.cc
    audio_processing/aec3/block_processor.cc
    audio_processing/aec3/block_processor_metrics.cc
    audio_processing/aec3/clockdrift_detector.cc
    audio_processing/aec3/coarse_filter_update_gain.cc
    audio_processing/aec3/comfort_noise_generator.cc
    audio_processing/aec3/decimator.cc
    audio_processing/aec3/dominant_nearend_detector.cc
    audio_processing/aec3/downsampled_render_buffer.cc
    audio_processing/aec3/echo_audibility.cc
    audio_processing/aec3/echo_canceller3.cc
    audio_processing/aec3/echo_path_delay_estimator.cc
    audio_processing/aec3/echo_path_variability.cc
    audio_processing/aec3/echo_remover.cc
    audio_processing/aec3/echo_remover_metrics.cc
    audio_processing/aec3/erle_estimator.cc
    audio_processing/aec3/erl_estimator.cc
    audio_processing/aec3/fft_buffer.cc
    audio_processing/aec3/frame_blocker.cc
    audio_processing/aec3/fullband_erle_estimator.cc
    audio_processing/aec3/matched_filter.cc
    audio_processing/aec3/matched_filter_lag_aggregator.cc
#    audio_processing/aec3/mock/mock_block_processor.cc
#    audio_processing/aec3/mock/mock_echo_remover.cc
#    audio_processing/aec3/mock/mock_render_delay_buffer.cc
#    audio_processing/aec3/mock/mock_render_delay_controller.cc
    audio_processing/aec3/moving_average.cc
    audio_processing/aec3/refined_filter_update_gain.cc
    audio_processing/aec3/render_buffer.cc
    audio_processing/aec3/render_delay_buffer.cc
    audio_processing/aec3/render_delay_controller.cc
    audio_processing/aec3/render_delay_controller_metrics.cc
    audio_processing/aec3/render_signal_analyzer.cc
    audio_processing/aec3/residual_echo_estimator.cc
    audio_processing/aec3/reverb_decay_estimator.cc
    audio_processing/aec3/reverb_frequency_response.cc
    audio_processing/aec3/reverb_model.cc
    audio_processing/aec3/reverb_model_estimator.cc
    audio_processing/aec3/signal_dependent_erle_estimator.cc
    audio_processing/aec3/spectrum_buffer.cc
    audio_processing/aec3/stationarity_estimator.cc
    audio_processing/aec3/subband_erle_estimator.cc
    audio_processing/aec3/subband_nearend_detector.cc
    audio_processing/aec3/subtractor.cc
    audio_processing/aec3/subtractor_output.cc
    audio_processing/aec3/subtractor_output_analyzer.cc
    audio_processing/aec3/suppression_filter.cc
    audio_processing/aec3/suppression_gain.cc
    audio_processing/aec3/transparent_mode.cc
    audio_processing/agc/agc.cc
    audio_processing/agc/agc_manager_direct.cc
    audio_processing/agc/clipping_predictor.cc
    audio_processing/agc/clipping_predictor_evaluator.cc
    audio_processing/agc/clipping_predictor_level_buffer.cc
    audio_processing/agc/legacy/analog_agc.cc
    audio_processing/agc/legacy/digital_agc.cc
    audio_processing/agc/loudness_histogram.cc
    audio_processing/agc/utility.cc
    audio_processing/agc2/adaptive_agc.cc
    audio_processing/agc2/adaptive_digital_gain_applier.cc
    audio_processing/agc2/adaptive_mode_level_estimator.cc
#    audio_processing/agc2/agc2_testing_common.cc
    audio_processing/agc2/biquad_filter.cc
    audio_processing/agc2/compute_interpolated_gain_curve.cc
    audio_processing/agc2/cpu_features.cc
    audio_processing/agc2/down_sampler.cc
    audio_processing/agc2/fixed_digital_level_estimator.cc
    audio_processing/agc2/gain_applier.cc
    audio_processing/agc2/interpolated_gain_curve.cc
    audio_processing/agc2/limiter.cc
    audio_processing/agc2/limiter_db_gain_curve.cc
    audio_processing/agc2/noise_level_estimator.cc
    audio_processing/agc2/noise_spectrum_estimator.cc
    audio_processing/agc2/rnn_vad/auto_correlation.cc
    audio_processing/agc2/rnn_vad/features_extraction.cc
    audio_processing/agc2/rnn_vad/lp_residual.cc
    audio_processing/agc2/rnn_vad/pitch_search.cc
    audio_processing/agc2/rnn_vad/pitch_search_internal.cc
    audio_processing/agc2/rnn_vad/rnn.cc
    audio_processing/agc2/rnn_vad/rnn_fc.cc
    audio_processing/agc2/rnn_vad/rnn_gru.cc
    audio_processing/agc2/rnn_vad/rnn_vad_tool.cc
    audio_processing/agc2/rnn_vad/spectral_features.cc
    audio_processing/agc2/rnn_vad/spectral_features_internal.cc
#    audio_processing/agc2/rnn_vad/test_utils.cc
#    audio_processing/agc2/rnn_vad/vector_math_avx2.cc
    audio_processing/agc2/saturation_protector.cc
    audio_processing/agc2/saturation_protector_buffer.cc
    audio_processing/agc2/signal_classifier.cc
    audio_processing/agc2/vad_with_level.cc
    audio_processing/agc2/vector_float_frame.cc
    audio_processing/audio_buffer.cc
    audio_processing/audio_processing_builder_impl.cc
    audio_processing/audio_processing_impl.cc
    audio_processing/capture_levels_adjuster/audio_samples_scaler.cc
    audio_processing/capture_levels_adjuster/capture_levels_adjuster.cc
#    audio_processing/echo_control_mobile_impl.cc
    audio_processing/echo_detector/circular_buffer.cc
    audio_processing/echo_detector/mean_variance_estimator.cc
    audio_processing/echo_detector/moving_max.cc
    audio_processing/echo_detector/normalized_covariance_estimator.cc
    audio_processing/gain_controller2.cc
    audio_processing/gain_control_impl.cc
    audio_processing/high_pass_filter.cc
    audio_processing/include/aec_dump.cc
    audio_processing/include/audio_frame_proxies.cc
    audio_processing/include/audio_processing.cc
    audio_processing/include/audio_processing_statistics.cc
    audio_processing/include/config.cc
    audio_processing/level_estimator.cc
    audio_processing/logging/apm_data_dumper.cc
    audio_processing/ns/fast_math.cc
    audio_processing/ns/histograms.cc
    audio_processing/ns/noise_estimator.cc
    audio_processing/ns/noise_suppressor.cc
    audio_processing/ns/ns_fft.cc
    audio_processing/ns/prior_signal_model.cc
    audio_processing/ns/prior_signal_model_estimator.cc
    audio_processing/ns/quantile_noise_estimator.cc
    audio_processing/ns/signal_model.cc
    audio_processing/ns/signal_model_estimator.cc
    audio_processing/ns/speech_probability_estimator.cc
    audio_processing/ns/suppression_params.cc
    audio_processing/ns/wiener_filter.cc
    audio_processing/optionally_built_submodule_creators.cc
    audio_processing/residual_echo_detector.cc
    audio_processing/rms_level.cc
    audio_processing/splitting_filter.cc
#    audio_processing/test/aec_dump_based_simulator.cc
#    audio_processing/test/api_call_statistics.cc
#    audio_processing/test/audioproc_float_impl.cc
#    audio_processing/test/audio_buffer_tools.cc
#    audio_processing/test/audio_processing_builder_for_testing.cc
#    audio_processing/test/audio_processing_simulator.cc
#    audio_processing/test/bitexactness_tools.cc
#    audio_processing/test/conversational_speech/config.cc
#    audio_processing/test/conversational_speech/generator.cc
#    audio_processing/test/conversational_speech/mock_wavreader.cc
#    audio_processing/test/conversational_speech/mock_wavreader_factory.cc
#    audio_processing/test/conversational_speech/multiend_call.cc
#    audio_processing/test/conversational_speech/simulator.cc
#    audio_processing/test/conversational_speech/timing.cc
#    audio_processing/test/conversational_speech/wavreader_factory.cc
#    audio_processing/test/debug_dump_replayer.cc
#    audio_processing/test/debug_dump_test.cc
#    audio_processing/test/echo_canceller_test_tools.cc
#    audio_processing/test/fake_recording_device.cc
#    audio_processing/test/performance_timer.cc
#    audio_processing/test/protobuf_utils.cc
#    audio_processing/test/py_quality_assessment/quality_assessment/apm_vad.cc
#    audio_processing/test/py_quality_assessment/quality_assessment/data_access.py
#    audio_processing/test/py_quality_assessment/quality_assessment/fake_polqa.cc
#    audio_processing/test/py_quality_assessment/quality_assessment/sound_level.cc
#    audio_processing/test/py_quality_assessment/quality_assessment/vad.cc
#    audio_processing/test/runtime_setting_util.cc
#    audio_processing/test/simulator_buffers.cc
#    audio_processing/test/test_utils.cc
#    audio_processing/test/wav_based_simulator.cc
    audio_processing/three_band_filter_bank.cc
    audio_processing/transient/click_annotate.cc
    audio_processing/transient/file_utils.cc
    audio_processing/transient/moving_moments.cc
    audio_processing/transient/transient_detector.cc
#    audio_processing/transient/transient_suppression_test.cc
    audio_processing/transient/transient_suppressor_impl.cc
    audio_processing/transient/wpd_node.cc
    audio_processing/transient/wpd_tree.cc
    audio_processing/typing_detection.cc
    audio_processing/utility/cascaded_biquad_filter.cc
    audio_processing/utility/delay_estimator.cc
    audio_processing/utility/delay_estimator_wrapper.cc
    audio_processing/utility/pffft_wrapper.cc
    audio_processing/vad/gmm.cc
    audio_processing/vad/pitch_based_vad.cc
    audio_processing/vad/pitch_internal.cc
    audio_processing/vad/pole_zero_filter.cc
    audio_processing/vad/standalone_vad.cc
    audio_processing/vad/vad_audio_proc.cc
    audio_processing/vad/vad_circular_buffer.cc
    audio_processing/vad/voice_activity_detector.cc
    audio_processing/voice_detection.cc
    congestion_controller/goog_cc
    congestion_controller/goog_cc/acknowledged_bitrate_estimator.cc
    congestion_controller/goog_cc/acknowledged_bitrate_estimator.h
    congestion_controller/goog_cc/acknowledged_bitrate_estimator_interface.cc
    congestion_controller/goog_cc/acknowledged_bitrate_estimator_interface.h
    congestion_controller/goog_cc/alr_detector.cc
    congestion_controller/goog_cc/alr_detector.h
    congestion_controller/goog_cc/bitrate_estimator.cc
    congestion_controller/goog_cc/bitrate_estimator.h
    congestion_controller/goog_cc/BUILD.gn
    congestion_controller/goog_cc/congestion_window_pushback_controller.cc
    congestion_controller/goog_cc/congestion_window_pushback_controller.h
    congestion_controller/goog_cc/delay_based_bwe.cc
    congestion_controller/goog_cc/delay_based_bwe.h
    congestion_controller/goog_cc/delay_increase_detector_interface.h
    congestion_controller/goog_cc/goog_cc_network_control.cc
    congestion_controller/goog_cc/goog_cc_network_control.h
    congestion_controller/goog_cc/inter_arrival_delta.cc
    congestion_controller/goog_cc/inter_arrival_delta.h
    congestion_controller/goog_cc/link_capacity_estimator.cc
    congestion_controller/goog_cc/link_capacity_estimator.h
    congestion_controller/goog_cc/loss_based_bandwidth_estimation.cc
    congestion_controller/goog_cc/loss_based_bandwidth_estimation.h
    congestion_controller/goog_cc/probe_bitrate_estimator.cc
    congestion_controller/goog_cc/probe_bitrate_estimator.h
    congestion_controller/goog_cc/probe_controller.cc
    congestion_controller/goog_cc/probe_controller.h
    congestion_controller/goog_cc/robust_throughput_estimator.cc
    congestion_controller/goog_cc/robust_throughput_estimator.h
    congestion_controller/goog_cc/send_side_bandwidth_estimation.cc
    congestion_controller/goog_cc/send_side_bandwidth_estimation.h
#    congestion_controller/goog_cc/test
#    congestion_controller/goog_cc/test/goog_cc_printer.cc
#    congestion_controller/goog_cc/test/goog_cc_printer.h
    congestion_controller/goog_cc/trendline_estimator.cc
    congestion_controller/goog_cc/trendline_estimator.h
    congestion_controller/pcc
    congestion_controller/pcc/bitrate_controller.cc
    congestion_controller/pcc/bitrate_controller.h
    congestion_controller/pcc/BUILD.gn
    congestion_controller/pcc/monitor_interval.cc
    congestion_controller/pcc/monitor_interval.h
    congestion_controller/pcc/pcc_factory.cc
    congestion_controller/pcc/pcc_factory.h
    congestion_controller/pcc/pcc_network_controller.cc
    congestion_controller/pcc/pcc_network_controller.h
    congestion_controller/pcc/rtt_tracker.cc
    congestion_controller/pcc/rtt_tracker.h
    congestion_controller/pcc/utility_function.cc
    congestion_controller/pcc/utility_function.h
    congestion_controller/receive_side_congestion_controller.cc
    congestion_controller/remb_throttler.cc
#    congestion_controller/rtp/control_handler.cc
#    congestion_controller/rtp/transport_feedback_adapter.cc
#    congestion_controller/rtp/transport_feedback_demuxer.cc
#    desktop_capture/blank_detector_desktop_capturer_wrapper.cc
#    desktop_capture/cropped_desktop_frame.cc
#    desktop_capture/cropping_window_capturer.cc
#    desktop_capture/cropping_window_capturer_win.cc
#    desktop_capture/desktop_and_cursor_composer.cc
#    desktop_capture/desktop_capturer.cc
#    desktop_capture/desktop_capturer_differ_wrapper.cc
#    desktop_capture/desktop_capturer_wrapper.cc
#    desktop_capture/desktop_capture_metrics_helper.cc
#    desktop_capture/desktop_capture_options.cc
#    desktop_capture/desktop_frame.cc
#    desktop_capture/desktop_frame_generator.cc
#    desktop_capture/desktop_frame_rotation.cc
#    desktop_capture/desktop_frame_win.cc
#    desktop_capture/desktop_geometry.cc
#    desktop_capture/desktop_region.cc
#    desktop_capture/differ_block.cc
#    desktop_capture/differ_vector_sse2.cc
#    desktop_capture/fake_desktop_capturer.cc
#    desktop_capture/fallback_desktop_capturer_wrapper.cc
#    desktop_capture/full_screen_application_handler.cc
#    desktop_capture/full_screen_window_detector.cc
#    desktop_capture/linux/base_capturer_pipewire.cc
#    desktop_capture/linux/mouse_cursor_monitor_x11.cc
#    desktop_capture/linux/screen_capturer_x11.cc
#    desktop_capture/linux/shared_x_display.cc
#    desktop_capture/linux/window_capturer_x11.cc
#    desktop_capture/linux/window_finder_x11.cc
#    desktop_capture/linux/window_list_utils.cc
#    desktop_capture/linux/x_atom_cache.cc
#    desktop_capture/linux/x_error_trap.cc
#    desktop_capture/linux/x_server_pixel_buffer.cc
#    desktop_capture/linux/x_window_property.cc
#    desktop_capture/mac/desktop_configuration_monitor.cc
#    desktop_capture/mac/full_screen_mac_application_handler.cc
#    desktop_capture/mac/window_list_utils.cc
#    desktop_capture/mock_desktop_capturer_callback.cc
#    desktop_capture/mouse_cursor.cc
#    desktop_capture/mouse_cursor_monitor_linux.cc
#    desktop_capture/mouse_cursor_monitor_null.cc
#    desktop_capture/mouse_cursor_monitor_win.cc
#    desktop_capture/resolution_tracker.cc
#    desktop_capture/rgba_color.cc
#    desktop_capture/screen_capturer_helper.cc
#    desktop_capture/screen_capturer_integration_test.cc
#    desktop_capture/screen_capturer_linux.cc
#    desktop_capture/screen_capturer_null.cc
#    desktop_capture/screen_capturer_win.cc
#    desktop_capture/screen_drawer.cc
#    desktop_capture/screen_drawer_linux.cc
#    desktop_capture/screen_drawer_lock_posix.cc
#    desktop_capture/screen_drawer_mac.cc
#    desktop_capture/screen_drawer_win.cc
#    desktop_capture/shared_desktop_frame.cc
#    desktop_capture/shared_memory.cc
#    desktop_capture/test_utils.cc
#    desktop_capture/win/cursor.cc
#    desktop_capture/win/d3d_device.cc
#    desktop_capture/win/desktop.cc
#    desktop_capture/win/desktop_capture_utils.cc
#    desktop_capture/win/display_configuration_monitor.cc
#    desktop_capture/win/dxgi_adapter_duplicator.cc
#    desktop_capture/win/dxgi_context.cc
#    desktop_capture/win/dxgi_duplicator_controller.cc
#    desktop_capture/win/dxgi_frame.cc
#    desktop_capture/win/dxgi_output_duplicator.cc
#    desktop_capture/win/dxgi_texture.cc
#    desktop_capture/win/dxgi_texture_mapping.cc
#    desktop_capture/win/dxgi_texture_staging.cc
#    desktop_capture/win/full_screen_win_application_handler.cc
#    desktop_capture/win/scoped_thread_desktop.cc
#    desktop_capture/win/screen_capturer_win_directx.cc
#    desktop_capture/win/screen_capturer_win_gdi.cc
#    desktop_capture/win/screen_capturer_win_magnifier.cc
#    desktop_capture/win/screen_capture_utils.cc
#    desktop_capture/win/selected_window_context.cc
#    desktop_capture/win/test_support/test_window.cc
#    desktop_capture/win/wgc_capturer_win.cc
#    desktop_capture/win/wgc_capture_session.cc
#    desktop_capture/win/wgc_capture_source.cc
#    desktop_capture/win/wgc_desktop_frame.cc
#    desktop_capture/win/window_capturer_win_gdi.cc
#    desktop_capture/win/window_capture_utils.cc
#    desktop_capture/window_capturer_linux.cc
#    desktop_capture/window_capturer_null.cc
#    desktop_capture/window_capturer_win.cc
#    desktop_capture/window_finder.cc
#    desktop_capture/window_finder_win.cc
    pacing/bitrate_prober.cc
    pacing/interval_budget.cc
    pacing/paced_sender.cc
    pacing/pacing_controller.cc
    pacing/packet_router.cc
    pacing/round_robin_packet_queue.cc
    pacing/task_queue_paced_sender.cc
    remote_bitrate_estimator/aimd_rate_control.cc
    remote_bitrate_estimator/bwe_defines.cc
    remote_bitrate_estimator/inter_arrival.cc
    remote_bitrate_estimator/overuse_detector.cc
    remote_bitrate_estimator/overuse_estimator.cc
    remote_bitrate_estimator/packet_arrival_map.cc
#    remote_bitrate_estimator/packet_arrival_map_test.cc
    remote_bitrate_estimator/remote_bitrate_estimator_abs_send_time.cc
    remote_bitrate_estimator/remote_bitrate_estimator_single_stream.cc
    remote_bitrate_estimator/remote_estimator_proxy.cc
#    remote_bitrate_estimator/test/bwe_test_logging.cc
#    remote_bitrate_estimator/tools/bwe_rtp.cc
#    remote_bitrate_estimator/tools/rtp_to_text.cc
    rtp_rtcp/include/report_block_data.cc
    rtp_rtcp/include/rtp_rtcp_defines.cc
    rtp_rtcp/source/absolute_capture_time_interpolator.cc
    rtp_rtcp/source/absolute_capture_time_sender.cc
    rtp_rtcp/source/active_decode_targets_helper.cc
    rtp_rtcp/source/capture_clock_offset_updater.cc
    rtp_rtcp/source/create_video_rtp_depacketizer.cc
    rtp_rtcp/source/deprecated/deprecated_rtp_sender_egress.cc
    rtp_rtcp/source/dtmf_queue.cc
    rtp_rtcp/source/fec_private_tables_bursty.cc
    rtp_rtcp/source/fec_private_tables_random.cc
#    rtp_rtcp/source/fec_test_helper.cc
    rtp_rtcp/source/flexfec_header_reader_writer.cc
    rtp_rtcp/source/flexfec_receiver.cc
    rtp_rtcp/source/flexfec_sender.cc
    rtp_rtcp/source/forward_error_correction.cc
    rtp_rtcp/source/forward_error_correction_internal.cc
    rtp_rtcp/source/packet_loss_stats.cc
    rtp_rtcp/source/packet_sequencer.cc
    rtp_rtcp/source/receive_statistics_impl.cc
    rtp_rtcp/source/remote_ntp_time_estimator.cc
    rtp_rtcp/source/rtcp_nack_stats.cc
    rtp_rtcp/source/rtcp_packet/app.cc
    rtp_rtcp/source/rtcp_packet/bye.cc
    rtp_rtcp/source/rtcp_packet/common_header.cc
    rtp_rtcp/source/rtcp_packet/compound_packet.cc
    rtp_rtcp/source/rtcp_packet/dlrr.cc
    rtp_rtcp/source/rtcp_packet/extended_jitter_report.cc
    rtp_rtcp/source/rtcp_packet/extended_reports.cc
    rtp_rtcp/source/rtcp_packet/fir.cc
    rtp_rtcp/source/rtcp_packet/loss_notification.cc
    rtp_rtcp/source/rtcp_packet/nack.cc
    rtp_rtcp/source/rtcp_packet/pli.cc
    rtp_rtcp/source/rtcp_packet/psfb.cc
    rtp_rtcp/source/rtcp_packet/rapid_resync_request.cc
    rtp_rtcp/source/rtcp_packet/receiver_report.cc
    rtp_rtcp/source/rtcp_packet/remb.cc
    rtp_rtcp/source/rtcp_packet/remote_estimate.cc
    rtp_rtcp/source/rtcp_packet/report_block.cc
    rtp_rtcp/source/rtcp_packet/rrtr.cc
    rtp_rtcp/source/rtcp_packet/rtpfb.cc
    rtp_rtcp/source/rtcp_packet/sdes.cc
    rtp_rtcp/source/rtcp_packet/sender_report.cc
    rtp_rtcp/source/rtcp_packet/target_bitrate.cc
    rtp_rtcp/source/rtcp_packet/tmmbn.cc
    rtp_rtcp/source/rtcp_packet/tmmbr.cc
    rtp_rtcp/source/rtcp_packet/tmmb_item.cc
    rtp_rtcp/source/rtcp_packet/transport_feedback.cc
    rtp_rtcp/source/rtcp_packet.cc
    rtp_rtcp/source/rtcp_receiver.cc
    rtp_rtcp/source/rtcp_sender.cc
    rtp_rtcp/source/rtcp_transceiver.cc
    rtp_rtcp/source/rtcp_transceiver_config.cc
    rtp_rtcp/source/rtcp_transceiver_impl.cc
    rtp_rtcp/source/rtp_dependency_descriptor_extension.cc
    rtp_rtcp/source/rtp_dependency_descriptor_reader.cc
    rtp_rtcp/source/rtp_dependency_descriptor_writer.cc
    rtp_rtcp/source/rtp_descriptor_authentication.cc
    rtp_rtcp/source/rtp_format.cc
    rtp_rtcp/source/rtp_format_h264.cc
    rtp_rtcp/source/rtp_format_video_generic.cc
    rtp_rtcp/source/rtp_format_vp8.cc
#    rtp_rtcp/source/rtp_format_vp8_test_helper.cc
    rtp_rtcp/source/rtp_format_vp9.cc
    rtp_rtcp/source/rtp_generic_frame_descriptor.cc
    rtp_rtcp/source/rtp_generic_frame_descriptor_extension.cc
    rtp_rtcp/source/rtp_header_extensions.cc
    rtp_rtcp/source/rtp_header_extension_map.cc
    rtp_rtcp/source/rtp_header_extension_size.cc
    rtp_rtcp/source/rtp_packet.cc
    rtp_rtcp/source/rtp_packetizer_av1.cc
#    rtp_rtcp/source/rtp_packetizer_av1_test_helper.cc
    rtp_rtcp/source/rtp_packet_history.cc
    rtp_rtcp/source/rtp_packet_received.cc
    rtp_rtcp/source/rtp_packet_to_send.cc
#    rtp_rtcp/source/rtp_rtcp_impl.cc
#    rtp_rtcp/source/rtp_rtcp_impl2.cc
#    rtp_rtcp/source/rtp_sender.cc
#    rtp_rtcp/source/rtp_sender_audio.cc
#    rtp_rtcp/source/rtp_sender_egress.cc
#    rtp_rtcp/source/rtp_sender_video.cc
#    rtp_rtcp/source/rtp_sender_video_frame_transformer_delegate.cc
#    rtp_rtcp/source/rtp_sequence_number_map.cc
#    rtp_rtcp/source/rtp_util.cc
#    rtp_rtcp/source/rtp_utility.cc
#    rtp_rtcp/source/rtp_video_header.cc
#    rtp_rtcp/source/rtp_video_layers_allocation_extension.cc
#    rtp_rtcp/source/source_tracker.cc
    rtp_rtcp/source/time_util.cc
    rtp_rtcp/source/tmmbr_help.cc
    rtp_rtcp/source/ulpfec_generator.cc
    rtp_rtcp/source/ulpfec_header_reader_writer.cc
    rtp_rtcp/source/ulpfec_receiver_impl.cc
    ../third_party/rnnoise/src/rnn_vad_weights.cc
    ../third_party/pffft/src/pffft.c
#    rtp_rtcp/source/video_rtp_depacketizer.cc
#    rtp_rtcp/source/video_rtp_depacketizer_av1.cc
#    rtp_rtcp/source/video_rtp_depacketizer_generic.cc
#    rtp_rtcp/source/video_rtp_depacketizer_h264.cc
#    rtp_rtcp/source/video_rtp_depacketizer_raw.cc
#    rtp_rtcp/source/video_rtp_depacketizer_vp8.cc
#    rtp_rtcp/source/video_rtp_depacketizer_vp9.cc
#    rtp_rtcp/test/testFec/test_fec.cc
#    rtp_rtcp/test/testFec/test_packet_masks_metrics.cc
#    utility/source/helpers_android.cc
#    utility/source/jvm_android.cc
    utility/source/process_thread_impl.cc
#    video_capture/device_info_impl.cc
#    video_capture/linux/device_info_linux.cc
#    video_capture/linux/video_capture_linux.cc
#    video_capture/video_capture_factory.cc
#    video_capture/video_capture_impl.cc
#    video_capture/windows/device_info_ds.cc
#    video_capture/windows/help_functions_ds.cc
#    video_capture/windows/sink_filter_ds.cc
#    video_capture/windows/video_capture_ds.cc
#    video_capture/windows/video_capture_factory_windows.cc
#    video_coding/chain_diff_calculator.cc
#    video_coding/codecs/av1/av1_svc_config.cc
#    video_coding/codecs/av1/libaom_av1_decoder.cc
#    video_coding/codecs/av1/libaom_av1_decoder_absent.cc
#    video_coding/codecs/av1/libaom_av1_encoder.cc
#    video_coding/codecs/av1/libaom_av1_encoder_absent.cc
#    video_coding/codecs/h264/h264.cc
#    video_coding/codecs/h264/h264_color_space.cc
#    video_coding/codecs/h264/h264_decoder_impl.cc
#    video_coding/codecs/h264/h264_encoder_impl.cc
#    video_coding/codecs/interface/libvpx_interface.cc
#    video_coding/codecs/multiplex/augmented_video_frame_buffer.cc
#    video_coding/codecs/multiplex/multiplex_decoder_adapter.cc
#    video_coding/codecs/multiplex/multiplex_encoded_image_packer.cc
#    video_coding/codecs/multiplex/multiplex_encoder_adapter.cc
#    video_coding/codecs/test/android_codec_factory_helper.cc
#    video_coding/codecs/test/encoded_video_frame_producer.cc
#    video_coding/codecs/test/videocodec_test_fixture_impl.cc
#    video_coding/codecs/test/videocodec_test_libaom.cc
#    video_coding/codecs/test/videocodec_test_libvpx.cc
#    video_coding/codecs/test/videocodec_test_mediacodec.cc
#    video_coding/codecs/test/videocodec_test_openh264.cc
#    video_coding/codecs/test/videocodec_test_stats_impl.cc
#    video_coding/codecs/test/videocodec_test_videotoolbox.cc
#    video_coding/codecs/test/videoprocessor.cc
#    video_coding/codecs/test/video_encoder_decoder_instantiation_tests.cc
#    video_coding/codecs/vp8/default_temporal_layers.cc
#    video_coding/codecs/vp8/libvpx_vp8_decoder.cc
#    video_coding/codecs/vp8/libvpx_vp8_encoder.cc
#    video_coding/codecs/vp8/libvpx_vp8_simulcast_test.cc
#    video_coding/codecs/vp8/screenshare_layers.cc
#    video_coding/codecs/vp8/temporal_layers_checker.cc
#    video_coding/codecs/vp9/libvpx_vp9_decoder.cc
#    video_coding/codecs/vp9/libvpx_vp9_encoder.cc
#    video_coding/codecs/vp9/svc_config.cc
#    video_coding/codecs/vp9/vp9.cc
#    video_coding/codecs/vp9/vp9_frame_buffer_pool.cc
#    video_coding/codec_timer.cc
#    video_coding/decoder_database.cc
#    video_coding/decoding_state.cc
#    video_coding/deprecated/nack_module.cc
#    video_coding/encoded_frame.cc
#    video_coding/event_wrapper.cc
#    video_coding/fec_controller_default.cc
#    video_coding/frame_buffer.cc
#    video_coding/frame_buffer2.cc
#    video_coding/frame_dependencies_calculator.cc
#    video_coding/frame_object.cc
#    video_coding/generic_decoder.cc
#    video_coding/h264_sprop_parameter_sets.cc
#    video_coding/h264_sps_pps_tracker.cc
#    video_coding/histogram.cc
#    video_coding/include/video_codec_interface.cc
#    video_coding/inter_frame_delay.cc
#    video_coding/jitter_buffer.cc
#    video_coding/jitter_estimator.cc
#    video_coding/jitter_estimator_tests.cc
#    video_coding/loss_notification_controller.cc
#    video_coding/media_opt_util.cc
#    video_coding/nack_module2.cc
#    video_coding/packet.cc
#    video_coding/packet_buffer.cc
#    video_coding/receiver.cc
#    video_coding/rtp_frame_id_only_ref_finder.cc
#    video_coding/rtp_frame_reference_finder.cc
#    video_coding/rtp_generic_ref_finder.cc
#    video_coding/rtp_seq_num_only_ref_finder.cc
#    video_coding/rtp_vp8_ref_finder.cc
#    video_coding/rtp_vp9_ref_finder.cc
#    video_coding/rtt_filter.cc
#    video_coding/session_info.cc
#    video_coding/svc/create_scalability_structure.cc
#    video_coding/svc/scalability_structure_full_svc.cc
#    video_coding/svc/scalability_structure_key_svc.cc
#    video_coding/svc/scalability_structure_l2t2_key_shift.cc
#    video_coding/svc/scalability_structure_simulcast.cc
#    video_coding/svc/scalability_structure_test_helpers.cc
#    video_coding/svc/scalable_video_controller_no_layering.cc
#    video_coding/svc/svc_rate_allocator.cc
#    video_coding/test/stream_generator.cc
#    video_coding/timestamp_map.cc
#    video_coding/timing.cc
#    video_coding/unique_timestamp_counter.cc
#    video_coding/utility/decoded_frames_history.cc
#    video_coding/utility/framerate_controller.cc
#    video_coding/utility/frame_dropper.cc
#    video_coding/utility/ivf_file_reader.cc
#    video_coding/utility/ivf_file_writer.cc
#    video_coding/utility/qp_parser.cc
#    video_coding/utility/quality_scaler.cc
#    video_coding/utility/simulcast_rate_allocator.cc
#    video_coding/utility/simulcast_test_fixture_impl.cc
#    video_coding/utility/simulcast_utility.cc
#    video_coding/utility/vp8_header_parser.cc
#    video_coding/utility/vp9_uncompressed_header_parser.cc
#    video_coding/video_codec_initializer.cc
#    video_coding/video_coding_defines.cc
#    video_coding/video_coding_impl.cc
#    video_coding/video_receiver.cc
#    video_coding/video_receiver2.cc
#    video_processing/test/denoiser_test.cc
#    video_processing/util/denoiser_filter.cc
#    video_processing/util/denoiser_filter_c.cc
#    video_processing/util/denoiser_filter_neon.cc
#    video_processing/util/denoiser_filter_sse2.cc
#    video_processing/util/noise_estimation.cc
#    video_processing/util/skin_detection.cc
#    video_processing/video_denoiser.cc
)

set(MODULES_AVX2_SOURCES
    audio_processing/aec3/vector_math_avx2.cc
)

# Add the main library target
add_library(webrtc_modules STATIC ${MODULES_SOURCES})

# Add AVX2-specific library target
add_library(webrtc_modules_avx2 STATIC ${MODULES_AVX2_SOURCES})

# Set AVX2 compile flags for the AVX2 target
target_compile_options(webrtc_modules_avx2 PRIVATE -mavx2 -mfma)

# Link libraries and set include directories for both targets
target_link_libraries(webrtc_modules
    PRIVATE
    webrtc_rtc_base
    webrtc_system_wrappers
)

target_link_libraries(webrtc_modules_avx2
    PRIVATE
    webrtc_rtc_base
    webrtc_system_wrappers
)

# Set include directories for both targets
target_include_directories(webrtc_modules
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/..
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/audio_processing/include
    async_audio_processing
    audio_coding
    audio_device
    audio_mixer
    audio_processing
    congestion_controller
    include
    pacing
    remote_bitrate_estimator
    rtp_rtcp
    third_party
    utility
)

target_include_directories(webrtc_modules_avx2
    PUBLIC
    ${CMAKE_CURRENT_SOURCE_DIR}/..
    ${CMAKE_CURRENT_SOURCE_DIR}
    ${CMAKE_CURRENT_SOURCE_DIR}/include
    ${CMAKE_CURRENT_SOURCE_DIR}/audio_processing/include
    async_audio_processing
    audio_coding
    audio_device
    audio_mixer
    audio_processing
    congestion_controller
    include
    pacing
    remote_bitrate_estimator
    rtp_rtcp
    third_party
    utility
)