## Sigma OS Bootstrap

To bootstrap Sigma OS follow these steps:

Required tools `git` `xbstrap` `meson` `nasm` `sudo`

1. Clone this repo into ./src `git clone https://www.github.com/sigma-os/bootstrap ./src`
2. Create a build dir and go to it `mkdir ./build && cd ./build`
3. Initialize xbstrap `xbstrap init ../src`
4. Compile and install everything (warning: on first run this step may take a *long* time) `xbstrap install --all`
   
   Alternatively it should be enough to call `xbstrap install --reconfigure sigma-system`, this should still take a long time though
5. Launch QEMU with `../src/scripts/run_qemu.sh` or write hdd.bin to a disk or USB stick

Notes:
- Large parts of bootstrap.yml and patches were taken from [managarm/bootstrap-managarm](https://github.com/managarm/bootstrap-managarm)
- The [image-create](https://gitlab.com/qookei/image_create) script uses `losetup` and thus asks for root access via sudo