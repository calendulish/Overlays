# Fernando Manfredi <blackice@craft.net.br> 2015
# Distributed under the terms of the GNU General Public License
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="Minimal identd server with customizable userid"
HOMEPAGE="http://acidhub.click/NullidentdMod/"
EGIT_REPO_URI="https://github.com/Acidhub/nullidentdmod"

REQUIRED_USE="systemd"
IUSE="$REQUIRED_USE"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""

DEPEND="dev-vcs/git"
RDEPEND="systemd? ( sys-apps/systemd )"

src_compile() {
    emake
}

src_install() {
    emake DESTDIR="${D}" PREFIX=/usr install
}
