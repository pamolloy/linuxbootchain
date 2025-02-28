mkosi was originally a small script written by Lennart Poettering under the
systemd project that had a period of stagnation, but then saw increased
development under new maintainers. Despite growing significantly, it is still
relatively simple to use and is based around a Bash script that can be simply
downloaded and executed.

It allows users to create custom OS images based on mainline distribution
package management systems. Although the script is extremely simple (when
compared to embedded distro tools or mainline distribution tools), the
distributions themselves introduce significant complexity.

- [ ] Could it be used as a system installer with a text or graphical front end?
- [ ] Perhaps embedded into a LinuxBoot to build a debug initramfs on-demand?

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
