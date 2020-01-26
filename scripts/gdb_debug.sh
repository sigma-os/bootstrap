#!/bin/bash
../src/scripts/run_qemu.sh '-s -S' &

gdb ./system-root/usr/sigma/bin/sigma.bin -ix ../src/scripts/gdbinit