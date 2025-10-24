##############################################################
#
# AESD-ASSIGNMENTS
#
##############################################################

AESD_ASSIGNMENTS_MODULES_VERSION = 'ab8d42beaeaaa798735797e743950cae9ce88b0e'

# Note: Be sure to reference the *ssh* repository URL here (not https) to work properly
# with ssh keys and the automated build/test system.
# Your site should start with git@github.com:

# Note: Unable to accomplish the git integration.

AESD_ASSIGNMENTS_MODULES_SITE = 'git@github.com:btardio/ldd3.git'
AESD_ASSIGNMENTS_MODULES_SITE_METHOD = git
AESD_ASSIGNMENTS_MODULES_GIT_SUBMODULES = YES

CROSS_COMPILE=aarch64-none-linux-gnu-
export CROSS_COMPILE

KERNELDIR=$(LINUX_DIR)
export KERNELDIR

KERNELRELEASE=$(LINUX_VERSION)
export KERNELRELEASE


#AESD_ASSIGNMENTS_MODULES_MODULE_SUBDIRS = misc-modules/
#AESD_ASSIGNMENTS_MODULES_MODULE_SUBDIRS += scull/

#$(eval $(kernel-module))
#$(eval $(generic-package))

