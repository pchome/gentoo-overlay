# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2

EAPI=5

inherit eutils

DESCRIPTION="Translate Shell (formerly Google Translate CLI) is a command-line translator powered by Google Translate."
HOMEPAGE="https://www.soimort.org/translate-shell/"
SRC_URI="https://github.com/soimort/translate-shell/archive/v${PV}.tar.gz -> ${P}.tar.gz"
LICENSE="Unlicense"
SLOT="0"
KEYWORDS="~amd64 ~x86"

RDEPEND="
	>=sys-apps/gawk-4.0
"
src_install() {
	insinto /usr/bin
	doins -r build/trans

	fperms 0755 /usr/bin/trans
}
