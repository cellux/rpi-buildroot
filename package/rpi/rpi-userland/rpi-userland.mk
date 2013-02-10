#############################################################
#
# rpi-userland
#
#############################################################
RPI_USERLAND_VERSION = e075cb68b7f6db1e1148260f02346110d7da0f49
RPI_USERLAND_SITE = https://github.com/raspberrypi/userland/archive
RPI_USERLAND_SOURCE = $(RPI_USERLAND_VERSION).tar.gz
RPI_USERLAND_INSTALL_TARGET = YES

define RPI_USERLAND_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/build/lib/*.so $(TARGET_DIR)/usr/lib
	$(INSTALL) -m 0755 $(@D)/build/bin/* $(TARGET_DIR)/usr/bin
endef

$(eval $(cmake-package))
