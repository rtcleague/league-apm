cmake_minimum_required(VERSION 3.4.1)
set(SRC_FILES
        adaptation/balanced_constraint.cc
        adaptation/bitrate_constraint.cc
        adaptation/encode_usage_resource.cc
        adaptation/overuse_frame_detector.cc
        adaptation/pixel_limit_resource.cc
        adaptation/quality_rampup_experiment_helper.cc
        adaptation/quality_scaler_resource.cc
        adaptation/video_stream_encoder_resource.cc
        adaptation/video_stream_encoder_resource_manager.cc
        alignment_adjuster.cc
        buffered_frame_decryptor.cc
        call_stats.cc
        call_stats2.cc
#        cpu_scaling_tests.cc
        encoder_bitrate_adjuster.cc
        encoder_overshoot_detector.cc
        encoder_rtcp_feedback.cc
#        end_to_end_tests/bandwidth_tests.cc
#        end_to_end_tests/call_operation_tests.cc
#        end_to_end_tests/codec_tests.cc
#        end_to_end_tests/config_tests.cc
#        end_to_end_tests/extended_reports_tests.cc
#        end_to_end_tests/fec_tests.cc
#        end_to_end_tests/frame_encryption_tests.cc
#        end_to_end_tests/histogram_tests.cc
#        end_to_end_tests/multi_codec_receive_tests.cc
#        end_to_end_tests/multi_stream_tester.cc
#        end_to_end_tests/multi_stream_tests.cc
#        end_to_end_tests/network_state_tests.cc
#        end_to_end_tests/resolution_bitrate_limits_tests.cc
#        end_to_end_tests/retransmission_tests.cc
#        end_to_end_tests/rtp_rtcp_tests.cc
#        end_to_end_tests/ssrc_tests.cc
#        end_to_end_tests/stats_tests.cc
#        end_to_end_tests/transport_feedback_tests.cc
        frame_dumping_decoder.cc
        frame_encode_metadata_writer.cc
#        full_stack_tests.cc
#        pc_full_stack_tests.cc
#        picture_id_tests.cc
        quality_limitation_reason_tracker.cc
#        quality_scaling_tests.cc
        quality_threshold.cc
        receive_statistics_proxy.cc
        receive_statistics_proxy2.cc
        report_block_stats.cc
        rtp_streams_synchronizer.cc
        rtp_streams_synchronizer2.cc
        rtp_video_stream_receiver.cc
        rtp_video_stream_receiver2.cc
        rtp_video_stream_receiver_frame_transformer_delegate.cc
#        screenshare_loopback.cc
        send_delay_stats.cc
        send_statistics_proxy.cc
        stats_counter.cc
        stream_synchronization.cc
#        sv_loopback.cc
        transport_adapter.cc
#        video_analyzer.cc
#        video_loopback.cc
#        video_loopback_main.cc
#        video_quality_observer.cc
#        video_quality_observer2.cc
#        video_quality_test.cc
        video_receive_stream.cc
        video_receive_stream2.cc
        video_send_stream.cc
        video_send_stream_impl.cc
#        video_send_stream_tests.cc
        video_source_sink_controller.cc
        video_stream_decoder.cc
        video_stream_decoder2.cc
        video_stream_decoder_impl.cc
        video_stream_encoder.cc
)

add_library(webrtc_video ${SRC_FILES})
target_include_directories(webrtc_video PUBLIC 
        adaptation
        end_to_end_tests
        g3doc
        test

)
