# Lara Maia <dev@lara.click> 2014~2016
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit autotools

DESCRIPTION="Provides CPU identification for x86 (and x86_64)"
HOMEPAGE="https://github.com/anrieff/libcpuid"
LICENSE="BSD-2"

SRC_URI="https://github.com/anrieff/$PN/archive/v$PV.tar.gz"

KEYWORDS="~amd64 ~x86"
SLOT=0
RESTRICT="primaryuri"

DEPEND="sys-devel/libtool
		sys-devel/autoconf"
RDEPEND="sys-libs/glibc"

src_prepare() {
	_elibtoolize
	eautoreconf
}
