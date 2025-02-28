# Tiny kernel

If the persistent storage for the boot loaders is relatively small (e.g. 16M or
32M SPI flash) then the kernel needs to be reduced. The mainline arm64
defconfig builds an ~40M Image.

The mainline kernel only maintains a single defconfig for arm64, as well as
hardening and virt fragments. Therefore a kernel may either be configured by
disabling dozens of options in the mainline defconfig or by starting from
scratch using `make allnoconfig` and enabling the necessary options for the
target.

Although the additive approach does not use a mainline defconfig, it is much
easier to craft a smaller kernel. Buildroot does not appear to support the
`allnoconfig` target in `linux/linux.mk` so at least temporarily defconfigs
created with `allnoconfig` and `ARCH=arm64 CROSS_COMPILE=aarch64-linux-gnu-`
are stored in `linux/`.

## Kconfig

There is no option to append to kconfig variables. For example,
`BR2_LINUX_KERNEL_CONFIG_FRAGMENT_FILES` may be combined from fragments defined
in Buildroot, the LinuxBoot `BR2_EXTERNAL` board specific fragment and generic
LinuxBoot fragment. Therefore the entire list of fragments is stored in the
corresponding board specific defconfig in `configs/`.
