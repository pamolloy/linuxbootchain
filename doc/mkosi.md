mkosi was originally a small script written by Lennart Poettering under the
systemd project that had a period of stagnation, but then saw increased
development under new maintainers. Despite growing significantly, it is still
relatively simple to use and is based around a Bash script that can be simply
downloaded and executed.

It allows users to create custom OS images based on mainline distribution
package management systems. Although the script is extremely simple (when
compared to embedded distro tools or mainline distribution tools), the
distributions themselves introduce significant complexity.

For example, there are host dependencies required for building images for each
type of distribution. In theory that may just be the main package manager for
that distribution. On Fedora 41 I was unable to build a Arch Linux image even
with the `arch-install-scripts` and `archlinux-keyring` packages installed in
Fedora.

Naturally one might try to use a container from the target distribution to
build a mkosi image of that distribution, but that does not seem to work reliably
given that containers provide a very different environment from full systems.

## Cross-building images

mkosi uses `qemu-user-static` when installing packages for targets that don't
match the host architecture. This unfortunately limits the package installation
to a single core. For example, installing packages like `ca-certificates` or
`kernel-modules` can take 5-10 minutes to finish installing.

Since `mkosi` appears to require that the build environment, more or less,
matches the target environment there can be a chicken and egg problem. For
example, one would need to boot a fedora environment on an embedded target in
order to generate a fedora image for that target.

Cloud providers increasingly offer aarch64 VMs, but that comes at some cost and
the largest providers are targeted for more complex use cases and therefore
require more time and experience to setup.

For example, I purchased a Radxa Rock5 ITX+ motherboard with a RK3588 with 4
1.8 GHz cores and 4 2.2 GHz cores. My desktop includes a Intel i7-6700K with 8
4.2 GHz cores. On the Rockchip board a Debian arm64 disk image took 1:42 real
and 38s sys time, while on the Intel board it took 7:32 real and 23s sys.
