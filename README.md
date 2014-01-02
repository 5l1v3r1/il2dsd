IL-2 DS Daemon
============

Convert your IL-2 FB dedicated server into Unix daemon.

Installation (briefly)
----------------------

To install do the following in this directory:

    # Add PPA for Wine 1.7
    sudo add-apt-repository ppa:ubuntu-wine/ppa

    # Install dependencies
    sudo apt-get install wine1.7 python2.7 python-pip

    # Install daemon
    sudo bash install.sh

    # If you do not have a local copy of IL-2 DS then you can download it
    # patch-by-patch and automatically unpack them to preferred directory
    # (run `il2ds-install -h` to get usage help):
    il2ds-install

    # Set path to `il2server.exe`
    sudo vim /etc/il2dsd.conf

To uninstall:

    # Uninstall daemon
    sudo bash uninstall.sh

    # If you do not need 'wine-deamonizer' Python package:
    sudo pip uninstall -r requirements.pip

Usage (briefly)
---------------

To get daemon's status:

    sudo service il2dsd status
    # Daemon is not running.

To start daemon:

    sudo service il2dsd start

To stop daemon:

    sudo service il2dsd stop

To restart daemon:

    sudo service il2dsd start
