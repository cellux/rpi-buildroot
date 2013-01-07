#############################################################
#
# rpi-firmware
#
#############################################################
RPI_FIRMWARE_VERSION = ffbb918fd46f1b0b687a474857b370f24f71989d
RPI_FIRMWARE_SITE = https://github.com/raspberrypi/firmware/archive
RPI_FIRMWARE_SOURCE = $(RPI_FIRMWARE_VERSION).tar.gz
RPI_FIRMWARE_INSTALL_STAGING = YES

define RPI_FIRMWARE_INSTALL_STAGING_CMDS
	$(INSTALL) -d -m 0755 $(STAGING_DIR)/boot || /bin/true
	$(INSTALL) -m 0644 $(@D)/boot/bootcode.bin $(STAGING_DIR)/boot
	$(INSTALL) -m 0644 $(@D)/boot/fixup.dat $(STAGING_DIR)/boot
	$(INSTALL) -m 0644 $(@D)/boot/start.elf $(STAGING_DIR)/boot
endef

$(eval $(generic-package))
