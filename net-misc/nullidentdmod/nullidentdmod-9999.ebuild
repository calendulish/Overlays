# Fernando Manfredi <blackice@craft.net.br> 2015
# Distributed under the terms of the GNU General Public License
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="Minimal identd server with customizable userid"
HOMEPAGE="http://web.craft.net.br/NullidentdMod/"
EGIT_REPO_URI="https://github.com/BlackXT/nullidentdmod"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86 ~arm"

DEPEND="dev-vcs/git"
RDEPEND="sys-apps/systemd"

src_compile() {
    emake
}

src_install() {
    emake DESTDIR="${D}" PREFIX=/usr install
}
