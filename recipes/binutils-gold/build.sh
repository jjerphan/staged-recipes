#!/bin/bash

set -euxo pipefail

# Configure binutils with gold linker enabled
./configure \
    --prefix="${PREFIX}" \
    --enable-gold \
    --enable-ld=default \
    --enable-shared \
    --disable-werror \
    --with-system-zlib \
    --enable-64-bit-bfd \
    --disable-nls

# Build only the gold linker
make -j${CPU_COUNT} all-gold

# Install the gold linker
make install-gold

# Create a symlink for ld.gold if it doesn't exist
if [ ! -f "${PREFIX}/bin/ld.gold" ]; then
    ln -sf "${PREFIX}/bin/gold" "${PREFIX}/bin/ld.gold"
fi