# U-Boot boot loaders

U-Boot includes some level of UEFI support and there is active development on
ACPI.

It implements a `bootflow scan -lb` command, which will search for bootable
images and boot the highest priority image. But there does not appear to be a
classic boot menu and the image search process can be very slow.

Although it is possible to include an initramfs inside a kernel image, most
distributions distribute them separately, which means the kernel boot loader
needs to support loading the initramfs into memory and passing it to the
kernel. This is typically done by yet another UEFI boot stage. Therefore
U-Boot's `bootefi` command, unlike other boot commands, does not support an
initramfs as an argument. Therefore to use U-Boot as a boot stage one also
needs to use an additional boot stage that can handle loading the initramfs.

## Boot stages

U-Boot used to be a monolith, but has long since been split into stages (see
[Booting from TPL/SPL](https://docs.u-boot.org/en/latest/usage/spl_boot.html)).
The U-Boot TPL contains valuable platform specific hardware initialization code
(e.g. DDR init), while U-Boot "proper" contains higher level code that could
execute in userspace.
