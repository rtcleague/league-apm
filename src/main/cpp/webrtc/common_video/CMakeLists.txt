cmake_minimum_required(VERSION 3.4.1)
set(SRC_FILES
        bitrate_adjuster.cc
        frame_rate_estimator.cc
        generic_frame_descriptor/generic_frame_info.cc
        h264/h264_bitstream_parser.cc
        h264/h264_common.cc
        h264/pps_parser.cc
        h264/sps_parser.cc
        h264/sps_vui_rewriter.cc
        incoming_video_stream.cc
        libyuv/webrtc_libyuv.cc
        test/utilities.cc
        video_frame_buffer.cc
        video_frame_buffer_pool.cc
        video_render_frames.cc  
        )
add_library(webrtc_common_video ${SRC_FILES})
target_include_directories(webrtc_common_video PUBLIC 
                        generic_frame_descriptor
                        h264
                        include
                        libyuv
                        test 
                        )


