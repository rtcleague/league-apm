/*
Author: Muhammad Usman Bashir
Senior WebRTC Architect

Description: This is header file for the Driver class, which is used to 
process the audio data for the near end and far end.

Date: 27/11/2024
*/

#ifndef DRIVER_H
#define DRIVER_H

#include <jni.h>
#include "../include/Apm_Wrapper.h"

class Driver {
private:
    bool isAPM;
    Apm_Wrapper apm_wrapper_;
    JNIEnv* env_;
    jobject thiz_;
    short* UpSampledArray;
    short* UpSampledArrayFarend;
    short* downSampledArrayFarEnd;
    short* processed_output;

    JNIEnv* getEnv();
    void sendDataToKotlin();

public:
    Driver();
    Driver(JNIEnv* env, jobject thiz, bool apmFlag);
    ~Driver();
    void processDataNearEnd();
    void processDataFarEnd();

    // Make these public for JNI access
    short* mData;
    short* mDataFarEnd;

    // Add getter method for APM wrapper
    Apm_Wrapper* GetApmWrapper() { return &apm_wrapper_; }
};

#endif // DRIVER_H
