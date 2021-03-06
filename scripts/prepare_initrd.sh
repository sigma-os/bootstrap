#!/bin/bash

mkdir -p initrd/usr/{bin,lib}

install -s system-root/usr/lib/ld.so initrd/usr/lib/
install -s system-root/usr/lib/libc.so initrd/usr/lib/
install -s system-root/usr/lib/libm.so initrd/usr/lib/
install -s system-root/usr/lib/libkbus.so initrd/usr/lib/
install -s tools/system-gcc/x86_64-sigma/lib64/libgcc_s.so.1 initrd/usr/lib/
install -s tools/system-gcc/x86_64-sigma/lib64/libstdc++.so.6 initrd/usr/lib/

install -s system-root/usr/bin/zeta initrd/usr/bin/
install -s system-root/usr/bin/kbus initrd/usr/bin/

install -s system-root/usr/bin/ata initrd/usr/bin/
install -s system-root/usr/bin/ahci initrd/usr/bin/
install -s system-root/usr/bin/nvme initrd/usr/bin/
install -s system-root/usr/bin/vbe initrd/usr/bin/
install -s system-root/usr/bin/bga initrd/usr/bin/

install -s system-root/usr/bin/xhci initrd/usr/bin/

rm -f ./system-root/usr/sigma/bin/initrd.tar

cd initrd
tar -czf ../system-root/usr/sigma/bin/initrd.tar * --transform='s/^/\//'
cd ..