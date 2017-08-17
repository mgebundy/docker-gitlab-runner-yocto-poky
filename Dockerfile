FROM ubuntu:14.04

MAINTAINER Mitchell Bundy <mitch@bundy.ca>

RUN apt update \
  && apt upgrade -y \
	&& apt install -y --no-install-recommends \
  gawk \
  wget \
  git \
  diffstat \
  unzip \
  texinfo \
  gcc-multilib \
  build-essential \
  chrpath \
  socat \
  cpio \
  python \
  python3 \
  python3-pip \
  python3-pexpect \
  xz-utils \
  debianutils \
  iputils-ping \
  libsdl1.2-dev \
  xterm \
  openssh-client \
	&& rm -rf /var/lib/apt/lists/*

# Fix error "Please use a locale setting which supports utf-8."
# See https://wiki.yoctoproject.org/wiki/TipsAndTricks/ResolvingLocaleIssues
RUN dpkg-reconfigure locales \
  && locale-gen en_US.UTF-8 \
  && update-locale LC_ALL=en_US.UTF-8 LANG=en_US.UTF-8
  && export LANG=en_US.UTF-8

RUN git clone -b pyro git://git.yoctoproject.org/poky /poky
