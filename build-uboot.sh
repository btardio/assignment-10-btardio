#!/bin/bash

make -C u-boot clean
make -C u-boot distclean


# Copy a config
cp u-boot-menuconfig.config u-boot/.config


# Menuconfig
# make -C u-boot menuconfig ARCH=aarch64 CROSS_COMPILE=aarch64-none-linux-gnu-


# Enable the default Config
# USECONFIG=rpi_arm64_defconfig
# USECONFIG=rpi_3_b_plus_defconfig
# make -C u-boot $USECONFIG ARCH=aarch64 CROSS_COMPILE=aarch64-none-linux-gnu-



# this file has multiple definitions for save_boot_params
cp ./save_prev_bl_data.c /repo/u-boot/arch/arm/lib/save_prev_bl_data.c
cp ./lowlevel_init.S /repo/u-boot/board/raspberrypi/rpi/lowlevel_init.S


# Make

make -C u-boot -j71 ARCH=arm CROSS_COMPILE=aarch64-none-linux-gnu- 


# And copy from staging

cp /repo/u-boot/u-boot.bin ./tftpboot/u-boot.bin
cp "/repo/tftpboot-staging/start.elf" "/repo/tftpboot/"
cp "/repo/tftpboot-staging/config.txt" "/repo/tftpboot/"
cp "/repo/tftpboot-staging/bcm2712-rpi-5-b.dtb" "/repo/tftpboot/"
cp "/repo/tftpboot-staging/bcm2712d0-rpi-5-b.dtb" "/repo/tftpboot/"
cp "/repo/tftpboot-staging/bootcode.bin" "/repo/tftpboot/"


