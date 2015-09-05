# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
inherit cmake-utils

DESCRIPTION="A Free software that gathers information on CPU, motherboard and more (like CPU-Z)"
HOMEPAGE="https://github.com/X0rg/CPU-X"
LICENSE="GPL-3"

SRC_URI="https://github.com/X0rg/CPU-X/archive/v$PV.tar.gz"

KEYWORDS="~amd64 ~x86"
SLOT=0

DEPEND="dev-util/cmake"
RDEPEND="x11-libs/gtk+:3
		  sys-libs/ncurses
		  sys-apps/pciutils
		  sys-process/procps
		  sys-libs/libcpuid"

S="$WORKDIR/CPU-X-$PV"

QA_PRESTRIPPED="/usr/bin/cpu-x"

src_configure() {
	configuration() {
		local mycmakeargs=( -DCMAKE_BUILD_TYPE=Release
							-DCMAKE_INSTALL_PREFIX=/usr )

		cmake-utils_src_configure
	}
	configuration
}

src_compile() {
	cmake-utils_src_make
}

src_install() {
	cmake-utils_src_install
}
