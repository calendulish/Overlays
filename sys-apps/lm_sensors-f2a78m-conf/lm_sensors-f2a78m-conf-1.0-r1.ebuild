# Maintainer: Lara Maia <dev@lara.click>

EAPI=5

DESCRIPTION="libsensors3 configuration file for the GIGABYTE GA-F2a78M-D3H"
HOMEPAGE="http://lara.click"
LICENSE="GPL-3"

SRC_URI="http://lara.click/f2a78m.conf"

KEYWORDS="~amd64 ~ia64 ~x86 ~arm"
IUSE="systemd"
SLOT=0

RDEPENDS=lm_sensors

S="$DISTDIR"

src_install() {
    insinto /etc/conf.d/
    doins "$FILESDIR"/lm_sensors

    insinto /etc/modules-load.d/
    newins "$FILESDIR"/load f2a78m_sensors.conf

    insinto /etc/modprobe.d/
    newins "$FILESDIR"/modprobe f2a78m_sensors.conf

    insinto /etc/sensors.d/
    doins f2a78m.conf
}

pkg_postinst() {
    modprobe it87
    if use systemd; then
        systemctl enable lm_sensors.service
        systemctl restart lm_sensors.service
    else
        rc-update add lm_sensors default
        /etc/init.d/lm_sensors restart
    fi
}
