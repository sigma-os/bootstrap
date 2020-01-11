#!/bin/bash

SIGMA_IMAGE="sigma.hdd"
SIGMA_N_CPUS="4"

QEMU_HDD_AHCI="-hda $SIGMA_IMAGE"
QEMU_HDD_NVME="-drive file=$SIGMA_IMAGE,if=none,id=nvmedisk0 -device nvme,drive=nvmedisk0,serial=SigmaOSDisk"

QEMU_KVM="-enable-kvm -cpu host"
QEMU_SMP="-smp $SIGMA_N_CPUS"
QEMU_MACHINE="-machine q35"

QEMU_DEBUG="-monitor stdio -serial file:/dev/stdout -no-shutdown --no-reboot"
QEMU_TRACE="-trace nvme_*"

QEMU_ARGS="$QEMU_KVM $QEMU_SMP $QEMU_MACHINE $QEMU_DEBUG $QEMU_HDD_NVME"

qemu-system-x86_64 $QEMU_ARGS | c++filt