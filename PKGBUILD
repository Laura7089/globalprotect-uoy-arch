# Maintainer: Laura Demkowicz-Duffy <dev at demkowiczduffy.co.uk>
pkgname=globalprotect-uoy-bin
pkgver=6.0.1
pkgrel=6
pkgdesc="GlobalProtect VPN client Agent"
arch=('x86_64')
url="https://support.york.ac.uk/s/article/VPN-GlobalProtect-Linux-instructions"
license=('custom')
depends=('qt5-webkit' 'wmctrl')
makedepends=('dpkg')
provides=('globalprotect')
install=globalprotect.install
source=("gpui.service"
		"local://globalprotect-ui_$pkgver-6uoy0_amd64.deb")
sha256sums=('16bcc1dc1b72d72db800431c7d3f9588f4cdd5e2326c31fe8dd782ff14c895fe'
            '4a2ce927f4727426f95b982bf41bfbf16c6b90d56cdf615a2342a61850ef9ccb')

# Adapted from globalprotect-bin-6.0.1.1-6 on the AUR
package(){
	# Flatten package directory structures
	dpkg-deb -R globalprotect-ui_$pkgver-6uoy0_amd64.deb flat
	find flat -type f -not -path "*DEBIAN*" -exec cp -v {} . \;

	# Adapted for Arch Linux from package tarball's install.sh
	GPDIR="$pkgdir/opt/paloaltonetworks/globalprotect"
	mkdir -m 755 -p $GPDIR
	# skipping install logging for packaging purposes
	cp -f globalprotect PanGPA PanGPS PanGpHip PanGpHipMp $GPDIR/
	cp -df *.so* $GPDIR/
	# TODO: Test/fixup gpshow.sh gp_support.sh, as needed
	cp -f license.cfg gpd gpd.service gpa.service pre_exec_gps.sh gpshow.sh gp_support.sh globalprotect.1.gz \
		PanGPUI.desktop PanGPUI globalprotect.png gp.desktop $GPDIR/
	# TODO: post-install script to run update-desktop-database so the desktop files are known w/out reboot?
	install -Dm644 $GPDIR/PanGPUI.desktop "$pkgdir/usr/share/applications/PanGPUI.desktop"
	install -Dm755 $GPDIR/PanGPUI "$pkgdir/PanGPUI"
	install -Dm644 $GPDIR/globalprotect.png "$pkgdir/usr/share/icons/hicolor/48x48/apps/globalprotect.png"
	install -Dm644 $GPDIR/gp.desktop "$pkgdir/usr/share/applications/gp.desktop"
	install -Dm644 $GPDIR/globalprotect.1.gz "$pkgdir/usr/share/man/man1/globalprotect.1.gz"
	install -Dm755 $GPDIR/globalprotect "$pkgdir/usr/bin/globalprotect"
	install -Dm644 $GPDIR/gpd.service "$pkgdir/usr/lib/systemd/user/gpd.service"
	install -Dm644 $GPDIR/gpa.service "$pkgdir/usr/lib/systemd/user/gpa.service"

	install -Dm644 gpui.service "$pkgdir/usr/lib/systemd/user/gpui.service"
}
