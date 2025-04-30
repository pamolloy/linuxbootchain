# A boot chain distribution (ABCD)

![Wall artwork with A, B, C, and D options like on a ballot and the text
  "Method of Transition"](doc/method-of-transition.webp)

ABCD is a distribution of complete boot chains that span from the first stage
mask ROM that is etched into a chip up until the runtime operating system. Just
like a mainstream Linux distribution, ABCD aims to provide binary artifacts
that are painless to install and update. While Linux distributions provide
installers and images for PCs, servers, IoT devices, and containers as well as
spins for various desktop environments, ABCD provides boot chains consisting of
a variety of boot loaders for many different types of devices.

ABCD aims to be as generic as possible and provide boot chain maintainers with
ample freedom, while maintaining [a rigorous set of
guidelines](doc/design-a-chain.md). It also leverages existing mature
community-based projects like [Buildroot](doc/buildroot.md), LVFS/fwupd,
[U-Boot SPL](doc/u-boot.md), and
[LinuxBoot](https://book.linuxboot.org/#what-is-linuxboot), which reduces
maintenance and prevents reinventing the wheel.
