# Lara Maia <lara@craft.net.br> 2015
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"
inherit eutils

DESCRIPTION="Electronic Design Automation"

SRC_URI="${SRC_URI}
         amd64? ( http://fritzing.org/download/${PV/_beta/b}/linux-64bit/${PN%-*}-${PV/_beta/b}.linux.AMD64.tar.bz2 )
         x64? ( http://fritzing.org/download/${PV/_beta/b}/linux-32bit/${PN%-*}-${PV/_beta/b}.linux.i386.tar.bz2 )"

HOMEPAGE="http://www.fritzing.org"

KEYWORDS="~amd64 ~x86"
SLOT="0"
LICENSE="CC-BY-SA-3.0 GPL-2 GPL-3"
IUSE="amd64 x64"

if use amd64; then
    LARCH=AMD64
else
    LARCH=I386
fi

S="${WORKDIR}"/${PN/-bin/}-${PV/_beta/b}.linux.${LARCH}

QA_PREBUILT="/opt/${PN}/lib/libQt5Sql.so.5
             /opt/${PN}/lib/libQt5Concurrent.so.5
             /opt/${PN}/lib/libQt5Gui.so.5
             /opt/${PN}/lib/libQt5DBus.so.5
             /opt/${PN}/lib/libQt5Xml.so.5
             /opt/${PN}/lib/libQt5PrintSupport.so.5
             /opt/${PN}/lib/libQt5XmlPatterns.so.5
             /opt/${PN}/lib/libQt5Core.so.5
             /opt/${PN}/lib/libQt5SerialPort.so.5
             /opt/${PN}/lib/libQt5Network.so.5
             /opt/${PN}/lib/platforms/libqxcb.so
             /opt/${PN}/lib/libQt5Widgets.so.5
             /opt/${PN}/lib/libQt5Svg.so.5
             /opt/${PN}/lib/sqldrivers/libqsqlite.so
             /opt/${PN}/lib/imageformats/libqjpeg.so"

src_install() {
	doicon "$FILESDIR"/$PN.png
	domenu "$FILESDIR"/$PN.desktop

    dodir /opt/fritzing
    mv "${S}" "${D}"/opt/${PN} || die

    dodir /usr/bin/
    dosym /opt/${PN}/Fritzing /usr/bin/${PN}

    # revdep-rebuild entry
    insinto /etc/revdep-rebuild
    echo "SEARCH_DIRS_MASK=/opt/${PN}" >> ${T}/10${PN}
    doins "${T}"/10${PN} || die
}
