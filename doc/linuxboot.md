# LinuxBoot-style boot loaders

A LinuxBoot boot loader is a boot stage that uses the Linux kernel and runs
software in user-space to inevitably kexec a runtime kernel. For more
information see the [LinuxBoot Book](https://book.linuxboot.org/).

## Yet another LinuxBoot

Numerous LinuxBoot implementations exist, with u-root being the most popular
and least architecture specific. Using Buildroot has several advantages over
u-root:

- Buildroot already includes toolchains, numerous boot loaders, platform/target
  configuration, and countless utilities
- u-root includes limited functionality that may be sufficient for a production
  runtime, but can be frustrating for development and debugging. Buildroot
  supports adding additional utilities for development and debugging
- Use standard implementations rather than requiring a Go implementation
  (e.g. kexec-tools)
- The Go applications that make up the bulk of u-root can still can be used as
  Buildroot packages
