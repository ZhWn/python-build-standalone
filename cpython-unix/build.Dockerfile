{% include 'base.Dockerfile' %}

# libc6-dev:i386 pulls in 32-bit system libraries to enable cross-compiling
# to i386.
#
# libffi-dev and zlib1g-dev are present so host Python (during cross-builds)
# can build the ctypes and zlib extensions. So comment in build-cpython.sh
# for more context.
#
# Compression packages are needed to extract archives.
#
# Various other build tools are needed for various building.

RUN yum install -y \
    bzip2 \
    file \
    glibc-devel \
    glibc-devel-i386 \
    libffi-devel \
    make \
    patch \
    perl \
    pkgconfig \
    tar \
    xz \
    unzip \
    zip \
    zlib-devel
