cmake_minimum_required(VERSION 3.4.1)
set(SRC_FILES
    rtc_event_log/encoder/blob_encoding.cc
    rtc_event_log/encoder/delta_encoding.cc
    rtc_event_log/encoder/rtc_event_log_encoder_common.cc
#    rtc_event_log/encoder/rtc_event_log_encoder_legacy.cc
#    rtc_event_log/encoder/rtc_event_log_encoder_new_format.cc
    rtc_event_log/encoder/var_int.cc
    rtc_event_log/events/rtc_event_alr_state.cc
    rtc_event_log/events/rtc_event_audio_network_adaptation.cc
    rtc_event_log/events/rtc_event_audio_playout.cc
    rtc_event_log/events/rtc_event_audio_receive_stream_config.cc
    rtc_event_log/events/rtc_event_audio_send_stream_config.cc
    rtc_event_log/events/rtc_event_bwe_update_delay_based.cc
    rtc_event_log/events/rtc_event_bwe_update_loss_based.cc
    rtc_event_log/events/rtc_event_dtls_transport_state.cc
    rtc_event_log/events/rtc_event_dtls_writable_state.cc
    rtc_event_log/events/rtc_event_frame_decoded.cc
    rtc_event_log/events/rtc_event_generic_ack_received.cc
    rtc_event_log/events/rtc_event_generic_packet_received.cc
    rtc_event_log/events/rtc_event_generic_packet_sent.cc
    rtc_event_log/events/rtc_event_ice_candidate_pair.cc
    rtc_event_log/events/rtc_event_ice_candidate_pair_config.cc
    rtc_event_log/events/rtc_event_probe_cluster_created.cc
    rtc_event_log/events/rtc_event_probe_result_failure.cc
    rtc_event_log/events/rtc_event_probe_result_success.cc
    rtc_event_log/events/rtc_event_probe_result_success.h
    rtc_event_log/events/rtc_event_route_change.cc
    rtc_event_log/events/rtc_event_rtcp_packet_incoming.cc
    rtc_event_log/events/rtc_event_rtcp_packet_outgoing.cc
    rtc_event_log/events/rtc_event_rtp_packet_incoming.cc
    rtc_event_log/events/rtc_event_rtp_packet_outgoing.cc
    rtc_event_log/events/rtc_event_video_receive_stream_config.cc
    rtc_event_log/events/rtc_event_video_send_stream_config.cc
    rtc_event_log/fake_rtc_event_log.cc
    rtc_event_log/fake_rtc_event_log_factory.cc
    rtc_event_log/ice_logger.cc
    rtc_event_log/logged_events.cc
#    rtc_event_log/mock/mock_rtc_event_log.cc
#    rtc_event_log/rtc_event_log2rtp_dump.cc
    rtc_event_log/rtc_event_log_impl.cc
#    rtc_event_log/rtc_event_log_parser.cc
    rtc_event_log/rtc_event_processor.cc
    rtc_event_log/rtc_stream_config.cc
        )
add_library(webrtc_logging ${SRC_FILES})
target_include_directories(webrtc_logging PUBLIC rtc_event_log)


