#!/bin/bash
# Reorder Arch mirrors with best times first
# https://forum.archlinux-br.org/viewtopic.php?id=5148
set -e

if ! $(which wget &>/dev/null); then
    echo "'wget' not found but required for downloading mirrorlist"
    echo "Please make sure 'wget' package is installed"
    echo ""
    exit 1
fi

if ! $(which rankmirrors &>/dev/null); then
    echo "'rankmirrors' not found but required for ranking the mirrorlist"
    echo "Please make sure 'pacman-contrib' package is installed"
    echo ""
    exit 1
fi


arqtmp=$(mktemp)
ranked=$(mktemp)

wget -q https://www.archlinux.org/mirrorlist/?country=BR -O $arqtmp

sed -i 's/^#Server/Server/' $arqtmp

pacman-mirrors --verbose $arqtmp | tee $ranked

# if sudo is available, update mirrorlist;
# otherwise, don't update and tell the user.
if $(which sudo &>/dev/null); then

    sudo install -Dm644 -oroot -groot $ranked /etc/pacman.d/mirrorlist
    echo ""
    echo "Successfully updated /etc/pacman.d/mirrorlist"
    echo ""

else

    echo ""
    echo "info: mirrorlist NOT updated yet, because 'sudo' was not found!"
    echo "info: please move the file \"$ranked\" to /etc/pacman.d/mirrorlist"
    echo ""
 
fi
