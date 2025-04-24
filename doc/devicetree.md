# devicetree

The devicetree is a description of the hardware in a system that is independent
of the operating system. It is currently maintained by an independent project
that maintains a specification on Github and is largely supported by Linaro.

It originally was derived from SPARC-based systems as part of the Open Firmware
project, which is why it is often referenced with `of` in the kernel. Since
then it has been adopted by numerous other architectures.

It has also been adopted to describe binary firmware archive images known as
FIT images that originally came from the U-Boot boot loader. It is also used in
the Zephyr RTOS targeting microcontrollers.

U-Boot for example, regularly copies devicetrees from the kernel into
`dts/upstream/` within its own source tree. By default that devicetree will be
passed to the kernel, regardless of the version or tree used to build the
kernel. That is selected by the `CONFIG_DEFAULT_DEVICE_TREE` Kconfig option.

Kernel maintainers encourage contributors to document complete devicetree
bindings in `Documentation/devicetree/bindings` even if a driver only supports
some of the functionality described by the binding.

Although it is intended to be a generic description of hardware, it is also
sometimes used to describe software.

- `bootargs` may contain non-hardware specific configuration
- U-Boot adds its version as a node to the devicetree passed to the kernel
- Memory regions may be reserved for application specific system software
- FPGAs may be treated like hardware, but can be reconfigured at runtime

No guarantees are made between kernel versions. Furthermore, vendors tend to do
all sorts of weird things in their trees.

## ACPI

ACPI provides a standardized interface for communicating hardware specific
information **and configuring hardware**. But in doing so it adds significant
complexity to the system.

## Real world examples

- [Chromebook Boot
  Flow](https://docs.kernel.org/arch/arm/google/chromebook-boot-flow.html) in
  the mainline kernel documentation
- [Device Trees, overlays, and
  parameters](https://www.raspberrypi.com/documentation/computers/configuration.html#device-trees-overlays-and-parameters)
  for Raspberry Pi OS
- [Where do I get a devicetree file for my
  board?](https://docs.u-boot.org/en/latest/develop/devicetree/control.html#where-do-i-get-a-devicetree-file-for-my-board)
  in the mainline U-Boot documentation
- [Unified Kernel Image
  (UKI)](https://uapi-group.org/specifications/specs/unified_kernel_image/) may
  optionally included a devicetree
- [Secure boot without UEFI: booting virtual machines on
  Power(PC)](https://archive.fosdem.org/2021/schedule/event/firmware_sbwubvop/)
