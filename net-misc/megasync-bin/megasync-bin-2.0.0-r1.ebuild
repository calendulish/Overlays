# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils multilib

DESCRIPTION="The official QT-Based mega.co.nz client for sync your MEGA account"
HOMEPAGE="http://mega.nz"
SRC_URI="amd64? ( https://mega.co.nz/linux/MEGAsync/Debian_8.0/amd64/${PN/-bin/}_${PV}_amd64.deb )
		   x86? ( https://mega.co.nz/linux/MEGAsync/Debian_8.0/i386/${PN/-bin/}_${PV}_i386.deb )"

LICENSE="all-rights-reserved"
SLOT="0"
KEYWORDS="~amd64 ~x86"

DEPEND="sys-devel/binutils
		app-arch/tar"
RDEPEND="dev-qt/qtdbus:4
		 dev-qt/qtgui:4
		 dev-libs/openssl
		 media-libs/libpng
		 net-dns/c-ares
		 dev-libs/crypto++"

QA_PREBUILT="/usr/bin/megasync"

S="$WORKDIR/usr"

src_unpack() {
		ar x "$DISTDIR/$A"
		tar xfv data.tar.xz
		cd "$S"
}

src_install() {
	dobin bin/megasync
	domenu share/applications/megasync.desktop
	doicon -s 16 share/icons/hicolor/16x16/apps/mega.png
	doicon -s 32 share/icons/hicolor/32x32/apps/mega.png
	doicon -s 48 share/icons/hicolor/48x48/apps/mega.png
	doicon -s 128 share/icons/hicolor/128x128/apps/mega.png
	doicon -s 256 share/icons/hicolor/256x256/apps/mega.png
}
