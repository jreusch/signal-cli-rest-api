#!/usr/bin/env bash

set -euo pipefail
set -x

mkdir dist
pushd dist

cargo install cross --git https://github.com/cross-rs/cross

git clone --branch v${LIBSIGNAL_CLIENT_VERSION} --depth 1 https://github.com/signalapp/libsignal.git
pushd libsignal

cross build --target aarch64-unknown-linux-gnu --release -p libsignal-jni
cross build --target armv7-unknown-linux-gnueabihf --release -p libsignal-jni
cargo build --target x86_64-unknown-linux-gnu --release -p libsignal-jni
