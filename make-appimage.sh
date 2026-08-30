#!/bin/sh

set -eu

ARCH=$(uname -m)
export ARCH
export OUTPATH=./dist
export ADD_HOOKS="self-updater.hook"
export UPINFO="gh-releases-zsync|${GITHUB_REPOSITORY%/*}|${GITHUB_REPOSITORY#*/}|latest|*$ARCH.AppImage.zsync"
export ICON=/usr/share/icons/hicolor/scalable/apps/com.ktechpit.whatsie.svg
export DESKTOP=/usr/share/applications/com.ktechpit.whatsie.desktop
export USE_HOST_DRIVERS_EXPERIMENTAL=1
export DEPLOY_PIPEWIRE=1

# Deploy dependencies
quick-sharun /usr/bin/whatsie

# Turn AppDir into AppImage
quick-sharun --make-appimage
