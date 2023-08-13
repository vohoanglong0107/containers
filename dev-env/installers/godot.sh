#!/usr/bin/env bash
set -euxo pipefail

VERSION=3.5.2-stable
URL=https://github.com/godotengine/godot/releases/download/$VERSION

wget -q $URL/Godot_v${VERSION}_mono_x11_64.zip
mkdir /usr/local/godot
unzip Godot_v${VERSION}_mono_x11_64.zip -d /usr/local/godot
ln -s /usr/local/godot/Godot_v${VERSION}_mono_x11_64/Godot_v${VERSION}_mono_x11.64 /usr/local/bin/godot
rm Godot_v${VERSION}_mono_x11_64.zip