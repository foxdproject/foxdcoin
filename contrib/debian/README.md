
Debian
====================
This directory contains files used to package foxdcoind/foxdcoin-qt
for Debian-based Linux systems. If you compile foxdcoind/foxdcoin-qt yourself, there are some useful files here.

## foxdcoin: URI support ##


foxdcoin-qt.desktop  (Gnome / Open Desktop)
To install:

	sudo desktop-file-install foxdcoin-qt.desktop
	sudo update-desktop-database

If you build yourself, you will either need to modify the paths in
the .desktop file or copy or symlink your foxdcoin-qt binary to `/usr/bin`
and the `../../share/pixmaps/foxdcoin128.png` to `/usr/share/pixmaps`

foxdcoin-qt.protocol (KDE)

