# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI="5"
ETYPE="sources"
inherit kernel-2

detect_version
detect_arch

LIQUORIX_PATCH="${PV}-1.patch.gz"
LIQUORIX_URI="http://liquorix.net/sources/${LIQUORIX_PATCH}"
SRC_URI="${KERNEL_URI} ${LIQUORIX_URI}"

DESCRIPTION="The Liquorix Kernel Sources v4.x"
HOMEPAGE="http://liquorix.net/"
K_EXTRAEINFO="For more info on liquorix-sources and details on how to report problems, see: ${HOMEPAGE}."
KEYWORDS="~alpha ~amd64 ~arm ~hppa ~ia64 ~ppc ~ppc64 ~s390 ~sh ~sparc ~x86"

UNIPATCH_LIST="${DISTDIR}/${LIQUORIX_PATCH}"
UNIPATCH_EXCLUDE="patch-${PV}.patch"
UNIPATCH_STRICTORDER="yes"

pkg_setup(){
	ewarn
	ewarn "${PN} is *not* supported by the Gentoo Kernel Project in any way."
	ewarn "If you need support, please contact the Liquorix developers directly."
	ewarn "Do *not* open bugs in Gentoo's bugzilla unless you have issues with"
	ewarn "the ebuilds. Thank you."
	ewarn

	kernel-2_pkg_setup
}
