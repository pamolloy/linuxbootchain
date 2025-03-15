# Buildroot

If there is going to be a community maintaining binary artifacts containing
boot chains on LVFS then there should be a single definition of those boot
chains, even if the boot chains are not uniform (i.e. use different firmware
and image containers). Ideally, that definition should exist in a large well
maintained community based project.

A open boot chain is a biased towards vendors that are relatively transparent
about their boot ROM interfaces and have less complicated interfaces without
hidden or proprietary firmware. Intel/AMD x86 and Qualcomm/Apple aarch64 are
examples of the opposite, while companies like TI and some MediaTek SoCs that
target embedded use cases are more transparent, with documentation that
requires a business relationship, but not on the same level as other vendors.
Therefore a focus on embedded makes a complete boot chain much simpler.
Buildroot is focused primarily on embedded targets.

Buildroot is a long-running well-maintained community-based project that
includes support for dozens of targets and the ability to use custom or
pre-built toolchains.

Additionally, Buildroot has very minimal host dependencies (see [Chapter 2.
System requirements](https://buildroot.org/downloads/manual/manual.html#requirement).

Unlike some build systems it does not require virtualization nor does it depend
on containers. Compared to running on the host, VMs/containers require moving
data in and out of them, do not have the same tools as the hots (e.g. system
vs. application containers, or simply don't match the host distro or user's
preferred tools), and require special knowledge to debug.
