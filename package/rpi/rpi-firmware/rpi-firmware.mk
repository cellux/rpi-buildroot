#############################################################
#
# rpi-firmware
#
#############################################################
RPI_FIRMWARE_VERSION = efc9c98fa3413e3f9e71273012917b8918d98444
RPI_FIRMWARE_SITE = https://github.com/raspberrypi/firmware/archive
RPI_FIRMWARE_SOURCE = $(RPI_FIRMWARE_VERSION).tar.gz
RPI_FIRMWARE_INSTALL_STAGING = YES
RPI_FIRMWARE_INSTALL_IMAGES = YES
RPI_FIRMWARE_DEPENDENCIES = linux rpi-config

define RPI_FIRMWARE_INSTALL_STAGING_CMDS
	$(INSTALL) -d -m 0755 $(STAGING_DIR)/boot || /bin/true
	$(INSTALL) -m 0644 $(@D)/boot/bootcode.bin $(STAGING_DIR)/boot
	$(INSTALL) -m 0644 $(@D)/boot/fixup.dat $(STAGING_DIR)/boot
	$(INSTALL) -m 0644 $(@D)/boot/start.elf $(STAGING_DIR)/boot
	echo "$(call qstrip,$(BR2_PACKAGE_RPI_FIRMWARE_CMDLINE))" > $(STAGING_DIR)/boot/cmdline.txt
endef

define RPI_FIRMWARE_INSTALL_IMAGES_CMDS
	$(INSTALL) -m 0644 $(BINARIES_DIR)/zImage $(STAGING_DIR)/boot/kernel.img
	tar -C $(STAGING_DIR)/boot -cvzf $(BINARIES_DIR)/bootfs.tar.gz .
endef

$(eval $(generic-package))
