# u-root

u-root provides mature userspace code for finding images and loading the
runtime Linux kernel, which can be used to implement a LinuxBoot boot loader.
It uses kexec to load the runtime kernel and is implemented in Go.
Unfortunately, that leads to reimplementing standard upstream projects like
[kexec-tools](https://web.git.kernel.org/pub/scm/utils/kernel/kexec/kexec-tools.git/)
and makes debugging more difficult because it lacks many standard Linux
utilities.

Rather than using u-root, it is also possible to directly install the Go
packages it consists of, however there still may be issues. For example,
commands like `boot` do not call `kexec` as an executable, but rather call into
functions that implement kexec.
