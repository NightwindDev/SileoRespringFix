# This is here in order to avoid an issue during the compliation process that does not actually affect the tweak itself.
# The error is "tried to set expression for unknown class or function DownloadConfirmButton in group _ungrouped",
# but using GO_EASY_ON_ME works just fine, even though it is a bad practice.
GO_EASY_ON_ME = 1

export TARGET = iphone:clang:16.4:14.0
export SYSROOT = $(THEOS)/sdks/iPhoneOS14.4.sdk/
export ARCHS = arm64 arm64e

INSTALL_TARGET_PROCESSES = Sileo

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SileoRespringFix

SileoRespringFix_FILES = Tweak.xm
SileoRespringFix_CFLAGS = -fobjc-arc

include $(THEOS_MAKE_PATH)/tweak.mk
