#!/usr/bin/env bash
set -euxo pipefail

for f in ./installers/*.sh; do
  bash "$f" 
done
