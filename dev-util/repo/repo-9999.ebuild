# Copyright 2014 Lara Maia <lara@craft.net.br>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3 python

DESCRIPTION="The Google repo tool"
HOMEPAGE="http://code.google.com/p/git-repo/"
EGIT_REPO_URI="https://gerrit.googlesource.com/git-repo"

LICENSE=""
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

DEPEND="dev-vcs/git
        net-misc/curl
        =dev-lang/python-2*"
RDEPEND="${DEPEND}"

src_prepare() {
    python_convert_shebangs 2 ${PN} 
}

src_install() {
    exeinto "/usr/bin"
    doexe ${PN}
}
