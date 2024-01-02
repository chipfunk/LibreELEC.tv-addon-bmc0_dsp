# SPDX-License-Identifier: GPL-2.0-only
# Copyright (C) 2021-present Team LibreELEC (https://libreelec.tv)

PKG_NAME="dsp"
PKG_VERSION="1.9"
PKG_REV="100"
PKG_ARCH="any"
PKG_LICENSE="Proprietary"
PKG_SITE="https://github.com/bmc0/dsp"
PKG_URL="https://github.com/bmc0/dsp/archive/refs/tags/v${PKG_VERSION}.tar.gz"
PKG_MAINTAINER="chipfunk" # Full name or forum/GitHub nickname, if you want to be identified as the addon maintainer
# PKG_SOURCE_DIR="${PKG_NAME}-${PKG_VERSION}"
PKG_DEPENDS_TARGET="alsa-lib fftw3 fftw3f pulseaudio libsndfile"
PKG_SECTION="service/system"
PKG_SHORTDESC="bmc0 DSP"
PKG_LONGDESC="bmc0 DSP in one or more dimensions."
PKG_TOOLCHAIN="configure" # or one of auto, meson, cmake, cmake-make, configure, make, ninja, autotools, manual

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="bmc0 - DSP"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_REQUIRES="service.system.fftw3:11.0.0.100 service.system.fftw3f:11.0.0.100"

configure_target() {
  cd ${PKG_BUILD}
  ./configure --disable-ffmpeg --disable-zita-convolver --disable-ao --disable-mad
}

make_target() {
  cd ${PKG_BUILD}
  make -f GNUmakefile
}

addon() {
  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/usr/bin
  cp ${PKG_BUILD}/dsp ${ADDON_BUILD}/${PKG_ADDON_ID}/usr/bin

  mkdir -p ${ADDON_BUILD}/${PKG_ADDON_ID}/usr/share/dsp
  cp ${PKG_DIR}/pulseaudio.sh ${ADDON_BUILD}/${PKG_ADDON_ID}/usr/share/dsp
}
