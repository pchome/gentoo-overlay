# Copyright 1999-2014 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5
inherit eutils git-2
DESCRIPTION="SkypeWeb Plugin for Pidgin"
HOMEPAGE="https://github.com/EionRobb/skype4pidgin/tree/master/skypeweb"
EGIT_REPO_URI="https://github.com/EionRobb/skype4pidgin.git"

LICENSE="GPL-3"
SLOT="0"
KEYWORDS="~x86 ~amd64"
IUSE=""

DEPEND=""
RDEPEND="${DEPEND}
	dev-libs/json-glib
"
src_prepare() {
	S="${S}/skypeweb/"
}
