#############################################################
#
# rpi-userland
#
#############################################################
RPI_USERLAND_VERSION = 9852ce28826889e50c4d6786b942f51bccccac54
RPI_USERLAND_SITE = https://github.com/raspberrypi/userland/archive
RPI_USERLAND_SOURCE = 9852ce28826889e50c4d6786b942f51bccccac54.tar.gz
RPI_USERLAND_INSTALL_TARGET = YES

define RPI_USERLAND_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 $(@D)/build/lib/*.so $(TARGET_DIR)/usr/lib
	$(INSTALL) -m 0755 $(@D)/build/bin/* $(TARGET_DIR)/usr/bin
endef

$(eval $(cmake-package))
