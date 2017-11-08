#!/bin/sh

BASE_DIR="/home/max/soft/kernel-dev/"

export BUILD_KERNEL="${BASE_DIR}/beagle_linux/"
export BUILD_ROOT="${BASE_DIR}/rootfs/"
export BUILD_ROOT_OVERLAY="${BASE_DIR}/rootfs_extras/overlay/"
export BUILD_ROOT_USERS="${BASE_DIR}/rootfs_extras/users"
export ARCH="arm"
export CROSS_COMPILE="arm-linux-gnueabihf-"

export INSTALL_BASE="${BASE_DIR}/beagle_deploy/"

unset beagle_deploy

beagle_deploy() {
	local boot_path="${INSTALL_BASE}/boot/"
	local mod_path="${INSTALL_BASE}"
	local kernel_release=$(make kernelrelease)
	local modules_dir="${mod_path}/lib/modules/${kernel_release}/"
	local targets="$1"

	rm -rf "${boot_path}" "$mod_path"

	mkdir -p "${boot_path}"
	mkdir -p "${mod_path}"

	[ -z "$targets" ] && targets="zinstall dtbs_install modules_install"
	INSTALL_PATH="${boot_path}" INSTALL_MOD_PATH="${mod_path}" make $targets

	echo "rm -f ${modules_dir}/source ${modules_dir}/build"
	rm -f "${modules_dir}/source" "${modules_dir}/build"
}
