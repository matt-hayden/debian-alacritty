#!/bin/sh
#
# Arrange standard installation paths for UNIX-alikes.
# This will overwrite existing files!
# 
# Dependencies:
#   - gzip
#   - ncurses-bin
#   - scdoc
#
exec 1>"${0}.log"
exec 2>&1
set -eu
root="$1"
command shift
man="$root/usr/share/man"
mkdir -p "$man/man1" "$man/man5"
scdoc < extra/man/alacritty.1.scd | gzip -c > "$man/man1/alacritty.1.gz"
scdoc < extra/man/alacritty-msg.1.scd | gzip -c > "$man/man1/alacritty-msg.1.gz"
scdoc < extra/man/alacritty.5.scd | gzip -c > "$man/man5/alacritty.5.gz"
scdoc < extra/man/alacritty-bindings.5.scd | gzip -c > "$man/man5/alacritty-bindings.5.gz"

mkdir -p "$root/usr/share/terminfo"
tic -x extra/alacritty.info -o "$root/usr/share/terminfo"