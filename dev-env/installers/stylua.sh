#!/usr/bin/env bash
set -euxo pipefail

VERSION=v0.17.1

wget -q https://github.com/JohnnyMorganz/StyLua/releases/download/${VERSION}/stylua-linux.zip
unzip stylua-linux.zip -d /usr/local/bin
chmod +x /usr/local/bin/stylua
rm stylua-linux.zip
