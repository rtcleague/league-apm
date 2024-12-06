/*
Author: Muhammad Usman Bashir
Senior WebRTC Architect

Description: This file contains the implementation of the Driver class, 
which is used to process the audio data for the near end and far end. This 
class is used to send the data to the kotlin/Java layer.

Date: 27/11/2024
*/



#include "Driver.h"
#include "../utils/logging_macros.h"
#include <cstdio>

#define FRAME_SIZE 160
#define SAMPLE_RATE_HZ 8000

Driver::Driver() : isAPM(true), env_(nullptr), thiz_(nullptr) {
    mData = new short[FRAME_SIZE];
    mDataFarEnd = new short[FRAME_SIZE];
    UpSampledArray = new short[FRAME_SIZE];
    UpSampledArrayFarend = new short[FRAME_SIZE];
    downSampledArrayFarEnd = new short[FRAME_SIZE];
    processed_output = new short[FRAME_SIZE];
}

Driver::Driver(JNIEnv* env, jobject thiz, bool apmFlag)
    : isAPM(apmFlag), env_(env), thiz_(thiz) {
    mData = new short[FRAME_SIZE];
    mDataFarEnd = new short[FRAME_SIZE];
    UpSampledArray = new short[FRAME_SIZE];
    UpSampledArrayFarend = new short[FRAME_SIZE];
    downSampledArrayFarEnd = new short[FRAME_SIZE];
    processed_output = new short[FRAME_SIZE];
}

Driver::~Driver() {
    delete[] mData;
    delete[] mDataFarEnd;
    delete[] UpSampledArray;
    delete[] UpSampledArrayFarend;
    delete[] downSampledArrayFarEnd;
    delete[] processed_output;
}

JNIEnv* Driver::getEnv() {
    return env_;
}

void Driver::processDataNearEnd() {
    if (isAPM) {
        try {
            // Down sample the input data
            apm_wrapper_.DownSampleNearEnd(mData, downSampledArrayFarEnd);
            
            // Process the down sampled data
            apm_wrapper_.ApmProcessNearEnd(downSampledArrayFarEnd, processed_output);
            
            // Up sample the processed data
            apm_wrapper_.UpSampleNearEnd(processed_output, UpSampledArray);
            
        } catch (const std::exception& e) {
            logError("%s", e.what());
        }
    }
    
    sendDataToKotlin();
}

void Driver::sendDataToKotlin() {
    if (!env_ || !thiz_) {
        logError("Invalid JNI environment or object reference");
        return;
    }

    try {
        jclass cls = env_->GetObjectClass(thiz_);
        jmethodID mid = env_->GetMethodID(cls, "receiveData", "([S)V");
        
        jshortArray outArray = env_->NewShortArray(FRAME_SIZE);
        env_->SetShortArrayRegion(outArray, 0, FRAME_SIZE, 
            isAPM ? UpSampledArray : mData);
        
        env_->CallVoidMethod(thiz_, mid, outArray);
        env_->DeleteLocalRef(outArray);
        env_->DeleteLocalRef(cls);
        
    } catch (const std::exception& e) {
        logError("%s", e.what());
    }
}

void Driver::processDataFarEnd() {
    if (isAPM) {
        try {
            // Down sample the far-end data
            apm_wrapper_.DownSampleFarEnd(mDataFarEnd, downSampledArrayFarEnd);
            
            // Process the down sampled far-end data
            apm_wrapper_.ApmProcessFarEnd(downSampledArrayFarEnd, downSampledArrayFarEnd);
            
            // Up sample the processed far-end data
            apm_wrapper_.UpSampleFarEnd(downSampledArrayFarEnd, UpSampledArrayFarend);
            
        } catch (const std::exception& e) {
            logError("%s", e.what());
        }
    }
}

