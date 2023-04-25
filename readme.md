# rootfs

## Compilation

1. Set `RISCV` and `CROSS_COMPILE` environment variables.

    The following values are used by default:
    ```
    RISCV=/opt/riscv
    CROSS_COMPILE=riscv64-unknown-linux-gnu-
    ```

2. Run `make` to compile all apps. You can optionally specify `make -jN` for parallel compilation.

    Compiled apps will be installed at `initramfs/`, and a manifest file `initramfs.txt` will be generated.

3. Compile Linux kernel with initramfs.

    Specify `CONFIG_INITRAMFS_SOURCE` in your Linux kernel configuration with the absolute path of `initramfs.txt`
    to include initramfs in Linux kernel compilation.
