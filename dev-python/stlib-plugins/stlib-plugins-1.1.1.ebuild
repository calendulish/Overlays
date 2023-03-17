# Lara Maia <dev@lara.monster> 2021
# Distributed under the terms of the GNU General Public License v2

EAPI="8"
DISTUTILS_USE_PEP517=setuptools
PYTHON_COMPAT=( python3_{9..11} )
inherit python-r1 distutils-r1

SRC_URI="https://github.com/calendulish/$PN/archive/v$PV.tar.gz -> $P.gh.tar.gz"
LICENSE="GPL-3"
DESCRIPTION="A set of stlib official plugins"
HOMEPAGE="https://github.com/calendulish/stlib-plugins"

SLOT=0
KEYWORDS="~amd64 ~x86 ~ia64 ~arm"
RESTRICT="primaryuri"

DEPEND="${PYTHON_DEPS}"
RDEPEND="${PYTHON_DEPS}
         dev-python/stlib[${PYTHON_USEDEP}]"
