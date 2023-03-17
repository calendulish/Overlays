# Lara Maia <dev@lara.monster> 2021
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )
inherit python-r1 distutils-r1

SRC_URI="https://github.com/calendulish/$PN/archive/v$PV.tar.gz -> $P.gh.tar.gz"
LICENSE="GPL-3"
DESCRIPTION="Async library that provides features related to Steam client and compatible stuff"
HOMEPAGE="https://github.com/calendulish/stlib"

SLOT=0
KEYWORDS="~amd64 ~x86 ~ia64 ~arm"
RESTRICT="primaryuri
          strip
          !test? ( test )"
IUSE="steamworks-sdk debug test"
REQUIRED_USE="test? ( debug )"

RDEPEND="${PYTHON_DEPS}
         dev-python/beautifulsoup4[${PYTHON_USEDEP}]
         dev-python/rsa[${PYTHON_USEDEP}]
         dev-python/aiohttp[${PYTHON_USEDEP}]
         steamworks-sdk? ( dev-util/steamworks-sdk )"
DEPEND="${PYTHON_DEPS}
        test? ( ${RDEPEND} )"

distutils_enable_tests pytest

python_compile() {
    use steamworks-sdk && export SDK_PATH=/opt/steamworks-sdk
	distutils-r1_python_compile
}
