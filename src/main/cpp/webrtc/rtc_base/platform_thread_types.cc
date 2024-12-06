/*
 *  Copyright (c) 2018 The WebRTC project authors. All Rights Reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

#include "rtc_base/platform_thread_types.h"
#include <unistd.h>

namespace rtc {

PlatformThreadId CurrentThreadId() {
#if defined(WEBRTC_LINUX)
    return gettid();
#else
    return static_cast<uint32_t>(pthread_self());
#endif
}

PlatformThreadRef CurrentThreadRef() {
#if defined(WEBRTC_LINUX)
    return pthread_self();
#else
    return static_cast<uint32_t>(pthread_self());
#endif
}

bool IsThreadRefEqual(const PlatformThreadRef& a, const PlatformThreadRef& b) {
#if defined(WEBRTC_LINUX)
    return pthread_equal(a, b);
#else
    return a == b;
#endif
}

}  // namespace rtc
