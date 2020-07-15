ARCHS = arm64e arm64 armv7 armv7s

include $(THEOS)/makefiles/common.mk

TARGET = iphone:clang::10.0

CFLAGS = -fobjc-arc

BUNDLE_NAME = SwitchStyle

SwitchStyle_FILES = SwitchStyleController.m $(wildcard *.m *.mm *.xm)


SwitchStyle_INSTALL_PATH = /Library/PreferenceBundles
SwitchStyle_FRAMEWORKS = UIKit
SwitchStyle_PRIVATE_FRAMEWORKS = Preferences
SwitchStyle_EXTRA_FRAMEWORKS = Cephei CepheiPrefs
SwitchStyle_CFLAGS = -fobjc-arc -Wno-deprecated-declarations -Wno-unused-variable -Wno-unused-value -Wno-incomplete-implementation

$(LIBRARY_NAME)_FRAMEWORKS = UIKit CoreGraphics Foundation Social Accounts
$(LIBRARY_NAME)_PRIVATE_FRAMEWORKS = Preferences
$(LIBRARY_NAME)_LDFLAGS += -Wl,-segalign,4000
$(LIBRARY_NAME)_CFLAGS = -fobjc-arc
PFColorAlert.m_CFLAGS = -fno-objc-arc
PFSimpleLiteColorCell.mm_CFLAGS = -fno-objc-arc
PFLiteColorCell.mm_CFLAGS = -fno-objc-arc


include $(THEOS_MAKE_PATH)/bundle.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences$(ECHO_END)
	$(ECHO_NOTHING)cp entry.plist $(THEOS_STAGING_DIR)/Library/PreferenceLoader/Preferences/SwitchStyle.plist$(ECHO_END)
