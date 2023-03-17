# Lara Maia <dev@lara.click> 2014~2016
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="This is an colored and cute version of df"
HOMEPAGE="https://github.com/calendulish/cutedf"
LICENSE="GPL-2"
SRC_URI="https://github.com/calendulish/$PN/archive/v$PV.tar.gz"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"
SLOT=0
RESTRICT="primaryuri"

src_install (){
    emake PREFIX="/usr" DESTDIR="$D" install
}
