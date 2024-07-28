#!/usr/bin/env bash
set -euxo pipefail

VERSION=20240203-110809-5046fc22
FORMAT=Ubuntu20.04.AppImage

wget -q https://github.com/wez/wezterm/releases/download/$VERSION/WezTerm-$VERSION-$FORMAT
wget -q https://github.com/wez/wezterm/releases/download/$VERSION/WezTerm-$VERSION-$FORMAT.sha256

sha256sum --check WezTerm-$VERSION-$FORMAT.sha256

chmod +x WezTerm-$VERSION-$FORMAT
mv WezTerm-$VERSION-$FORMAT /usr/bin/wezterm

rm WezTerm-$VERSION-$FORMAT.sha256
