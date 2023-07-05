#!/usr/bin/env bash
set -euxo pipefail

git clone --single-branch --depth 1 https://github.com/ohmyzsh/ohmyzsh.git "${ZSH}"
git clone --single-branch --depth 1 https://github.com/romkatv/powerlevel10k.git "${ZSH}/custom/themes/powerlevel10k"
git clone --single-branch --depth 1 https://github.com/zsh-users/zsh-autosuggestions.git "${ZSH}/custom/plugins/zsh-autosuggestions"
git clone --single-branch --depth 1 https://github.com/zsh-users/zsh-syntax-highlighting.git "${ZSH}/custom/plugins/zsh-syntax-highlighting"
