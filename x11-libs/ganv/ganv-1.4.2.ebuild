# Copyright 1999-2012 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit waf-utils python eutils

DESCRIPTION="Ganv is an interactive Gtk widget for interactive boxes and lines or graph-like environments"
HOMEPAGE="http://drobilla.net/software/ganv/"
SRC_URI="http://download.drobilla.net/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="amd64 x86"
IUSE="debug doc"

RDEPEND="dev-libs/boost
	x11-libs/gtk+"
DEPEND="${RDEPEND}
	=dev-lang/python-2*
	virtual/pkgconfig
	doc? ( app-doc/doxygen )"

DOCS=( AUTHORS README )

pkg_setup() {
	python_set_active_version 2
}

src_configure() {
	waf-utils_src_configure \
		$(use debug && echo "--debug") \
		$(use doc && echo "--doc")
}
