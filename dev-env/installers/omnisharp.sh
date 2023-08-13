#!/usr/bin/env bash
set -euxo pipefail

VERSION=v1.39.8
URL=https://github.com/OmniSharp/omnisharp-roslyn/releases/download/$VERSION

wget -q $URL/omnisharp-linux-x64-net6.0.tar.gz
mkdir /usr/local/omnisharp
tar -C /usr/local/omnisharp -xzvf omnisharp-linux-x64-net6.0.tar.gz
ln -s /usr/local/omnisharp/OmniSharp /usr/local/bin/OmniSharp
rm omnisharp-linux-x64-net6.0.tar.gz