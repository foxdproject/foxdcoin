#!/bin/sh

TOPDIR=${TOPDIR:-$(git rev-parse --show-toplevel)}
SRCDIR=${SRCDIR:-$TOPDIR/src}
MANDIR=${MANDIR:-$TOPDIR/doc/man}

FOXDCOIND=${FOXDCOIND:-$SRCDIR/foxdcoind}
FOXDCOINCLI=${FOXDCOINCLI:-$SRCDIR/foxdcoin-cli}
FOXDCOINTX=${FOXDCOINTX:-$SRCDIR/foxdcoin-tx}
FOXDCOINQT=${FOXDCOINQT:-$SRCDIR/qt/foxdcoin-qt}

[ ! -x $FOXDCOIND ] && echo "$FOXDCOIND not found or not executable." && exit 1

# The autodetected version git tag can screw up manpage output a little bit
FOXDVER=($($FOXDCOINCLI --version | head -n1 | awk -F'[ -]' '{ print $6, $7 }'))

# Create a footer file with copyright content.
# This gets autodetected fine for foxdcoind if --version-string is not set,
# but has different outcomes for foxdcoin-qt and foxdcoin-cli.
echo "[COPYRIGHT]" > footer.h2m
$FOXDCOIND --version | sed -n '1!p' >> footer.h2m

for cmd in $FOXDCOIND $FOXDCOINCLI $FOXDCOINTX $FOXDCOINQT; do
  cmdname="${cmd##*/}"
  help2man -N --version-string=${FOXDVER[0]} --include=footer.h2m -o ${MANDIR}/${cmdname}.1 ${cmd}
  sed -i "s/\\\-${FOXDVER[1]}//g" ${MANDIR}/${cmdname}.1
done

rm -f footer.h2m
