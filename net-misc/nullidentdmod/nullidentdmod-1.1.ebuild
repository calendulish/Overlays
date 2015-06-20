# Fernando Manfredi <blackice@craft.net.br> 2015
# Distributed under the terms of the GNU General Public License
# $Header: $

EAPI=5

DESCRIPTION="Minimal identd server with customizable userid"
HOMEPAGE="http://craft.net.br/NullidentdMod/"
SRC_URI="https://github.com/BlackXT/nullidentdmod/archive/v1.1.tar.gz"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

RDEPEND="sys-apps/systemd"

src_compile() {
    emake
}

src_install() {
    emake DESTDIR="${D}" PREFIX=/usr install
}
