# binutils-gold Recipe

This conda recipe builds the GNU gold linker from the binutils source code.

## About Gold Linker

Gold is a fast ELF-only linker that was intended to be a drop-in replacement for the traditional GNU linker (`ld`). It was designed to be faster and more efficient, particularly for large programs.

## ⚠️ Deprecation Warning

**IMPORTANT**: The gold linker is deprecated upstream and is being removed from future versions of binutils. Starting with binutils 2.44, gold is only available in the `binutils-with-gold` tarballs. This package is provided for compatibility with existing software that requires the gold linker.

## What this recipe provides

- `ld.gold` - The gold linker executable
- `gold` - Alternative name for the gold linker

## Build Requirements

- C and C++ compilers
- make
- flex and bison (for parsing)
- zlib (for compression support)

## Usage

After installation, you can use the gold linker by:

```bash
# Check if gold is available
ld.gold --version

# Use gold for linking (example)
gcc -fuse-ld=gold -o myprogram myprogram.c
```

## Platform Support

This recipe only builds on Unix-like systems (Linux, macOS). Windows is not supported as indicated by the `skip: true  # [win]` directive in the meta.yaml.

## Source

The recipe builds from the official GNU binutils source tarball that includes gold:
- Source: `binutils-with-gold-2.44.tar.xz` from https://ftp.gnu.org/gnu/binutils/
- License: GPL-3.0-or-later