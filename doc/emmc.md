LinuxBoot can be implemented using many different components that can each be
configured in countless ways that can result in images of a few megabytes to
hundreds of megabytes. The larger sized images include more tools, which can
help during development or debugging, but a typical SPI flash cannot store
hundreds of megabytes.

Since the JEDEC v4.3 eMMC standard released in 2007, eMMC devices have included
redundant 4 MB hardware partitions for boot loaders. Additionally, larger "enhanced"
hardware partitions can be configured that use pseudo SLC instead of MLC, which
is intended to provide better reliability, endurance and performance.

## See also

- [eMMC Hardware Partitioning](https://www.pengutronix.de/en/blog/2020-10-15-anpassen-einer-emmc.html)
  by Jürgen Borleis and Jan Lübbe at Pengutronix
- [MMC tools introduction](https://www.kernel.org/doc/html/latest/driver-api/mmc/mmc-tools.html)
  on kernel.org
