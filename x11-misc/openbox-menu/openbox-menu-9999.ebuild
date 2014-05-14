# Copyright 2014 Lara Maia <lara@craft.net.br>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit git-r3

DESCRIPTION="Openbox menu generator"
HOMEPAGE="https://github.com/woho/openbox-menu"
LICENSE="GPL-3"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"
SLOT="0"

EGIT_REPO_URI="https://github.com/woho/openbox-menu.git"

RDEPEND="x11-wm/openbox >=dev-lang/python-3.3"

src_install() {
	insinto /usr/share/$PN
	doins menuconfig.py obmenu.py
	
	exeinto /usr/bin
	doexe $FILESDIR/openbox-menu
	
	dosym /usr/share/$PN/menuconfig.py /etc/openbox-menu.conf
}
