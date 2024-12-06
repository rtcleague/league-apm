/*
 *  Copyright 2020 The WebRTC Project Authors. All rights reserved.
 *
 *  Use of this source code is governed by a BSD-style license
 *  that can be found in the LICENSE file in the root of the source
 *  tree. An additional intellectual property rights grant can be found
 *  in the file PATENTS.  All contributing project authors may
 *  be found in the AUTHORS file in the root of the source tree.
 */

#ifndef RTC_BASE_SYNCHRONIZATION_MUTEX_PTHREAD_H_
#define RTC_BASE_SYNCHRONIZATION_MUTEX_PTHREAD_H_

#include <pthread.h>

namespace webrtc {

class MutexImpl {
public:
    MutexImpl() {
        pthread_mutex_init(&mutex_, nullptr);
    }
    ~MutexImpl() {
        pthread_mutex_destroy(&mutex_);
    }
    void Lock() {
        pthread_mutex_lock(&mutex_);
    }
    void Unlock() {
        pthread_mutex_unlock(&mutex_);
    }
    bool TryLock() {
        return pthread_mutex_trylock(&mutex_) == 0;
    }

private:
    pthread_mutex_t mutex_;
};

} // namespace webrtc

#endif // RTC_BASE_SYNCHRONIZATION_MUTEX_PTHREAD_H_
