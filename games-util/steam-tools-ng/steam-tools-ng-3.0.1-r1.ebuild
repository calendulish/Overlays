# Lara Maia <dev@lara.monster> 2021
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )
inherit python-r1 distutils-r1

LICENSE="GPL-3"
DESCRIPTION="Some useful tools for use with steam client or compatible programs, websites"
HOMEPAGE="https://github.com/calendulish/steam-tools-ng"
SRC_URI="https://github.com/calendulish/$PN/archive/v$PV.tar.gz -> $P.gh.tar.gz"

PATCHES=(
    "${FILESDIR}/${P}-fix-pygobject.patch"
)

SLOT=0
KEYWORDS="~amd64 ~x86 ~ia64 ~arm"
RESTRICT="primaryuri
          !test? ( test )"
IUSE="plugins debug test"
REQUIRED_USE="test? ( debug )"

RDEPEND="${PYTHON_DEPS}
         dev-python/certifi[${PYTHON_USEDEP}]
         dev-python/aiohttp[${PYTHON_USEDEP}]
         >=dev-python/stlib-1.1[steamworks-sdk,${PYTHON_USEDEP}]
         plugins? ( >=dev-python/stlib-plugins-1.1[${PYTHON_USEDEP}] )
         x11-misc/xdg-utils
         >=gui-libs/gtk-4.0"
DEPEND="${PYTHON_DEPS}
        sys-devel/gettext
        test? ( ${RDEPEND} )"

distutils_enable_tests pytest
