#!/bin/bash
qemu-system-x86_64 -enable-kvm -hda sigma.hdd -monitor stdio -serial file:/dev/stdout -smp 4 -machine q35 -no-shutdown --no-reboot -cpu host | c++filt