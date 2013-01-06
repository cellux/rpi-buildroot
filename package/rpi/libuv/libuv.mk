#############################################################
#
# libuv
#
#############################################################
LIBUV_VERSION = node-v0.9.4
LIBUV_SITE = https://github.com/joyent/libuv/archive
LIBUV_SOURCE = $(LIBUV_VERSION).tar.gz

LIBUV_INSTALL_STAGING = YES
TARGET_CPPFLAGS += -Iinclude -Iinclude/uv-private -Isrc

define LIBUV_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) libuv.so
endef

define LIBUV_INSTALL_STAGING_CMDS
	$(INSTALL) -m 0644 -D $(@D)/include/uv.h $(STAGING_DIR)/usr/include/uv.h
	$(INSTALL) -m 0755 -d $(STAGING_DIR)/usr/include/uv-private
	$(INSTALL) -m 0644 $(@D)/include/uv-private/*.h $(STAGING_DIR)/usr/include/uv-private
	$(INSTALL) -m 0644 $(@D)/libuv.so $(STAGING_DIR)/usr/lib/libuv.so
endef

define LIBUV_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 $(@D)/libuv.so $(TARGET_DIR)/usr/lib/libuv.so
endef

define LIBUV_CLEAN_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) clean
endef

$(eval $(generic-package))
