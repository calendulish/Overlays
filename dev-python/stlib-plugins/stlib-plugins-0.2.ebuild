# Lara Maia <dev@lara.monster> 2021
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{7,8,9,10} )
inherit python-r1

SRC_URI="https://github.com/ShyPixie/$PN/archive/v$PV.tar.gz"
LICENSE="GPL-3"
DESCRIPTION="A set of stlib official plugins"
HOMEPAGE="https://github.com/ShyPixie/stlib-plugins"

SLOT=0
KEYWORDS="~amd64 ~x86 ~ia64 ~arm"
RESTRICT="primaryuri"

DEPEND="${PYTHON_DEPS}
        dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${PYTHON_DEPS}
         dev-python/stlib[${PYTHON_USEDEP}]"

src_prepare() {
    default
    sed -i "s|/usr/bin/rm|/bin/rm|" Makefile || die
    sed -i "s|/usr/local|/usr|" Makefile || die
}
