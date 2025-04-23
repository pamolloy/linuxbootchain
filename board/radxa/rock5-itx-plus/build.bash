#!/usr/bin/env bash

set -ex

git submodule update --init --recursive
cd buildroot
make BR2_EXTERNAL="${PWD}/.." rock5_itx_plus_defconfig
support/kconfig/merge_config.sh .config \
    ../configs/buildroot.fragment \
    ../configs/linuxboot.fragment \
    ../configs/systemd.fragment \
    ../configs/debug.fragment
make -j "$(nproc)"
