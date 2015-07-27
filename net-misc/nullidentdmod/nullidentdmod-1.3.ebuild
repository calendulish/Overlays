# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="Minimal identd server with customizable userid"
HOMEPAGE="http://acidhub.click/NullidentdMod/"
SRC_URI="https://github.com/Acidhub/nullidentdmod/archive/v${PV}.tar.gz"

REQUIRED_USE="systemd"
IUSE="$REQUIRED_USE"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86 arm"

RDEPEND="systemd? ( sys-apps/systemd )"

src_compile() {
	emake
}

src_install() {
	emake DESTDIR="${D}" PREFIX=/usr install
}
