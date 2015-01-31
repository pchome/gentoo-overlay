# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/media-sound/patchage/patchage-0.5.0-r1.ebuild,v 1.2 2014/01/30 00:53:16 radhermit Exp $

EAPI=5
PYTHON_COMPAT=( python{2_6,2_7} )

inherit eutils waf-utils python-any-r1

DESCRIPTION="Modular patch bay for audio and MIDI systems"
HOMEPAGE="http://wiki.drobilla.net/Patchage"
SRC_URI="http://download.drobilla.net/${P}.tar.bz2"

LICENSE="GPL-2"
SLOT="0"
KEYWORDS="~amd64 ~x86"
IUSE="alsa debug"

#RDEPEND=">=media-libs/raul-0.7.0
#	>=x11-libs/flowcanvas-0.7.1
#	>=dev-cpp/gtkmm-2.11.12:2.4
#	>=dev-cpp/glibmm-2.14:2
#	>=dev-cpp/libglademm-2.6.0:2.4
#	dev-cpp/libgnomecanvasmm:2.6
#	>=media-sound/jack-audio-connection-kit-0.107
#	alsa? ( media-libs/alsa-lib )
#	lash? ( dev-libs/dbus-glib )"
RDEPEND=">=media-sound/jack-audio-connection-kit-0.107
		 x11-libs/ganv
		 alsa? ( media-libs/alsa-lib )"

DEPEND="${RDEPEND}
	${PYTHON_DEPS}
	dev-libs/boost
	virtual/pkgconfig"

DOCS=( AUTHORS README )

src_prepare() {
	epatch "${FILESDIR}"/${P}-desktop.patch
}

src_configure() {
	waf-utils_src_configure \
		$(use debug && echo "--debug") \
		$(use alsa || echo "--no-alsa")
}