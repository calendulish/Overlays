# Lara Maia <dev@lara.click> 2016
# Distributed under the terms of the GNU General Public License v2

EAPI=6
inherit systemd

DESCRIPTION="start x11 without display manager with systemd"
HOMEPAGE="http://lara.click"
LICENSE="WTFPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
RESTRICT="mirror"
REQUIRED_USE="systemd"
IUSE="fish $REQUIRED_USE"

RDEPEND="virtual/shadow
		x11-apps/xinit
		fish? ( app-shells/fish )"

S="$FILESDIR"

src_install() {
	dobin login_x11_wrapper
	insinto /etc/profile.d
	doins start_x11.sh

	if use fish; then
		insinto /etc/fish/conf.d
		doins start_x11.fish
	fi

	systemd_newunit startx.service 'startx@.service'
}

pkg_postinst() {
	elog "For use it add your session commands into ~/.xinitrc"
	elog "And enable the startx@.service for your user"
	elog "E.g: systemctl enable startx@myuser.service"
}
