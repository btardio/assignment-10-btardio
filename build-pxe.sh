#!/bin/bash
#Script to build buildroot configuration
#Author: Siddhant Jajoo
#Modified: Brandon Tardio

# ln -s ext-tree base_external

LINE_TO_APPEND="sha256  01be32c9f2a1a48fffe81c1992ce6cea6bba7ebe5cb574533fd6d608d864e050  linux-5.15.19.tar.xz"
HASHFILE="buildroot/linux/linux.hash"

# append the hash to the linux.hash
grep -qF -- "$LINE_TO_APPEND" "$HASHFILE" || echo "$LINE_TO_APPEND" >> "$HASHFILE"

# this patch is erroring
mv buildroot/board/qemu/patches/linux/0002-powerpc-boot-Fix-build-with-gcc-15.patch ./

# this patch could be erroring
# mv buildroot/board/qemu/patches/linux/0001-mips-Add-std-flag-specified-in-KBUILD_CFLAGS-to-vdso.patch ./

# source shared.sh

EXTERNAL_REL_BUILDROOT=$(pwd)/pxe-image/ext-tree
BUILDROOT_DIR=$(pwd)/buildroot/

BR2_EXTERNAL=$(pwd)/pxe-image/ext-tree
export BR2_EXTERNAL

echo "Using default directory ${EXTERNAL_REL_BUILDROOT} for BR2_EXTERNAL"
 
mkdir -p buildroot

# copy the buildroot .config to buildroot directory
cp pxe-image/pxe_image_menuconfig.config buildroot/.config

#p /repo/new_hardware_new_config /repo/buildroot/.config

if [ ! -d "arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu" ]; then
    wget -q https://developer.arm.com/-/media/Files/downloads/gnu/14.2.rel1/binrel/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
    tar -xf arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
    rm arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu.tar.xz
fi

PATH=$PATH:$(pwd)/arm-gnu-toolchain-14.2.rel1-x86_64-aarch64-none-linux-gnu/bin/
export PATH
ARCH=arm64

CC=aarch64-none-linux-gnu-gcc
export CC
CXX=aarch64-none-linux-gnu-g++
export CXX

CROSS_COMPILE=aarch64-none-linux-gnu-
export CROSS_COMPILE

# make -C buildroot -j73

if [ ! -e buildroot/.config ]
then
	echo "MISSING BUILDROOT CONFIGURATION FILE"
    exit -1

else
	echo "USING EXISTING BUILDROOT CONFIG"
	# make -C buildroot BR2_EXTERNAL=${EXTERNAL_REL_BUILDROOT} FORCE_UNSAFE_CONFIGURE=1 -j73
    make -C buildroot -j73
fi
