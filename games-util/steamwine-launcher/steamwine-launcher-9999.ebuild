# Lara Maia <lara@craft.net.br> 2015
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils gnome2-utils fdo-mime

DESCRIPTION="Installer, launcher and supplementary files for Valve's Steam client"
HOMEPAGE="http://steampowered.com"

KEYWORDS="~x86 ~amd64"
LICENSE="ValveSteamLicense"

RESTRICT="bindist mirror"
SLOT="0"

RDEPEND="app-emulation/wine
         app-emulation/winetricks"

IUSE=""

S="$FILESDIR"

src_install() {
    dodoc steam_install_agreement.txt
    dobin steamwine
    domenu steamwine.desktop
    
    cd icons/
    for directory in * ; do
        newicon -s $directory $directory/steam.png steamwine.png
    done
}

pkg_preinst() {
    gnome2_icon_savelist
}

pkg_postinst() {
    fdo-mime_desktop_database_update
    gnome2_icon_cache_update

    elog "Execute /usr/bin/steamwine to download and install the actual"
    elog "client into your home folder. After installation, the script"
    elog "also starts the client from your home folder."
    elog ""

    ewarn "The steam client and the games are _not_ controlled by portage."
    ewarn "Updates are handled by the client itself."
}

pkg_postrm() {
    fdo-mime_desktop_database_update
    gnome2_icon_cache_update
}
