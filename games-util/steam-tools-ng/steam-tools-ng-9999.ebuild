# Lara Maia <dev@lara.monster> 2021
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
PYTHON_COMPAT=( python3_{7,8,9,10} )
inherit python-r1 git-r3 distutils-r1

LICENSE="GPL-3"
DESCRIPTION="Some useful tools for use with steam client or compatible programs, websites"
HOMEPAGE="https://github.com/ShyPixie/steam-tools-ng"
EGIT_REPO_URI="https://github.com/ShyPixie/steam-tools-ng.git"

SLOT=0
KEYWORDS="~amd64 ~x86 ~ia64 ~arm"
RESTRICT="primaryuri"

DEPEND="${PYTHON_DEPS}
        dev-python/setuptools[${PYTHON_USEDEP}]
        sys-devel/gettext"
RDEPEND="${PYTHON_DEPS}
         dev-python/certifi[${PYTHON_USEDEP}]
         dev-python/aiohttp[${PYTHON_USEDEP}]
         dev-python/pygobject[${PYTHON_USEDEP}]
         dev-python/stlib[steamworks-sdk,${PYTHON_USEDEP}]
         dev-python/stlib-plugins[${PYTHON_USEDEP}]
         x11-misc/xdg-utils"
