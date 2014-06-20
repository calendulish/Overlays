# Copyright (C) 2014 Lara Maia <lara@craft.net.br>
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit gnome2 git-r3 autotools vala

DESCRIPTION="Cairo based composite manager"
HOMEPAGE="http://cairo-compmgr.tuxfamily.org"
EGIT_REPO_URI="https://github.com/gandalfn/Cairo-Composite-Manager"
SRC_URI=""

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS="~amd64 ~ia64 ~x86 ~arm"

DEPEND="=x11-libs/gtk+-2*
		>=x11-libs/cairo-1.4
        >=dev-lang/vala-0.24
		x11-libs/libSM
		gnome-base/gconf"
RDEPEND="${DEPEND}"

src_prepare() {
	sed 's/libvala-0.18/libvala-0.24/' -i configure.ac
	sed 's/libvala-0.18/libvala-0.24/' -i vapi/cairo-compmgr.deps

	epatch "$FILESDIR"/fix-compilation-errors.patch
	epatch "$FILESDIR"/bfd-ansidecl.patch

	vala_src_prepare
}

pkg_setup() {
	G2CONF="$G2CONF --enable-gconf"
}

src_configure() {
	eautoreconf
	econf --prefix=/usr LIBS="-ldl -lgmodule-2.0 -lm -lz"
}

src_compile() {
	# parallel build broken
	emake -j1
}
