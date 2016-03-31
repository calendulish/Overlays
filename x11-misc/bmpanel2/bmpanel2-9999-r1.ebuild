# Lara Maia <dev@lara.click> 2014~2016
# Distributed under the terms of the GNU General Public License v2
# $Id$

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )
inherit git-r3 cmake-utils python-r1

DESCRIPTION="NETWM compliant panel for X"
HOMEPAGE="http://code.google.com/p/bmpanel2/"
LICENSE="MIT"

EGIT_REPO_URI="git://github.com/nsf/bmpanel2.git"

SLOT=0
KEYWORDS=""
IUSE="python doc"

DEPEND="doc? ( app-text/docbook-xsl-stylesheets app-text/asciidoc )
		dev-util/cmake
		dev-vcs/git"

RDEPEND="python? ( ${PYTHON_DEPS} dev-python/pygtk[${PYTHON_USEDEP}] )
		 x11-libs/libXext
		 x11-libs/pango
		 media-fonts/dejavu"

DOCS=( INSTALL COPYING )
CMAKE_IN_SOURCE_BUILD="1"

src_configure() {
	configuration() {
		local mycmakeargs=( -DPYTHON_EXECUTABLE="${PYTHON}"
							-DPYTHON_SITE_PACKAGES="$(python_get_sitedir)"
							-DPYTHON_SUFFIX="-${EPYTHON}"
							$(cmake-utils_use_use python CONFIG)
							$(cmake-utils_use_use doc MANPAGE) )

		cmake-utils_src_configure
	}
	python_foreach_impl configuration
}

src_compile() {
	python_foreach_impl cmake-utils_src_make
}

src_test() {
	python_foreach_impl cmake-utils_src_test
}

src_install() {
	python_foreach_impl cmake-utils_src_install
}
