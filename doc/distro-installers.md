# Mainstream Linux distribution installation programs

Anaconda and Agama provide web-based user interfaces, which are important
features for headless embedded devices.

## Fedora

Fedora maintains the [Anaconda installation
program](https://docs.fedoraproject.org/en-US/quick-docs/anaconda-introduction/),
which is installed into an ISO image using
[kiwi](https://github.com/OSInside/kiwi), which is also used by SUSE.

### Kiwi

The host architecture must match the target architecture and it needs to build
in a Fedora environment.

```bash
sudo dnf install -y kiwi-cli
git clone https://pagure.io/fedora-kiwi-descriptions.git
cd fedora-kiwi-descriptions
sudo ./kiwi-build --kiwi-file=Fedora.kiwi \
    --image-type=iso \
    --image-profile=Workstation-Live \
    --output-dir=output
```

## OpenSUSE

OpenSUSE maintains the [Agama](https://agama-project.github.io/about)
installer, which saw a major architectural change with version 19 in March,
2026.[^1] It now consists of a core application with a standardized interface
for web, CLI and unattended clients.

[^1]: [Agama 19 - A New Beginning](https://agama-project.github.io/blog/2026/03/20/agama-19)

## Other


- [Radxa Roobi OS](https://docs.radxa.com/en/roobi) installs Radxa forks of
  mainline distributions as well as their own distribution based on Debian
- [Khadas OOWOW](https://docs.khadas.com/software/oowow/getting-started)
