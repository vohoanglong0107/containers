#!/usr/bin/env bash
set -euxo pipefail

wget -qO wezterm https://github.com/wez/wezterm/releases/download/20240203-110809-5046fc22/WezTerm-20240203-110809-5046fc22-Ubuntu20.04.AppImage
chmod +x wezterm
mv wezterm /usr/bin
