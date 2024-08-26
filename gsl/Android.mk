LOCAL_PATH := $(call my-dir)

include $(CLEAR_VARS)

LOCAL_MODULE := libgsl_headers
LOCAL_PROPRIETARY_MODULE := true

LOCAL_EXPORT_C_INCLUDE_DIRS := \
    $(LOCAL_PATH)/api \
    $(LOCAL_PATH)/rtc_api \
    $(LOCAL_PATH)/hw_rsc_api

include $(BUILD_HEADER_LIBRARY)

include $(CLEAR_VARS)

LOCAL_MODULE := libar-gsl
LOCAL_MODULE_OWNER := qti
LOCAL_MODULE_TAGS := optional
LOCAL_PROPRIETARY_MODULE := true

LOCAL_SRC_FILES := src/gsl_main.c \
    src/gsl_graph.c\
    src/gsl_shmem_mgr.c\
    src/gsl_subgraph.c\
    src/gsl_subgraph_pool.c\
    src/gsl_common.c\
    src/gsl_spf_ss_state.c\
    src/gsl_hw_rsc_mgr.c\
    src/gsl_rtc.c\
    src/gsl_rtc_main.c\
    src/gsl_dynamic_module_mgr.c\
    src/gsl_mdf_utils.c\
    src/gsl_datapath.c\
    src/gsl_msg_builder.c\
    src/gsl_global_persist_cal.c

LOCAL_HEADER_LIBRARIES := libspf-headers
LOCAL_SHARED_LIBRARIES := \
    liblx-osal\
    libar-acdb\
    liblx-ar_util\
    libar-gpr

LOCAL_C_INCLUDES := $(LOCAL_PATH)/api\
    $(LOCAL_PATH)/inc\
    $(LOCAL_PATH)/rtc_api\
    $(LOCAL_PATH)/hw_rsc_api

LOCAL_EXPORT_C_INCLUDE_DIRS := $(LOCAL_PATH)/api
LOCAL_EXPORT_C_INCLUDE_DIRS += $(LOCAL_PATH)/rtc_api
LOCAL_EXPORT_C_INCLUDE_DIRS += $(LOCAL_PATH)/hw_rsc_api

LOCAL_CFLAGS := -D_ANDROID_
LOCAL_CFLAGS += -DGSL_DEBUG_ENABLE
LOCAL_CFLAGS += -DGSL_EXT_MEM_CACHE_DISABLE
LOCAL_CFLAGS += -DGSL_LOG_PKT_ENABLE
LOCAL_CFLAGS += -DGSL_PKT_LOG_PATH=\"/data/vendor/audio/gsl_log.bin\"
LOCAL_CFLAGS += -Wno-gnu-designator
LOCAL_CFLAGS += -Wno-shorten-64-to-32
LOCAL_CFLAGS += -Wno-sign-compare
LOCAL_CFLAGS += -Wno-tautological-compare
LOCAL_CFLAGS += -Wno-typedef-redefinition
LOCAL_CFLAGS += -Wno-unused-function
LOCAL_CFLAGS += -Wno-unused-label
LOCAL_CFLAGS += -Wno-unused-local-typedef
LOCAL_CFLAGS += -Wno-unused-parameter
LOCAL_CFLAGS += -Wno-unused-variable

include $(BUILD_SHARED_LIBRARY)
