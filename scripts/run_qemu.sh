#!/bin/bash

SIGMA_IMAGE="sigma.hdd"
SIGMA_N_CPUS="4"
SIGMA_N_RAM="1G"

QEMU_HDD_AHCI="-hda $SIGMA_IMAGE"
QEMU_HDD_NVME="-drive file=$SIGMA_IMAGE,if=none,id=nvmedisk0 -device nvme,drive=nvmedisk0,serial=SigmaOSDisk"
QEMU_HDD_USB="-drive if=none,id=usbdisk0,file=$SIGMA_IMAGE -device usb-storage,bus=xhci0.0,drive=usbdisk0"

QEMU_KVM="-enable-kvm -cpu host"
QEMU_SMP="-smp $SIGMA_N_CPUS"
QEMU_MACHINE="-machine q35 -m $SIGMA_N_RAM"

QEMU_INTEL_IOMMU="-device intel-iommu,aw-bits=48" # aw-bits=48 is 4 level paging
QEMU_AMD_IOMMU="-device amd-iommu"

QEMU_XHCI=" -device nec-usb-xhci,id=xhci0"

QEMU_GPU="-vga std"

QEMU_DEBUG="-monitor stdio -serial file:/dev/stdout -no-shutdown -no-reboot -d int"
#QEMU_TRACE="-trace usb_xhci*"

QEMU_ARGS="$QEMU_KVM $QEMU_SMP $QEMU_MACHINE $QEMU_GPU $QEMU_XHCI $QEMU_TRACE $QEMU_DEBUG $QEMU_HDD_NVME $1"

qemu-system-x86_64 $QEMU_ARGS | c++filt