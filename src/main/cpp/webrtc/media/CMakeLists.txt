cmake_minimum_required(VERSION 3.4.1)
set(SRC_FILES
        base/adapted_video_track_source.cc
        base/codec.cc
#        base/fake_frame_source.cc
#        base/fake_media_engine.cc
#        base/fake_rtp.cc
#        base/fake_video_renderer.cc
        base/h264_profile_level_id.cc
        base/media_channel.cc
        base/media_constants.cc
        base/media_engine.cc
        base/rid_description.cc
        base/rtp_utils.cc
        base/sdp_video_format_utils.cc
        base/stream_params.cc
#        base/test_utils.cc
        base/turn_utils.cc
        base/video_adapter.cc
        base/video_broadcaster.cc
        base/video_common.cc
        base/video_source_base.cc
        engine/adm_helpers.cc
        engine/encoder_simulcast_proxy.cc
#        engine/fake_video_codec_factory.cc
#        engine/fake_webrtc_call.cc
#        engine/fake_webrtc_video_engine.cc
        engine/internal_decoder_factory.cc
        engine/internal_encoder_factory.cc
        engine/multiplex_codec_factory.cc
        engine/payload_type_mapper.cc
        engine/simulcast.cc
        engine/simulcast_encoder_adapter.cc
        engine/unhandled_packets_buffer.cc
        engine/webrtc_media_engine.cc
        engine/webrtc_media_engine_defaults.cc
#        engine/webrtc_video_engine.cc
#        engine/webrtc_voice_engine.cc
#        sctp/dcsctp_transport.cc
#        sctp/sctp_transport_factory.cc
#        sctp/usrsctp_transport.cc
)

add_library(webrtc_media ${SRC_FILES})
target_include_directories(webrtc_media PUBLIC 
   base
   engine
   sctp
)
