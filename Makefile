export ARCHS = armv7 arm64
export TARGET = iphone::9.0

TWEAK_NAME = Instasearch
Instasearch_FILES = Tweak.xm
Instasearch_FRAMEWORKS = UIKit

include $(THEOS)/makefiles/common.mk
include $(THEOS_MAKE_PATH)/tweak.mk

after-install::
	install.exec "killall -9 SpringBoard"
include $(THEOS_MAKE_PATH)/aggregate.mk
