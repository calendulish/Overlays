# Copyright 2014 Lara Maia <lara@craft.net.br>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="Freedns update service"
HOMEPAGE="https://sourceforge.net/projects/freedns-afraid"
EGIT_REPO_URI="https://github.com/PessoalProjects/freedns-updater"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

DEPENDS="python"
RDEPENDS="$DEPENDS"

src_install(){
    exeinto /usr/bin
    newexe freedns-updater.py freedns-updater
    insinto /etc
    newins freedns.conf.example freedns.conf
}
