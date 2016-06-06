# Lara Maia <dev@lara.click> 2014~2016
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="6"
PYTHON_COMPAT=( python{3_3,3_4,3_5} )
PYTHON_REQ_USE="xml(+),ssl(+)"
DISTUTILS_SINGLE_IMPL=1
inherit distutils-r1

SRC_URI="https://github.com/ShyPixie/$PN/archive/v${PV/_/-}.tar.gz"
LICENSE="GPL-3"
DESCRIPTION="Some useful tools for use with steam client or compatible programs, websites"
HOMEPAGE="https://github.com/ShyPixie/steam-tools"

SLOT=0
KEYWORDS="~amd64 ~x86"

DEPEND="${PYTHON_DEPS}
		dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${PYTHON_DEPS}
		 dev-python/beautifulsoup:4[${PYTHON_USEDEP}]
		 dev-python/requests[${PYTHON_USEDEP}]
		 dev-python/pycrypto[${PYTHON_USEDEP}]"

S="$WORKDIR"/$PN-${PV/_/-}

src_prepare() {
	distutils-r1_src_prepare
	sed "s|/usr/local|/usr|" -i setup.cfg
}
