#!/usr/bin/env bash
set -euxo pipefail

VERSION=v1.16.0

wget -qO /usr/local/bin/bazel https://github.com/bazelbuild/bazelisk/releases/download/${VERSION}/bazelisk-linux-amd64
chmod +x /usr/local/bin/bazel
