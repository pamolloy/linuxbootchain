# U-Boot boot loaders

The U-Boot project is a collection of boot loaders and image creation tools
based primarily on C, Kconfig, devicetree and Python that has an enormous set
of overlapping features that have been under development since the early 2000s.

The project could be used to create a binary boot chain distribution for a
specific set of use cases and targets. This does not include use cases where
other boot loaders are required or desired (e.g. LinuxBoot, coreboot, ATF).

The entire boot loader ecosystem would be healthier if each U-Boot component
were developed somewhat independently. The long history of the project and
countless overlapping features introduce significant complexity. Developing the
components separately would provide clear boundaries between each component and
well defined responsibilities. U-Boot therefore provides an example of why an
independent boot chain distribution is necessary.

## Boot commands

U-Boot includes some level of UEFI support and there is active development on
ACPI.

It implements a `bootflow scan -lb` command, which will search for images and
boot the highest priority image. But there does not appear to be a classic boot
menu and the image search process is much slower than other implementations.

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
execute in user-space.

## Image creation

In addition to the aforementioned boot loaders, the U-Boot project includes
tools to create image containers for binary artifacts. `mkimage` creates a
image container called FIT that typically contains a kernel image and a
devicetree.
[binman](https://docs.u-boot.org/en/latest/develop/package/binman.html)
creates containers specific to SoC vendor boot ROM implementations that may
include FIT images and U-Boot TPL/SPL.
