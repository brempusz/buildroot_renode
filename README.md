### Buildroot project that allows building linux images for [Renode](https://github.com/renode/renode) machines.

* Based on https://github.com/buildroot/buildroot/tree/master/board/qemu/riscv32-virt.
* DTB extracted by adding `-machine dumpdtb=renode_riscv32_virt.dtb` parameter to original `start-qemu.sh`.
* DTS created with `dtc -o renode_riscv32_virt.dts renode_riscv32_virt.dtb`
* Base `repl` file downloaded from [renodepedia](https://renodepedia.renode.io/boards/riscv32_virtual/?view=hardware&demo=hello_world) and manualy updated to match DTB/DTS.

* Example configuration for `renode_riscv32_virt_defconfig`:
  - Works with Renode 1.15.1
  - OpenSBI 1.5
  - Linux kernel version 6.6.36 (no patches)


Usage:

1. Learn how to configure and use buildroot by reading [buildroot manual](https://buildroot.org/downloads/manual/manual.html#_getting_started).
2. Use "external configuration" to build renode-ready linux image, renode platform description and startup script:
```
git clone https://github.com/buildroot/buildroot.git
git clone https://github.com/brempusz/buildroot_renode.git
cd buildroot
make BR2_EXTERNAL=../buildroot_renode/buildroot renode_riscv32_virt_defconfig
make
cd output/images
PATH=/path/to/renode/binary/directory:$PATH ./start-renode_riscv32_virt.sh
```
3. Enjoin!
   
