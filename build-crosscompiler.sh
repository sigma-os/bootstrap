#!/bin/bash

if [ "$#" -ne "1" ]; then
printf "Please use 1 argument it is the installation directory"
exit
fi

echo "Clearing previous downloads"

rm -rf gcc-build
rm -rf binutils-build
rm -rf gcc-9.1.0
rm -rf binutils-2.32

echo "Downloading sources"
curl https://ftp.gnu.org/gnu/binutils/binutils-2.32.tar.xz | tar xfJ -
curl https://ftp.gnu.org/gnu/gcc/gcc-9.1.0/gcc-9.1.0.tar.xz | tar xfJ -

mkdir gcc-build
mkdir binutils-build

echo "Building binutils"

cd binutils-build
../binutils-2.32/configure --target=x86_64-elf --prefix="$1" --with-sysroot --disable-werror

make -j$(nproc)
make install


which -- $1/bin/x86_64-elf-as || echo "Couldn't find x86_64-elf-as"

echo "Building GCC"

cd ../gcc-9.1.0
./contrib/download_prerequisites

cd ../gcc-build
../gcc-9.1.0/configure --target=x86_64-elf --prefix="$1" --enable-languages=c,c++ --without-headers

make all-gcc -j$(nproc)
make all-target-libgcc CFLAGS_FOR_TARGET='-g -O2 -mcmodel=kernel -mno-red-zone' || true -j$(nproc)
sed -i 's/PICFLAG/DISABLED_PICFLAG/g' x86_64-elf/libgcc/Makefile
make all-target-libgcc CFLAGS_FOR_TARGET='-g -O2 -mcmodel=kernel -mno-red-zone' -j$(nproc)
make install-gcc
make install-target-libgcc

cd ..

rm -rf gcc-9.1.0
rm -rf binutils-2.32
rm -rf gcc-build
rm -rf binutils-build
