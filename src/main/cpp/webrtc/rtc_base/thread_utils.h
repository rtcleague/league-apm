#ifndef RTC_BASE_THREAD_UTILS_H_
#define RTC_BASE_THREAD_UTILS_H_

#include <string>

#if defined(WEBRTC_LINUX) || defined(WEBRTC_ANDROID)
#include <sys/prctl.h>
#elif defined(WEBRTC_MAC) || defined(WEBRTC_IOS)
#include <pthread.h>
#endif

namespace rtc {

inline void SetCurrentThreadName(const char* name) {
#if defined(WEBRTC_LINUX) || defined(WEBRTC_ANDROID)
    prctl(PR_SET_NAME, name);
#elif defined(WEBRTC_MAC) || defined(WEBRTC_IOS)
    pthread_setname_np(name);
#endif
}

inline void SetCurrentThreadName(const std::string& name) {
    SetCurrentThreadName(name.c_str());
}

} // namespace rtc

#endif  // RTC_BASE_THREAD_UTILS_H_ 