#!/bin/bash

set -ex

if [ "$CI" == "bootstrap" ]; then
    mkdir -p $GOPATH/src/istio.io
    mv $GOPATH/src/github.com/nlandolfi/mixer $GOPATH/src/istio.io
    cd $GOPATH/src/istio.io/mixer/
fi

env

echo "=== Bazel Build ==="
bazel fetch -k //...
bazel build //...

echo "=== Bazel Tests ==="
bazel test //...

echo "=== Code Check ==="
./bin/linters.sh
./bin/racetest.sh
