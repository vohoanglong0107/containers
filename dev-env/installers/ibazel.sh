#!/usr/bin/env bash
set -euxo pipefail

VERSION=v0.22.0

wget -q https://github.com/bazelbuild/bazel-watcher/releases/download/$VERSION/ibazel_linux_amd64
mv ibazel_linux_amd64 /usr/local/bin/ibazel
chmod +x /usr/local/bin/ibazel
