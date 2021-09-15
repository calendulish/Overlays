# Lara Maia <dev@lara.monster> 2021
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DESCRIPTION="The Steamworks SDK provides a range of features which are designed to help ship your application or game on Steam in an efficient manner."
HOMEPAGE="https://partner.steamgames.com/doc/sdk"
LICENSE="ValveSteamLicense"
KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

SLOT=0
RESTRICT="binchecks primaryuri"
DEPEND="app-arch/unzip"

S="${WORKDIR}"

src_install() {
    unzip ${FILESDIR}/${PN/-/_}_${PV/./}.zip || die
    mv sdk/ steamworks-sdk/ || die

    insinto /opt
    doins -r steamworks-sdk/
}
