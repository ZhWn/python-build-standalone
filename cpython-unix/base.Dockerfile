FROM centos:centos6.10

RUN groupadd -g 1000 build && \
    useradd -u 1000 -g 1000 -d /build -s /bin/bash -m build && \
    mkdir /tools && \
    chown -R build:build /build /tools

ENV HOME=/build \
    SHELL=/bin/bash \
    USER=build \
    LOGNAME=build \
    HOSTNAME=builder \
    DEBIAN_FRONTEND=noninteractive

CMD ["/bin/bash", "--login"]
WORKDIR '/build'

# ADD https://mirrors.aliyun.com/repo/Centos-vault-6.10.repo /etc/yum.repos.d/CentOS-Base.repo 
RUN sed -e "s|^mirrorlist=|#mirrorlist=|g" \
    -e "s|^#baseurl=http://mirror.centos.org/centos/\$releasever|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos-vault/6.10|g" \
    -e "s|^#baseurl=http://mirror.centos.org/\$contentdir/\$releasever|baseurl=https://mirrors.tuna.tsinghua.edu.cn/centos-vault/6.10|g" \
    -i.bak \
    /etc/yum.repos.d/CentOS-*.repo


ADD http://mirrors.cloud.tencent.com/repo/epel-6.repo /etc/yum.repos.d/epel.repo 

ADD https://github.com/NixOS/patchelf/releases/download/0.18.0/patchelf-0.18.0-x86_64.tar.gz /tmp/patchelf.tar.gz
RUN tar -xavf /tmp/patchelf.tar.gz -C / && /bin/patchelf --version

RUN yum clean all && yum makecache

