#!/usr/bin/env bash
set -euxo pipefail

wget -qO /tmp/rust-init.sh https://sh.rustup.rs
chmod +x /tmp/rust-init.sh
/tmp/rust-init.sh -y --no-modify-path
rm /tmp/rust-init.sh
