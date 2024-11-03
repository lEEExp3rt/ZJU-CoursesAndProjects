# Compile
make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- defconfig
make ARCH=riscv CROSS_COMPILE=riscv64-linux-gnu- -j4

# Terminal 1
qemu-system-riscv64 -nographic -machine virt -kernel /home/lqy/ZJU/Rinux/linux-6.11/arch/riscv/boot/Image \
    -device virtio-blk-device,drive=hd0 -append "root=/dev/vda ro console=ttyS0" \
    -bios default -drive file=/home/lqy/ZJU/os24fall-stu/src/lab0/rootfs.img,format=raw,id=hd0 -S -s

# Terminal 2
gdb-multiarch /home/lqy/ZJU/Rinux/linux-6.11/vmlinux

source /home/lqy/.gdbinit-gef.py