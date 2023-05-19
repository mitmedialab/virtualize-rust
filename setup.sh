#!/bin/bash

if [[ ! $BASH_SOURCE ]]; then
    echo "You cannot source this script. Run it as ./$0" >&2
    exit 33
fi

VIRTUALIZE_RUST_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE}" )" &> /dev/null && pwd )

curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs > $VIRTUALIZE_RUST_DIR/bootstrap_rustup.sh
(
    cd $VIRTUALIZE_RUST_DIR
    RUSTUP_HOME=$VIRTUALIZE_RUST_DIR/rustup CARGO_HOME=$VIRTUALIZE_RUST_DIR/cargo sh ./bootstrap_rustup.sh
)    

echo "rust installed"

exit
