#!/bin/bash

rm -rf /repo/buildroot/output/build/linux-custom/

git submodule update --init 

CC=aarch64-none-linux-gnu-gcc
export CC
CXX=aarch64-none-linux-gnu-g++
export CXX

CROSS_COMPILE=aarch64-none-linux-gnu-
export CROSS_COMPILE

#rm -rf buildroot/package/libopenssl || true
#rm -rf buildroot/package/openssl || true

cp /repo/good-working-config /repo/buildroot/.config
mkdir -p /repo/buildroot/output/build/linux-custom/
cp /repo/linux.config /repo/buildroot/output/build/linux-custom/.config

make -C buildroot BR2_EXTERNAL=/repo/ext-tree -j73 linux-menuconfig

cp /repo/buildroot/output/build/linux-custom/.config /repo/linux.config

make -C buildroot BR2_EXTERNAL=/repo/ext-tree -j73 menuconfig
make -C buildroot BR2_EXTERNAL=/repo/ext-tree -j73

cp -r /repo/buildroot/output/images/ /repo/

cp /repo/config.txt /repo/images/
cp /repo/cmdline.txt /repo/images/

scp -r /repo/images/* "btardio@192.168.1.196":/var/lib/tftpboot/

#ARCH=arm CROSS_COMPILE=aarch64-linux-gnu-
