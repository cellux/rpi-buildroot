#############################################################
#
# libuv
#
#############################################################
LIBUV_VERSION = node-v0.9.8
LIBUV_SITE = https://github.com/joyent/libuv/archive
LIBUV_SOURCE = $(LIBUV_VERSION).tar.gz

define LIBUV_BUILD_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) CFLAGS="$(TARGET_CFLAGS) -Iinclude -Iinclude/uv-private -Isrc" -C $(@D) libuv.so
endef

define LIBUV_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0644 $(@D)/libuv.so $(TARGET_DIR)/usr/lib/libuv.so
endef

define LIBUV_CLEAN_CMDS
	$(TARGET_MAKE_ENV) $(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D) clean
endef

$(eval $(generic-package))
