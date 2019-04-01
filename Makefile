export ARCHS = armv7 arm64
export TARGET = iphone::9.0

TWEAK_NAME = Instasearch
Instasearch_FILES = Tweak.xm
Instasearch_FRAMEWORKS = UIKit

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

internal-stage::
	$(ECHO_NOTHING)mkdir -p $(THEOS_STAGING_DIR)/var/mobile/Application\ Support/Instasearch$(ECHO_END)
	$(ECHO_NOTHING)cp resources/AppIcon.png $(THEOS_STAGING_DIR)/var/mobile/Application\ Support/Instasearch/InstasearchAppIcon.png$(ECHO_END)
after-install::
	install.exec "killall -9 SpringBoard"
include $(THEOS_MAKE_PATH)/aggregate.mk
