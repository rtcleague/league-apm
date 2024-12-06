cmake_minimum_required(VERSION 3.4.1)
set(SRC_FILES

            audio_level.cc
            audio_receive_stream.cc
            audio_send_stream.cc
#            audio_send_stream_tests.cc
            audio_state.cc
            audio_transport_impl.cc
            channel_receive.cc
            channel_receive_frame_transformer_delegate.cc
            channel_send.cc
            channel_send_frame_transformer_delegate.cc
            null_audio_poller.cc
            remix_resample.cc
#            test/audio_bwe_integration_test.cc
#            test/audio_end_to_end_test.cc
#            test/audio_stats_test.cc
#            test/low_bandwidth_audio_test.cc
#            test/low_bandwidth_audio_test_flags.cc
#            test/nack_test.cc
#            test/pc_low_bandwidth_audio_test.cc
            utility/audio_frame_operations.cc
            utility/channel_mixer.cc
            utility/channel_mixing_matrix.cc
            voip/audio_channel.cc
            voip/audio_egress.cc
            voip/audio_ingress.cc
            voip/voip_core.cc


)

add_library(webrtc_audio ${SRC_FILES})
target_include_directories(webrtc_audio PUBLIC 
                 test
                 utility
                 voip
)