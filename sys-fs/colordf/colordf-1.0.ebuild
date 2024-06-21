# Lara Maia <dev@lara.click> 2014~2016
# Distributed under the terms of the GNU General Public License v2

EAPI=8

inherit cmake

DESCRIPTION="Colored and configurable version of df"
HOMEPAGE="https://github.com/calendulish/colordf"
LICENSE="GPL-2"
SRC_URI="https://github.com/calendulish/$PN/archive/v$PV.tar.gz"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"
SLOT=0
RESTRICT="primaryuri"

BDEPENDS="sys-apps/util-linux"

src_install (){
    exeinto /usr/bin
    doexe $BUILD_DIR/colordf
}
