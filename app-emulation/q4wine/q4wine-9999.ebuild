# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/app-emulation/q4wine/q4wine-1.1_p2-r1.ebuild,v 1.1 2013/12/28 00:07:53 pesa Exp $

EAPI=5

PLOCALES="af_ZA cs_CZ de_DE en_US es_ES fa_IR he_IL it_IT pl_PL pt_BR ru_RU uk_UA"
PLOCALE_BACKUP="en_US"

inherit cmake-utils git-r3 l10n

DESCRIPTION="Qt GUI configuration tool for Wine"
HOMEPAGE="http://q4wine.brezblock.org.ua/"
EGIT_REPO_URI="https://github.com/brezerk/q4wine.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS=""
IUSE="+dbus debug +icoutils +qt4 qt5"

REQUIRED_USE="^^ ( qt4 qt5 )"

DEPEND="
	qt4? ( >=dev-util/cmake-2.8.0
		dev-qt/qtcore:4
		dev-qt/qtgui:4
		dev-qt/qtsingleapplication
		dev-qt/qtsql:4[sqlite]
		dbus? ( dev-qt/qtdbus:4 ) )
	qt5? ( >=dev-util/cmake-2.8.11
		dev-qt/qtcore:5
		dev-qt/qtgui:5
		dev-qt/qtsingleapplication[qt5]
		dev-qt/linguist-tools:5
		dev-qt/qtsql:5[sqlite]
		dev-qt/qtnetwork:5
		dev-qt/qtxml:5
		dev-qt/qtwidgets:5
		dbus? ( dev-qt/qtdbus:5 ) )
"
RDEPEND="${DEPEND}
	app-admin/sudo
	app-emulation/wine
	>=sys-apps/which-2.19
	sys-fs/fuseiso
	icoutils? ( >=media-gfx/icoutils-0.26.0 )
"

DOCS=(AUTHORS ChangeLog README)

remove_from_LINGUAS() {
	sed -i -e "/SET\s*(\s*LINGUAS / s: ${1}_\w\w::" \
		src/CMakeLists.txt || die
}

src_prepare() {
	cmake-utils_src_prepare
	l10n_for_each_disabled_locale_do remove_from_LINGUAS
}

src_configure() {
	local qt5on
	use qt5 && qt5on="ON" || qt5on="OFF"
	local mycmakeargs=(
		-DQT5=${qt5on}
		-DWITH_SYSTEM_SINGLEAPP=OFF # system singleapp error for qt5
		$(cmake-utils_use debug)
		$(cmake-utils_use_with dbus)
		$(cmake-utils_use_with icoutils)
	)
	cmake-utils_src_configure
}
