# Lara Maia <lara@craft.net.br> 2015
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Gvim wrapper for autodetect permissions/root"
HOMEPAGE="http://lara.craft.net.br"
LICENSE="GPL-3"

SRC_URI="http://web.craft.net.br/downloads/gvim-checkpath.sh"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

SLOT=0

RDEPEND="app-admin/sudo
         app-editors/gvim
        "

S="$DISTDIR"

src_install() {
    exeinto /usr/bin
    newexe gvim-checkpath.sh gvim_checkpath
}