#!/bin/bash

CC=aarch64-none-linux-gnu-gcc
export CC
CXX=aarch64-none-linux-gnu-g++
export CXX

CROSS_COMPILE=aarch64-none-linux-gnu-
export CROSS_COMPILE

rm -rf buildroot/package/libopenssl || true
rm -rf buildroot/package/openssl || true

cp /repo/buildroot.package.Config.in /repo/buildroot/package/Config.in

make -C buildroot BR2_EXTERNAL=/repo/ext-tree -j73

#ARCH=arm CROSS_COMPILE=aarch64-linux-gnu-
