cmake_minimum_required(VERSION 3.4.1)
set(SRC_FILES
        adaptation/adaptation_constraint.cc
        adaptation/broadcast_resource_listener.cc
        adaptation/degradation_preference_provider.cc
        adaptation/encoder_settings.cc
        adaptation/resource_adaptation_processor.cc
        adaptation/resource_adaptation_processor_interface.cc
#        adaptation/test/fake_adaptation_constraint.cc
#        adaptation/test/fake_frame_rate_provider.cc
#        adaptation/test/fake_resource.cc
#        adaptation/test/fake_video_stream_input_state_provider.cc
        adaptation/video_source_restrictions.cc
        adaptation/video_stream_adapter.cc
        adaptation/video_stream_input_state.cc
        adaptation/video_stream_input_state_provider.cc
        audio_receive_stream.cc
        audio_send_stream.cc
        audio_state.cc
        bitrate_allocator.cc
#        bitrate_estimator_tests.cc
        call.cc
        call_config.cc
        call_factory.cc
#        call_perf_tests.cc
        degraded_call.cc
        fake_network_pipe.cc
        flexfec_receive_stream.cc
        flexfec_receive_stream_impl.cc
#        rampup_tests.cc
        receive_time_calculator.cc
        rtp_bitrate_configurator.cc
        rtp_config.cc
        rtp_demuxer.cc
        rtp_payload_params.cc
        rtp_stream_receiver_controller.cc
        rtp_transport_controller_send.cc
        rtp_video_sender.cc
        rtx_receive_stream.cc
        simulated_network.cc
        syncable.cc
        version.cc
        video_receive_stream.cc
        video_send_stream.cc
)

add_library(webrtc_call ${SRC_FILES})
target_include_directories(webrtc_call PUBLIC 
                 adaptation
                 test
)