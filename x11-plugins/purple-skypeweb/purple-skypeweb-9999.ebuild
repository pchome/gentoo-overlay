# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils git-2
DESCRIPTION="SkypeWeb Plugin for Pidgin"
HOMEPAGE="https://github.com/EionRobb/skype4pidgin/tree/master/skypeweb"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE="pchome-fork"

use pchome-fork && REPO_OWNER="pchome" || REPO_OWNER="EionRobb"

EGIT_REPO_URI="https://github.com/${REPO_OWNER}/skype4pidgin.git"

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/json-glib
"
src_prepare() {
	S="${S}/skypeweb/"
	#sed -e "s/ purple/ purple-3/mg" -i ${S}/Makefile || die
	#sed -e "s/json-glib-1.0 purple-3/json-glib-1.0 purple-3 gplugin/mg" -i ${S}/Makefile || die
}
