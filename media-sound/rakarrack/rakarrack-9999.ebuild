# Copyright 1999-2010 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI="5"

inherit base autotools git-2 flag-o-matic

#MY_P="${P}_Equinox"

DESCRIPTION="Rakarrack is a richly featured multi-effects processor emulating a uitar effects pedalboard."
HOMEPAGE="http://rakarrack.sourceforge.net/"
EGIT_REPO_URI="git://${PN}.git.sourceforge.net/gitroot/${PN}/${PN}"


LICENSE="GPL-2"
SLOT="0"
KEYWORDS=""
IUSE=""

#S="${WORKDIR}/${MY_P}"

RDEPEND="<x11-libs/fltk-2.0
	x11-libs/libXpm
	>=media-libs/alsa-lib-0.9
	media-libs/libsamplerate
	media-libs/libsndfile
	>=media-sound/alsa-utils-0.9
	>=media-sound/jack-audio-connection-kit-0.100.0"
DEPEND="${RDEPEND}"

DOCS="AUTHORS ChangeLog NEWS README TODO"

src_prepare() {
	epatch "${FILESDIR}/rakarrack-0.6.1_fltk.patch"
	"${S}/autogen.sh"
}

src_configure() {
	append-ldflags -L/usr/lib/fltk
	"${S}/configure"
}

