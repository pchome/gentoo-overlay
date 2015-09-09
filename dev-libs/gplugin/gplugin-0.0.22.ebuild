# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit cmake-utils

DESCRIPTION="GPlugin is a GObject based library that implements a reusable plugin system that supports loading plugins in other languages via loaders."
HOMEPAGE="https://bitbucket.org/gplugin/main/src"
SRC_URI="https://bitbucket.org/gplugin/main/downloads/gplugin-0.0.22.tar.bz2"
LICENSE="LGPL2"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	dev-lua/lgi
"

src_prepare() {
	sed -i -e "s,PYTHON3 REQUIRED python3,PYTHON3 REQUIRED python-3.4," \
	python/CMakeLists.txt
}

#src_install() {
#	insinto /usr/bin
#	doins -r build/trans
#
#	fperms 0755 /usr/bin/trans
#}
