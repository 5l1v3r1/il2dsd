#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0"
    exit 1
fi

echo "Uninstalling IL-2 DS daemon..."
rm /etc/init.d/il2dsd
rm /etc/il2dsd.conf

echo "Uninstalling IL-2 DS installer..."
rm /usr/bin/il2ds-install
rm /usr/share/man/man8/il2ds-install.8

echo "Done."
