# Lara Maia <dev@lara.monster> 2024
# Distributed under the terms of the GNU General Public License v2

EAPI=8

DISTUTILS_USE_PEP517=setuptools
PYPI_NO_NORMALIZE=true
PYTHON_COMPAT=( python3_{10..13} )

inherit distutils-r1 pypi

DESCRIPTION="Implementation of Gettext for Python"
HOMEPAGE="https://github.com/hannosch/python-gettext"
LICENSE="BSD"
SLOT="0"
KEYWORDS="~amd64 ~arm64 ~x86"
RESTRICT="!test? ( test )"
IUSE="debug test"
REQUIRED_USE="test? ( debug )"

RDEPEND="dev-python/setuptools[${PYTHON_USEDEP}]
         sys-devel/gettext"
DEPEND="test? ( ${RDEPEND} )"

distutils_enable_tests pytest
