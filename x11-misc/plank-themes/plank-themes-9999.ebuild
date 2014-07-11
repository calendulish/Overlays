# Copyright 2014 Lara Maia <lara@craft.net.br>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit git-r3

DESCRIPTION="Small program that allow you to change Plank Dock themes"
HOMEPAGE="https://github.com/rhoconlinux/plank-themer/tree/master/themes-repo/Themes"
LICENSE="custom"

EGIT_REPO_URI="https://github.com/rhoconlinux/plank-themer"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

SLOT=0

S="$WORKDIR"/$P/themes-repo/Themes

DEPEND="dev-vcs/git"
RDEPEND="pantheon-base/plank"

src_prepare() {
    # Pantheon already exists in x11-themes/plank-theme-pantheon on elementary overlay.
    rm -rf Pantheon || exit 1
}

src_install() {
    insinto /usr/share/plank/themes
    doins -r *
}
