##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

#TODO: Fill up the contents below in order to reference your assignment 3 git contents

AESD_ASSIGNMENTS_SOCKET_VERSION = '153928ff7f7a69c1bda004508a9a55490d39f7bd'
# '1f9497ae50ac096c90eb72fe600d7df59fc3431b'
# '630fe8049328bb59d67f88a94281fb6e8b25df2b'
# 'e8d4e0ad00780b83f9a99bf944c6333fb9e3b74d'
# '31b5e5c88525552126783737ed8db6493fc4185b'
# 'f7e8edf3b8145f436f95fa66533465df8d01e627'
# '9eaf966c8c2682e628d55c4bca6c2da6c3e82e83'
# '6886a431a12583455b4f5a84d06de99f95cc5fab'
# d1a450afc83ecbb8e9eb01d6bddd6e3a11c90d69'

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:

# Note: Unable to accomplish the git integration.

AESD_ASSIGNMENTS_SOCKET_SITE = 'git@github.com:btardio/aesd_socket.git'
AESD_ASSIGNMENTS_SOCKET_SITE_METHOD = git
AESD_ASSIGNMENTS_SOCKET_GIT_SUBMODULES = YES

CROSS_COMPILE=aarch64-none-linux-gnu-
export CROSS_COMPILE

define AESD_ASSIGNMENTS_SOCKET_BUILD_CMDS
	$(MAKE) CFLAGS="$(TARGET_CFLAGS)" LDFLAGS="$(TARGET_LDFLAGS)" CC="$(TARGET_CC)" LD="$(TARGET_LD)" $(TARGET_CONFIGURE_OPTS) -C $(@D)
endef

define AESD_ASSIGNMENTS_SOCKET_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/drivertest.sh $(TARGET_DIR)/
	$(INSTALL) -m 0755 $(@D)/sockettest.sh $(TARGET_DIR)/
	$(INSTALL) -m 0755 $(@D)/aesdsocket $(TARGET_DIR)/bin/aesdsocket
	$(INSTALL) -m 0755 $(@D)/aesdsocket $(TARGET_DIR)/usr/bin/aesdsocket
	$(INSTALL) -m 0755 $(@D)/aesdsocket-start-stop $(TARGET_DIR)/etc/init.d/S99aesdsocket
endef

$(eval $(generic-package))

