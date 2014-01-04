#!/bin/bash

if [[ $UID != 0 ]]; then
    echo "Please run this script with sudo:"
    echo "sudo $0"
    exit 1
fi

echo "Installing Python modules..."
pip install -r requirements.pip

echo "Installing IL-2 DS daemon..."
cp ./scripts/il2dsd /etc/init.d/
chmod +x /etc/init.d/il2dsd

cp ./templates/il2dsd.conf /etc/
chmod 644 /etc/il2dsd.conf

echo "Installing IL-2 DS installer..."
cp ./scripts/il2ds-install /usr/bin/
chmod +x /usr/bin/il2ds-install

cp ./doc/man/man8/il2ds-install.8 /usr/share/man/man8/il2ds-install.8
gzip -f --best /usr/share/man/man8/il2ds-install.8

echo "Done."
