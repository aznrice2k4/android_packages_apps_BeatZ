# Froyo didn't have the strategy/effects APIs
ifneq ($(BOARD_USES_FROYO_AUDIOPOLICY),true)

LOCAL_PATH:= $(call my-dir)
include $(CLEAR_VARS)

LOCAL_MODULE_TAGS := optional

LOCAL_PROGUARD_FLAG_FILES := proguard.flags

LOCAL_STATIC_JAVA_LIBRARIES := android-support-v13

LOCAL_SRC_FILES := $(call all-java-files-under, src)

LOCAL_PACKAGE_NAME := BeatZ
LOCAL_CERTIFICATE := platform

LOCAL_OVERRIDES_PACKAGES := MusicFX

LOCAL_CFLAGS := -O3 \
                -fomit-frame-pointer \
                -funsafe-math-optimizations \
                -fstrict-aliasing \
				-funswitch-loops \
                -Wstrict-aliasing=2 \
                -Werror=strict-aliasing \
                -pipe \
				-floop-interchange \
				-floop-strip-mine \
				-floop-block \
				-ffast-math \
				-funsafe-loop-optimizations

include $(BUILD_PACKAGE)

# Use the folloing include to make our test apk.
include $(call all-makefiles-under,$(LOCAL_PATH))

endif # BOARD_USES_FROYO_AUDIOPOLICY
