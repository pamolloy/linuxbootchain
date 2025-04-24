# How-to optimize space

A mix of compression and kernel/root filesystem size optimization is often
required to fit images into the 16 or 32 MiB flash parts that are common on
motherboards.

## Kernel

The kernel itself may be compressed, as well as the initramfs that can be
optionally appended to the kernel image (see `INITRAMFS_SOURCE`). That can be
done by the Linux boot loader or by the kernel itself.

The kernel includes early code to extract the remainder of the kernel on boot.
Unfortunately, that appears to depend on EFI. `KERNEL_<format>` depends on
`HAVE_KERNEL_<format>`, which in turn can only be selected by `EFI` or similar
options and is disabled for 32-bit ARM.

- [ ] Does the kernel self-extracting code really need EFI?
- [ ] Why does the kernel self-extracting code exist? It originates from the
  early days of the kernel and now spans many architectures. Does it avoid
  doing the extraction in vendor specific and often proprietary boot loaders?
