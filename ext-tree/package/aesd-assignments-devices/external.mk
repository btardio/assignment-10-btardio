##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_DEVICES_VERSION = '4d6e74429bf920fe1e4916d38d7f56f78e10dba0'

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:

# Note: Unable to accomplish the git integration.

AESD_ASSIGNMENTS_DEVICES_SITE = 'git@github.com:btardio/aesd_char.git'
AESD_ASSIGNMENTS_DEVICES_SITE_METHOD = git
AESD_ASSIGNMENTS_DEVICES_GIT_SUBMODULES = YES

CROSS_COMPILE=aarch64-none-linux-gnu-
export CROSS_COMPILE

KERNELDIR=$(LINUX_DIR)
export KERNELDIR

KERNELRELEASE=$(LINUX_VERSION)
export KERNELRELEASE

# this is complaining about the gcc flags, wrong compiler
#define AESD_ASSIGNMENTS_MODULES_BUILD_CMDS
    #$(info $(KERNELRELEASE))
	#$(info $(KERNELDIR))
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(@D)/misc-modules/ modules
	#$(MAKE) $(TARGET_CONFIGURE_OPTS) -C $(KERNELDIR) M=$(@D)/misc-modules/ modules
#endef

define AESD_ASSIGNMENTS_DEVICES_INSTALL_TARGET_CMDS
	$(INSTALL) -m 0755 $(@D)/aesdchar_load $(TARGET_DIR)/aesdchar_load
	$(INSTALL) -m 0755 $(@D)/aesdchar_unload $(TARGET_DIR)/aesdchar_unload
	$(INSTALL) -m 0755 $(@D)/aesdchar-start-stop $(TARGET_DIR)/etc/init.d/aesdchar-start-stop
endef

# AESD_ASSIGNMENTS_MODULES_MODULE_SUBDIRS = misc-modules/
# AESD_ASSIGNMENTS_MODULES_MODULE_SUBDIRS += scull/

$(eval $(kernel-module))
$(eval $(generic-package))

