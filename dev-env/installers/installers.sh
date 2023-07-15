#!/usr/bin/env bash
set -euxo pipefail

SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
find ${SCRIPT_DIR} \
  -maxdepth 1 \
  -type f \
  ! -name 'installers.sh' \
  -print0 | xargs -P 0 -n 1 -0 bash -c 
