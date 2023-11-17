#!/bin/bash
set -euo pipefail
IFS=$'\n\t'

runuser -l dev -c 'sh -c "$(curl -fsLS get.chezmoi.io)"
./bin/chezmoi init --apply https://github.com/vohoanglong0107/dotfiles.git
nvim --headless "+Lazy! sync" +qa'

# preserve env, as sshd wipe all env
# https://stackoverflow.com/a/34631891
env | egrep -v "^(HOME=|USER=|MAIL=|LC_ALL=|LS_COLORS=|LANG=|HOSTNAME=|PWD=|TERM=|SHLVL=|LANGUAGE=|_=)" >> /etc/environment

/usr/sbin/sshd -D -h "/id_ed25519"
