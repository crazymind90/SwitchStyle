PACKAGE_VERSION = $(THEOS_PACKAGE_BASE_VERSION)

ARCHS = arm64e arm64 armv7 armv7s

THEOS_DEVICE_IP = 192.168.1.4

include $(THEOS)/makefiles/common.mk

TWEAK_NAME = SwitchStyle

SwitchStyle_FILES = Tweak.xm libcolorpicker.mm
SwitchStyle_CFLAGS = -fobjc-arc
SwitchStyle_EXTRA_FRAMEWORKS += Cephei
SwitchStyle_FRAMEWORKS = UIKit


include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
SUBPROJECTS += SwitchStyle
include $(THEOS_MAKE_PATH)/aggregate.mk


install3::
		install3.exec

