#!/bin/bash
qemu-system-x86_64 -hda sigma.hdd -serial file:/dev/stdout -smp 4 -machine q35 -d int -no-shutdown -no-reboot -s -S &

gdb ./system-root/usr/sigma/bin/sigma.bin -ix ../src/scripts/gdbinit