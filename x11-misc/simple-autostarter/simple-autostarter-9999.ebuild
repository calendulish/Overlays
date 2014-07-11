# Copyright 2014 Lara Maia <lara@craft.net.br>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3 distutils

DESCRIPTION="Autostarter your programs with the session"
HOMEPAGE="https://github.com/LaraCraft304/Simple-autostarter"
LICENSE="GPL-3"

EGIT_REPO_URI="https://github.com/LaraCraft304/Simple-autostarter"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

SLOT=0

DEPEND="dev-vcs/git"
RDEPEND="=dev-lang/python-3*
         =dev-python/pygobject-3*"

src_compille() {
    distutils_src_compile
}

src_install() {
    distutils_src_install
}
