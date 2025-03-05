{% include 'base.Dockerfile' %}
RUN yum groupinstall "Development Tools"  -y 
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
RUN yum install -y \
      autoconf \
      automake \
      bison \
      gawk \
      gcc \
      gcc-multilib \
      libtool \
      make \
      tar \
      texinfo \
      xz \
      unzip
RUN yum install -y clang libcxx-devel
