#!/bin/bash

DEFAULT_RUST_VERSION="stable"

if [[ ! $BASH_SOURCE ]]; then
    echo "You cannot source this script. Run it as ./$0" >&2
    exit 33
fi

VIRTUALIZE_RUST_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE}" )" &> /dev/null && pwd )

if [[ $1 ]]; then
    VIRTUALIZE_RUST_VERSION=$1
elif [[ ! $VIRTUALIZE_RUST_VERSION ]]; then
    VIRTUALIZE_RUST_VERSION=$DEFAULT_RUST_VERSION
fi

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > $VIRTUALIZE_RUST_DIR/bootstrap_rustup.sh
(
    cd $VIRTUALIZE_RUST_DIR
    RUSTUP_HOME=$VIRTUALIZE_RUST_DIR/rustup CARGO_HOME=$VIRTUALIZE_RUST_DIR/cargo sh ./bootstrap_rustup.sh -y --no-modify-path
    $VIRTUALIZE_RUST_DIR/cargo/bin/rustup default $VIRTUALIZE_RUST_VERSION
)    

echo "rust installed"

exit
