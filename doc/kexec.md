# kexec

`kexec` is a kernel boot loader that skips the boot loaders that execute when
power cycling a device.

Note that there are ways `kexec` runs. Either "without an option parameter",
which loads the kernel and runs `shutdown` assuming that `shutdown` supports
kexec-based rebooting by running `kexec -e`. Alternatively with `-l` and then
`-e`, which loads the kernel and runs `reboot`.

Given that the implementation of `reboot` and `shutdown` is varied, it is
difficult to understand how this behaves across all environments.

Fedora ships the kernel with `CONFIG_EFI_STUB`, which can only be booted from
UEFI firmware because it adds a special header and additional "stub" code that
executes before the kernel that mimics common functionality of UEFI kernel boot
loaders. `kexec` indirectly gets around the header and extra code since it is
designed to act as a kernel boot loader and therefore skip the system boot
loaders.
