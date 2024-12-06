cmake_minimum_required(VERSION 3.4.1)

set(SRC_FILES
        async_invoker.cc
#        async_packet_socket.cc
#        async_resolver.cc
#        async_resolver_interface.cc
#        async_socket.cc
#        async_tcp_socket.cc
#        async_udp_socket.cc
        bit_buffer.cc
#        boringssl_certificate.cc
#        boringssl_identity.cc
        buffer_queue.cc
        byte_buffer.cc
        callback_list.cc
        checks.cc
        containers/flat_tree.cc
        copy_on_write_buffer.cc
#        cpu_time.cc
        crc32.cc
        crypt_string.cc
        data_rate_limiter.cc
        deprecated/recursive_critical_section.cc
        event.cc
        event_tracer.cc
        experiments/alr_experiment.cc
        experiments/balanced_degradation_settings.cc
        experiments/cpu_speed_experiment.cc
        experiments/encoder_info_settings.cc
        experiments/field_trial_list.cc
        experiments/field_trial_parser.cc
        experiments/field_trial_units.cc
        experiments/jitter_upper_bound_experiment.cc
        experiments/keyframe_interval_settings.cc
        experiments/min_video_bitrate_experiment.cc
        experiments/normalize_simulcast_size_experiment.cc
        experiments/quality_rampup_experiment.cc
        experiments/quality_scaler_settings.cc
        experiments/quality_scaling_experiment.cc
        experiments/rate_control_settings.cc
        experiments/rtt_mult_experiment.cc
        experiments/stable_target_rate_experiment.cc
        experiments/struct_parameters_parser.cc
        fake_clock.cc
        fake_ssl_identity.cc
        file_rotating_stream.cc
        firewall_socket_server.cc
#        gunit.cc
#        helpers.cc
        http_common.cc
#        ifaddrs_android.cc
#        ifaddrs_converter.cc
#        internal/default_socket_server.cc
#        ip_address.cc
#       location.cc
        logging.cc
        log_sinks.cc
#        mac_ifaddrs_converter.cc
        memory/aligned_malloc.cc
        memory/fifo_buffer.cc
        memory_stream.cc
#        memory_usage.cc
#        message_digest.cc
        message_handler.cc
#        nat_server.cc
#        nat_socket_factory.cc
#        nat_types.cc
        network/sent_packet.cc
        network.cc
        network_constants.cc
        network_monitor.cc
        network_monitor_factory.cc
        network_route.cc
        net_helper.cc
        net_helpers.cc
        null_socket_server.cc
        numerics/event_based_exponential_moving_average.cc
        numerics/event_rate_counter.cc
        numerics/exp_filter.cc
        numerics/histogram_percentile_counter.cc
        numerics/moving_average.cc
        numerics/sample_counter.cc
        numerics/sample_stats.cc
#        openssl_adapter.cc
#        openssl_certificate.cc
#        openssl_digest.cc
#        openssl_identity.cc
#        openssl_key_pair.cc
#        openssl_session_cache.cc
#        openssl_stream_adapter.cc
#        openssl_utility.cc
        operations_chain.cc
        physical_socket_server.cc
        platform_thread.cc
        platform_thread_types.cc
#        proxy_info.cc
#        proxy_server.cc
        race_checker.cc
        random.cc
        rate_limiter.cc
        rate_statistics.cc
        rate_tracker.cc
        rolling_accumulator.h
        rtc_certificate.cc
        rtc_certificate_generator.cc
        server_socket_adapters.cc
#        socket.cc
#        socket_adapters.cc
#        socket_address.cc
#        socket_address_pair.cc
#        socket_stream.cc
#        ssl_adapter.cc
#        ssl_certificate.cc
#        ssl_fingerprint.cc
#        ssl_identity.cc
#        ssl_stream_adapter.cc
        stream.cc
        strings/audio_format_to_string.cc
        strings/json.cc
        strings/string_builder.cc
        strings/string_format.cc
        string_encode.cc
        string_to_number.cc
        string_utils.cc
        synchronization/mutex.cc
#        synchronization/mutex_benchmark.cc
        synchronization/sequence_checker_internal.cc
        synchronization/yield.cc
        synchronization/yield_policy.cc
#        system/file_wrapper.cc
#        system/thread_registry.cc
#        ../sdk/android/native_api/stacktrace/stacktrace.cc
        system/warn_current_thread_is_deadlocked.cc
        system_time.cc
        task_queue.cc
#        task_queue_for_test.cc
#        task_queue_gcd.cc
#        task_queue_libevent.cc
#        task_queue_stdlib.cc
#        task_queue_win.cc
        task_utils/pending_task_safety_flag.cc
        task_utils/repeating_task.cc
#        test_client.cc
#        test_echo_server.cc
#        test_utils.cc
        third_party/base64/base64.cc
        third_party/sigslot/sigslot.cc
        thread.cc
        time/timestamp_extrapolator.cc
        timestamp_aligner.cc
        time_utils.cc
        unique_id_generator.cc
        virtual_socket_server.cc
        weak_ptr.cc
#        win/create_direct3d_device.cc
#        win/get_activation_factory.cc
#        win/hstring.cc
#        win/scoped_com_initializer.cc
#        win/windows_version.cc
#        win32.cc
#        win32_socket_server.cc
#        win32_window.cc
        zero_memory.cc
    )

    add_library(webrtc_rtc_base STATIC ${SRC_FILES})

    target_link_libraries(webrtc_rtc_base webrtc_api)

    target_include_directories(webrtc_rtc_base PUBLIC
        ${CMAKE_CURRENT_SOURCE_DIR}/..
        ${CMAKE_CURRENT_SOURCE_DIR}
        containers
        deprecated
        experiments
        internal
        java
        memory
        network
        numerics
        strings
        synchronization
        system
        task_utils
        third_party
        time
        units
        win    
)