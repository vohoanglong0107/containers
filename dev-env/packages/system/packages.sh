#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
# shellcheck disable=SC2046
dnf install -y $(tr '\n' ' ' <"${SCRIPT_DIR}/packages.txt")
dnf clean all
