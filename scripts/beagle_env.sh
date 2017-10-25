#!/bin/sh

BASE_DIR="/home/max/soft/kernel-dev/"

export BUILD_KERNEL="${BASE_DIR}/beagle_linux/"
export BUILD_ROOT="${BASE_DIR}/rootfs/"
export BUILD_ROOT_OVERLAY="${BASE_DIR}/rootfs_extras/overlay/"
export BUILD_ROOT_USERS="${BASE_DIR}/rootfs_extras/users"
export ARCH="arm"
export CROSS_COMPILE="arm-linux-gnueabihf-"
