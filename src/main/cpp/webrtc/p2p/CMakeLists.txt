cmake_minimum_required(VERSION 3.4.1)
set(SRC_FILES
    base/async_stun_tcp_socket.cc
    base/basic_async_resolver_factory.cc
    base/basic_ice_controller.cc
    base/basic_packet_socket_factory.cc
    base/connection.cc
    base/connection_info.cc
    base/default_ice_transport_factory.cc
    base/dtls_transport.cc
    base/dtls_transport_internal.cc
    base/ice_controller_interface.cc
    base/ice_credentials_iterator.cc
    base/ice_transport_internal.cc
    base/p2p_constants.cc
    base/p2p_transport_channel.cc
    base/packet_transport_internal.cc
    base/port.cc
    base/port_allocator.cc
    base/port_interface.cc
    base/pseudo_tcp.cc
    base/regathering_controller.cc
    base/stun_port.cc
    base/stun_request.cc
    base/stun_server.cc
    base/tcp_port.cc
    base/test_stun_server.cc
    base/transport_description.cc
    base/transport_description_factory.cc
    base/turn_port.cc
    base/turn_server.cc
    client/basic_port_allocator.cc
    client/turn_port_factory.cc
    stunprober/stun_prober.cc  
)

add_library(webrtc_p2p ${SRC_FILES})
target_include_directories(webrtc_p2p PUBLIC 
    base
    client
    g3doc
    stunprober
)
