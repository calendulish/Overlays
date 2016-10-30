# Lara Maia <dev@lara.click> 2014~2016
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
PYTHON_COMPAT=( python3_4 python3_5 )
inherit git-r3 python-single-r1

DESCRIPTION="Openbox menu generator"
HOMEPAGE="https://github.com/woho/openbox-menu"
EGIT_REPO_URI="https://github.com/woho/openbox-menu.git"
LICENSE="GPL-3"

KEYWORDS=""
SLOT="0"
RESTRICT="binchecks mirror"

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
