# Lara Maia <dev@lara.click> 2014~2016
# Distributed under the terms of the GNU General Public License v2

EAPI=5
inherit gnome2 git-r3 autotools vala

DESCRIPTION="Cairo based composite manager"
HOMEPAGE="http://cairo-compmgr.tuxfamily.org"
EGIT_REPO_URI="https://github.com/gandalfn/Cairo-Composite-Manager"
SRC_URI=""

LICENSE="LGPL-3"
SLOT="0"
KEYWORDS=""
RESTRICT="mirror"

RDEPEND="=x11-libs/gtk+-2*
		 >=x11-libs/cairo-1.4
		 x11-libs/libSM
		 gnome-base/gconf"
DEPEND="${RDEPEND}
		 $(vala_depend)
		dev-vcs/git"

QA_PRESTRIPPED="
		/usr/bin/ccm-schema-key-to-gconf
		/usr/bin/cairo-compmgr"

pkg_setup() {
	G2CONF="$G2CONF --enable-gconf"
}

src_prepare() {
	sed "s/libvala-0.18/libvala-$(vala_best_api_version)/" -i configure.ac
	sed "s/libvala-0.18/libvala-$(vala_best_api_version)/" -i vapi/cairo-compmgr.deps

	epatch "$FILESDIR"/fix-compilation-errors.patch
	epatch "$FILESDIR"/bfd-ansidecl.patch

	vala_src_prepare
	eautoreconf
}

src_configure() {
	econf --prefix=/usr LIBS="-ldl -lgmodule-2.0 -lm -lz"
}

src_compile() {
	# parallel build broken
	emake -j1
}
