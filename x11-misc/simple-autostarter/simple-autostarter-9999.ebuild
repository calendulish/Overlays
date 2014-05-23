# Copyright 2014 Lara Maia <lara@craft.net.br>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="Autostarter your programs with the session"
HOMEPAGE="https://github.com/LaraCraft304/Simple-autostarter"
LICENSE="GPL-3"

EGIT_REPO_URI="https://github.com/LaraCraft304/Simple-autostarter"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

SLOT=0

src_install() {
    ./install.sh "$D"
}
