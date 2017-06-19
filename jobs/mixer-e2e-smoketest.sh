#!/bin/bash

set -ex

if [ "$CI" == "bootstrap" ]; then
    mkdir -p $GOPATH/src/istio.io
    mv $GOPATH/src/github.com/nlandolfi/mixer $GOPATH/src/istio.io
    cd $GOPATH/src/istio.io/mixer/
fi

env

if [! -d "$GOPATH/src/istio.io/istio" ]; then
    echo "istio.io/istio" not found in GOPATH, cloning..."
    mkdir -p $GOPATH/src/istio.io/
    git clone https://github.com/istio/istio.git $GOPATH/src/istio.io/istio
fi

echo "switching to istio.io/isito"


