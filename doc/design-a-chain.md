# Boot chain design guidelines

Although the LBC project aims to provide as much discretion to board
maintainers as possible, there are a few fundamental principles that should be
adhered to by all boot chains:

- Use a [LinuxBoot](https://www.linuxboot.org/) implementation
- Stay as far away from UEFI as possible
- Do not include U-Boot "proper", however the TPL and SPL are perfectly fine,
  especially when there is no coreboot/oreboot support
- Use well-maintained mainstream community developed solutions rather than
  reimplementations with less support and fewer features
- Try to leave space for redundant images or partitions to support atomic updates
- Consider ROM features like what types of storage are supported and whether
  fallback is supported by searching a device for valid images
    - Document configuration of boot device selection like a header that can be
      configured with jumpers
- Consider storage features like eMMC hardware partitions
