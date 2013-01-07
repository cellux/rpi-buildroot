#############################################################
#
# rpi-tools
#
#############################################################
RPI_TOOLS_VERSION = 9c3d7b6ac692498dd36fec2872e0b55f910baac1
RPI_TOOLS_SITE = https://github.com/raspberrypi/tools/archive
RPI_TOOLS_SOURCE = $(RPI_TOOLS_VERSION).tar.gz

$(eval $(generic-package))
