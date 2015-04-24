# Lara Maia <lara@craft.net.br> 2015
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="list tree for UNIX and Windows"
HOMEPAGE="http://www.yk.rim.or.jp/~unya/lstree/"
LICENSE="custom"

EGIT_REPO_URI="https://github.com/kaneshin/lstree"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

SLOT=0

DEPEND="dev-vcs/git"

src_install() {
    exeinto /usr/bin
    doexe lstree
}
