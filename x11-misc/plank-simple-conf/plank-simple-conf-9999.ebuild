# Copyright 2014 Lara Maia <lara@craft.net.br>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="Simple configurator for Plank-dock."
HOMEPAGE="https://github.com/VitalD/PlankSimpleConf"
LICENSE="open-source"

EGIT_REPO_URI="https://github.com/VitalD/PlankSimpleConf"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

SLOT=0

DEPEND="dev-lang/vala
        x11-libs/bamf
        x11-libs/gtk+:3
        dev-vcs/git"

RDEPEND="$DEPEND
         pantheon-base/plank"

src_compile() {
    local valac=$(find /usr/bin/valac-*)
    $valac --pkg gtk+-3.0 --pkg plank PlankSimpleConfigurator.vala || exit 1
}

src_install() {
    exeinto /usr/bin
    newexe PlankSimpleConfigurator plank-simple-configurator
}
