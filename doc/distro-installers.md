Anaconda and Agama provide web-based UIs, which are important features for
headless embedded devices.

## Fedora

Fedora maintains the [Anaconda
installer](https://docs.fedoraproject.org/en-US/quick-docs/anaconda-introduction/),
which is installed into an ISO image using
[kiwi](https://github.com/OSInside/kiwi), which is also used by SUSE.

### Kiwi

The host architecture must match the target architecture and it needs to build
in a Fedora environment.

```
sudo dnf install -y kiwi-cli
git clone https://pagure.io/fedora-kiwi-descriptions.git
cd fedora-kiwi-descriptions
sudo ./kiwi-build --kiwi-file=Fedora.kiwi \
    --image-type=iso \
    --image-profile=Workstation-Live \
    --output-dir=output
```

## Other

- [Agama](https://agama-project.github.io/about) is the installer used by
  OpenSUSE
- [Radxa Roobi OS](https://docs.radxa.com/en/roobi) installs Radxa forks of
  mainline distributions as well as their own distribution based on Debian
