# Lara Maia <dev@lara.click> 2014~2016
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{7,8,9,10} )
inherit python-r1 distutils-r1

SRC_URI="https://github.com/ShyPixie/$PN/archive/v$PV.tar.gz"
LICENSE="GPL-3"
DESCRIPTION="Some useful tools for use with steam client or compatible programs, websites"
HOMEPAGE="https://github.com/ShyPixie/steam-tools"

SLOT=0
KEYWORDS="~amd64 ~x86 ~ia64 ~arm"
RESTRICT="primaryuri"
IUSE="steamworks-sdk"

DEPEND="${PYTHON_DEPS}
        dev-python/setuptools[${PYTHON_USEDEP}]"
RDEPEND="${PYTHON_DEPS}
         dev-python/beautifulsoup4[${PYTHON_USEDEP}]
         dev-python/rsa[${PYTHON_USEDEP}]
         dev-python/aiohttp[${PYTHON_USEDEP}]
         steamworks-sdk? ( dev-libs/steamworks-sdk[${PYTHON_USEDEP}] )"

S="$WORKDIR"/$PN-${PV/_/-}

python_compile() {
    distutils-r1_python_compile $(usex steamworks-sdk "" "--disable-steam-api")
}
