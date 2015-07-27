# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
PYTHON_COMPAT=( python3_3 )
inherit git-r3 python-single-r1

DESCRIPTION="Openbox menu generator"
HOMEPAGE="https://github.com/woho/openbox-menu"
LICENSE="GPL-3"

KEYWORDS=""
SLOT="0"

EGIT_REPO_URI="https://github.com/woho/openbox-menu.git"

RDEPEND="x11-wm/openbox:3
		 ${PYTHON_DEPS}"
REQUIRED_USE="${PYTHON_REQUIRED_USE}"

src_install() {
	insinto /usr/share/$PN
	doins menuconfig.py obmenu.py

	exeinto /usr/bin
	doexe "$FILESDIR"/openbox-menu

	dosym /usr/share/$PN/menuconfig.py /etc/openbox-menu.conf
}
