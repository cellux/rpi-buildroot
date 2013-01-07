#############################################################
#
# rpi-config
#
#############################################################
RPI_CONFIG_VERSION = 62bf3e9db62f547eb1a2a352dde957d2f94bd216
RPI_CONFIG_SITE = https://github.com/Evilpaul/RPi-config/archive
RPI_CONFIG_SOURCE = $(RPI_CONFIG_VERSION).tar.gz

$(eval $(generic-package))
