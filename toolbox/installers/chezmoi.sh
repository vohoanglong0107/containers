#!/usr/bin/env bash
set -euxo pipefail

VERSION=2.34.3
URL=https://github.com/twpayne/chezmoi/releases/download/v${VERSION}

wget -q ${URL}/chezmoi_${VERSION}_linux_amd64.tar.gz \
       ${URL}/chezmoi_${VERSION}_checksums.txt \
       ${URL}/chezmoi_${VERSION}_checksums.txt.sig \
       ${URL}/chezmoi_cosign.pub
cosign verify-blob --key=chezmoi_cosign.pub \
                     --signature=chezmoi_${VERSION}_checksums.txt.sig \
                     chezmoi_${VERSION}_checksums.txt
sha256sum --check chezmoi_${VERSION}_checksums.txt --ignore-missing
tar -xzvf chezmoi_${VERSION}_linux_amd64.tar.gz chezmoi completions/chezmoi.zsh
install -m +x chezmoi /usr/bin/chezmoi
chown root:root completions/chezmoi.zsh
mv completions/chezmoi.zsh /usr/share/zsh/site-functions/_chezmoi
rm chezmoi chezmoi_${VERSION}_linux_amd64.tar.gz chezmoi_${VERSION}_checksums.txt chezmoi_${VERSION}_checksums.txt.sig chezmoi_cosign.pub

