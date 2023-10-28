#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )

find ${SCRIPT_DIR} \
  -maxdepth 1 \
  -type f \
  -regex '.*[0-9][0-9]_[a-z]+.sh' \
  -print0 | sort -z | xargs -r -P 1 -0I% bash -c 'cd `mktemp -d`; %;'

find ${SCRIPT_DIR} \
  -maxdepth 1 \
  -type f \
  ! -name 'installers.sh' \
  ! -regex '.*[0-9][0-9]_[a-z]+.sh' \
  -print0 | xargs -r -P 0 -0I% bash -c 'cd `mktemp -d`; %;'
