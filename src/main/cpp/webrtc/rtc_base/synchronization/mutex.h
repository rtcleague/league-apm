/*
 *  Copyright 2020 The WebRTC Project Authors. All rights reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

#ifndef RTC_BASE_SYNCHRONIZATION_MUTEX_H_
#define RTC_BASE_SYNCHRONIZATION_MUTEX_H_

#if defined(WEBRTC_POSIX)
#include <pthread.h>
#endif
#include "rtc_base/checks.h"
#include "absl/base/const_init.h"
#include <atomic>

namespace webrtc {

// Basic mutex wrapper class
class MutexImpl {
public:
    MutexImpl() {
#if defined(WEBRTC_POSIX)
        pthread_mutex_init(&mutex_, nullptr);
#endif
    }
    
    ~MutexImpl() {
#if defined(WEBRTC_POSIX)
        pthread_mutex_destroy(&mutex_);
#endif
    }
    
    void Lock() {
#if defined(WEBRTC_POSIX)
        pthread_mutex_lock(&mutex_);
#endif
    }
    
    void Unlock() {
#if defined(WEBRTC_POSIX)
        pthread_mutex_unlock(&mutex_);
#endif
    }
    
    bool TryLock() {
#if defined(WEBRTC_POSIX)
        return pthread_mutex_trylock(&mutex_) == 0;
#endif
    }

private:
#if defined(WEBRTC_POSIX)
    pthread_mutex_t mutex_;
#endif
};

class Mutex {
public:
    Mutex() = default;
    ~Mutex() = default;

    void Lock() { impl_.Lock(); }
    void Unlock() { impl_.Unlock(); }
    bool TryLock() { return impl_.TryLock(); }

private:
    MutexImpl impl_;
};

class MutexLock {
public:
    explicit MutexLock(Mutex* mutex) : mutex_(mutex) {
        mutex_->Lock();
    }
    ~MutexLock() {
        mutex_->Unlock();
    }

private:
    Mutex* mutex_;
};

// Global mutex implementation for specific use cases
class GlobalMutex {
public:
    explicit GlobalMutex(const absl::ConstInitType) : mutex_locked_(0) {}
    
    void Lock() {
        int old_value = 0;
        while (!mutex_locked_.compare_exchange_weak(old_value, 1,
                                                  std::memory_order_acquire,
                                                  std::memory_order_relaxed)) {
            old_value = 0;
        }
    }
    
    void Unlock() {
        int old_value = mutex_locked_.exchange(0, std::memory_order_release);
        RTC_DCHECK_EQ(1, old_value) << "Unlock called without previous lock";
    }

private:
    std::atomic<int> mutex_locked_;
};

class GlobalMutexLock {
public:
    explicit GlobalMutexLock(GlobalMutex* mutex) : mutex_(mutex) {
        mutex_->Lock();
    }
    ~GlobalMutexLock() {
        mutex_->Unlock();
    }
private:
    GlobalMutex* mutex_;
};

} // namespace webrtc

#endif  // RTC_BASE_SYNCHRONIZATION_MUTEX_H_
