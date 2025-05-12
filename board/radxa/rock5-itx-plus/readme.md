# Radxa ROCK 5 ITX+

## Build

Run the following in the root directory of the ABCD repository.

By default this will use all available cores on the system. If that is not
desired then replace `$(nproc)` in `build.bash` with the desired number.

```bash
board/radxa/rock5-itx-plus/build.bash
```

## Booting

### Boot media selection

Holding the `Maskrom KEY` button next to the `CAM0` connector on boot
configures the boot ROM to not check the available storage for images and
instead immediately try to load an image over USB (see also [Rockchip boot
ROM](../../../doc/rockchip.md)).

Adding a jumper to the 2-pin `RECOVERY` header next to the UART header causes
Radxa's U-Boot to boot the Radxa Roobi OS installer from the eMMC.[^1] Their
Electron app supports installing their custom forks of mainstream distributions
or their own distribution based on Debian to either an SD card or NVMe drive,
but not the on-board eMMC since it is used to store Roobi OS.

### Serial console

The Radxa Rock 6 ITX+ has a 3-pin UART header next to the SD card slot.

The baudrate for this board is 1500000.

### Login

Enter `root` as login user, and the prompt is ready.

## Recovery

If an otherwise unrecoverable error occurs that prevents booting into the
LinuxBoot boot loader or the runtime Linux operating system then the system can
be recovered using Rockchip's
[rkdeveloptool](https://github.com/rockchip-linux/rkdeveloptool). It can load a
recovery image over USB through the boot ROM.

- Connect the Rock 5 ITX+ mainboard to a PC using the USB-C connector located
  between the power barrel connector and HDMI input connector
- Hold the `Maskrom KEY` while powering on the mainboard (see also [Boot media
  selection](#boot-media-selection))
- Run `rkdeveloptool ld` on the PC to confirm communication with the boot ROM
  on the mainboard

## References

- [ROCK 5 ITX](https://forum.radxa.com/c/rock5/5itx) label on the Radxa forum
- [Radxa ROCK 5 ITX+ product page](https://radxa.com/products/rock5/5itxp)
- [ROCK 5 ITX](https://docs.radxa.com/en/rock5/rock5itx) on the Radxa
  documentation website

[^1]: https://github.com/radxa/u-boot/blob/next-dev-v2024.10/arch/arm/mach-rockchip/boot_rkimg.c#L340
