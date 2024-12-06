#ifndef RTC_BASE_REF_COUNTED_BASE_H_
#define RTC_BASE_REF_COUNTED_BASE_H_

#include "rtc_base/ref_count.h"

namespace rtc {

enum class RefCountReleaseStatus {
  kDroppedLastRef,
  kOtherRefsRemained,
};

class RefCountedBase {
 public:
  virtual void AddRef() const = 0;
  virtual RefCountReleaseStatus Release() const = 0;

 protected:
  virtual ~RefCountedBase() = default;
};

}  // namespace rtc

#endif  // RTC_BASE_REF_COUNTED_BASE_H_ 