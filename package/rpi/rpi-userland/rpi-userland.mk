#############################################################
#
# rpi-userland
#
#############################################################
RPI_USERLAND_VERSION = local
#RPI_USERLAND_SITE = git://github.com/raspberrypi/userland.git
RPI_USERLAND_SITE = /home/rb/src/raspberrypi/userland
RPI_USERLAND_SITE_METHOD = local
RPI_USERLAND_INSTALL_TARGET = YES

define RPI_USERLAND_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 $(@D)/build/lib/*.so $(TARGET_DIR)/usr/lib
	$(INSTALL) -m 0755 $(@D)/build/bin/* $(TARGET_DIR)/usr/bin
endef

$(eval $(cmake-package))
