# Lara Maia <lara@craft.net.br> 2015
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit eutils gnome2-utils fdo-mime git-r3

DESCRIPTION="Installer, launcher and supplementary files for Valve's Steam client"
HOMEPAGE="http://steampowered.com"

KEYWORDS="~x86 ~amd64"
LICENSE="ValveSteamLicense"

EGIT_REPO_URI="https://github.com/LaraCraft93/$PN"

RESTRICT="bindist mirror"
SLOT="0"

RDEPEND="app-emulation/wine[s3tc,samba]
         app-emulation/winetricks[rar]"
DEPEND="dev-vcs/git"

IUSE=""

src_prepare() {
    patch -Np0 -i "$FILESDIR"/fix-system-install.patch
}

src_install() {
    dodoc "$FILESDIR"/steam_install_agreement.txt
    newbin steamwine.sh steamwine
    domenu steamwine.desktop
    
    insinto /usr/share/$PN/patches/
    for patch in patches/*; do
        doins "$patch"
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
