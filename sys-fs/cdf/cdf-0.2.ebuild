# Lara Maia <dev@lara.click> 2015
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

DESCRIPTION="A colorized df utility"
HOMEPAGE="http://sourceforge.net/projects/bmp-plugins.berlios/"
LICENSE="GPL-2"

SRC_URI="http://downloads.sourceforge.net/project/bmp-plugins.berlios/$PN-$PV.tar.gz"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

SLOT=0

RDEPEND="sys-libs/glibc"

src_configure() {
	./configure --prefix=/usr
}

src_compile() {
	make
}

src_install() {
	make DESTDIR="$D" install
}
