# libusb-NetBSD-1.0.27-rc1
Heavily refactored libusb for embedded NetBSD.

More or less forked from libusb 1.0.27-RC1 but with everything not related to IA-32 NetBSD removed or commented out. All autoconf and other build support (which does not work on the host machine) was removed to facilitate building without a C11 compiler.

## How to build
Building the static library for the target platform requires a proprietary cross-compilation toolchain and custom BSD Makefile run on a host machine, along with some other proprietary tools. This is not included here.
