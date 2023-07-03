#!/usr/bin/env bash
set -euxo pipefail

dnf config-manager --add-repo https://rpm.releases.hashicorp.com/fedora/hashicorp.repo
# shellcheck disable=SC2046
dnf install -y $(tr '\n' ' ' <packages.txt)
dnf clean all
