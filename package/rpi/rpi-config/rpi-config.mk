#############################################################
#
# rpi-config
#
#############################################################
RPI_CONFIG_VERSION = 62bf3e9db62f547eb1a2a352dde957d2f94bd216
RPI_CONFIG_SITE = https://github.com/Evilpaul/RPi-config/archive
RPI_CONFIG_SOURCE = $(RPI_CONFIG_VERSION).tar.gz
RPI_CONFIG_INSTALL_STAGING = YES

define RPI_CONFIG_INSTALL_STAGING_CMDS
	$(INSTALL) -d -m 0755 $(STAGING_DIR)/boot || /bin/true
	$(INSTALL) -m 0644 $(@D)/config.txt $(STAGING_DIR)/boot
	echo "$(call qstrip,$(BR2_PACKAGE_RPI_CONFIG_CMDLINE))" > $(STAGING_DIR)/boot/cmdline.txt
endef

$(eval $(generic-package))
