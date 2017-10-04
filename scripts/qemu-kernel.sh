#/bin/sh

. kernel_env.sh

echo qemu-system-i386 \
	-kernel "${BUILD_KERNEL}/arch/i386/boot/bzImage" \
	-append "root=/dev/sda" \
	-hda "${BUILD_ROOT}/images/rootfs.ext3" \
	-redir tcp:8022::22
qemu-system-i386 \
	-kernel "${BUILD_KERNEL}/arch/i386/boot/bzImage" \
	-append "root=/dev/sda" \
	-hda "${BUILD_ROOT}/images/rootfs.ext3" \
	-redir tcp:8022::22
