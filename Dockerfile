FROM amclain/crosstool-ng
MAINTAINER Alex McLain <alex@alexmclain.com>

ENV TOOLCHAIN arm-unknown-linux-gnueabi

# ts4700
WORKDIR /opt
RUN curl -s ftp://ftp.embeddedarm.com/ts-socket-macrocontrollers/ts-4700-linux/sources/linux-2.6.29-4700_latest.tar.bz2 | tar -xj

# Build ARM toolchain
WORKDIR /opt/crosstool-ng
ADD config/ts4700.config .config
RUN ct-ng build CT_ALLOW_BUILD_AS_ROOT_SURE=true
ENV PATH="${PATH}:/opt/crosstool-ng/x-tools/${TOOLCHAIN}/bin"

WORKDIR /
