# Copyright 1999-2016 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5

DESCRIPTION="This script create a backup of your config files in a tree format on current folder"
HOMEPAGE="https://github.com/ShyPixie/backup-conf"
LICENSE="GPL-3"

SRC_URI="https://github.com/ShyPixie/$PN/archive/v$PV.tar.gz"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

SLOT=0
IUSE="git"

RDEPEND="app-misc/colordiff
		 sys-devel/gettext
		 app-admin/sudo
		 sys-apps/util-linux
		 git? ( dev-vcs/git )"
DEPEND="app-arch/tar"

pkg_postinst() {
	ewarn "Example of configuration file installed on"
	ewarn "/usr/share/backup-conf/backup-conf.conf.example"
	ewarn 'copy to $XDG_CONFIG_HOME/backup-conf.conf or'
	ewarn "/etc/backup-conf.conf, and edit with you files/directories."
}
