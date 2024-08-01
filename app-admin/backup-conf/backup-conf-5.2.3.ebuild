# Lara Maia <dev@lara.click> 2014~2016
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="Create a backup of your config files in tree format"
HOMEPAGE="https://github.com/calendulish/backup-conf"
LICENSE="GPL-3"

SRC_URI="https://github.com/calendulish/$PN/archive/v$PV.tar.gz"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

SLOT=0
IUSE="git sudo"
RESTRICT="binchecks primaryuri"

RDEPEND="sys-devel/gettext
		 sys-apps/util-linux
		 git? ( dev-vcs/git )
		 sudo? ( app-admin/sudo )"
DEPEND="app-arch/tar"

pkg_postinst() {
	ewarn "Example file installed on:"
	ewarn "/usr/share/backup-conf/backup-conf.conf.example"
	ewarn "Create a file with your files/directories"
	ewarn "and copy to one of the valid config paths:"
	ewarn "${XDG_CONFIG_HOME:-~/.config}/backup-conf.conf"
	ewarn "/etc/backup-conf.conf"
}
