#!/bin/bash
qemu-system-x86_64 -hda hdd.bin -enable-kvm -monitor stdio -serial file:/dev/stdout -smp 4 -machine q35 -d int -s -S &

gdb -ix ../src/scripts/gdbinit