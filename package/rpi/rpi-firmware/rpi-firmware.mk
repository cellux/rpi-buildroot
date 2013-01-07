#############################################################
#
# rpi-firmware
#
#############################################################
RPI_FIRMWARE_VERSION = ffbb918fd46f1b0b687a474857b370f24f71989d
RPI_FIRMWARE_SITE = https://github.com/raspberrypi/firmware/archive
RPI_FIRMWARE_SOURCE = $(RPI_FIRMWARE_VERSION).tar.gz

$(eval $(generic-package))
