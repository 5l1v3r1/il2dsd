IL-2 DS Daemon
============

Convert your IL-2 FB dedicated server into Unix daemon.

Installation
------------

To run this software you will need to have [Wine](http://www.winehq.org/)
installed in your system. If you need to use server's DeviceLink interface,
then it's mandatory to use Wine>=1.6 and it's recommended to use Wine>=1.7 in
general.

There are two installation ways described below (and uninstallation too): one
for Debian-like systems and one for manual installation. **DO NOT** mix them!

### For Ubuntu/Debian-like

    # Add PPA for Wine
    sudo add-apt-repository ppa:ubuntu-wine/ppa

    # Add PPA for IL-2 DS Daemon packages
    sudo apt-add-repository "deb http://ppa.launchpad.net/il2horus/main/ubuntu precise main"

    # Update packages list
    sudo apt-get update

    # Install Wine
    sudo apt-get install wine1.7

    # Install IL-2 DS Daemon
    sudo apt-get install il2ds-daemon

### Manual way

While installing manually, you will still need to install next packages
somehow:

1. python
2. python-pip
3. wget
4. wine

And then run:

    sudo bash install.sh

### Uninstall

To uninstall run from Debian-like systems, run as usual:

    sudo apt-get remove il2ds-daemon

If you have installed things manaully, then:

    # Uninstall daemon
    sudo bash uninstall.sh

    # If you do not need 'wine-deamonizer' Python package:
    sudo pip uninstall -r requirements.pip

Configuration
-------------

You need to specify path to `il2server.exe` to tell the daemon, where your
IL-2 DS is located. It is done by editing `/etc/il2dsd.conf` file:

    sudo vim /etc/il2dsd.conf

This file is written in INI-format and has contents similar to this:

    [Locations]
    exe_path=/path/to/your/il2ds/il2server.exe

View `templates/il2dsd.conf` for more details.

Getting dedicated server
------------------------

As you may know, IL-2 DS is about 3.2 GB, so it's unreasonably to put it into
some repository. Moreover it will be illegal. So, you need to get server
somewhere and set path to in in config file, as it was mentioned just above. If
do not have a local copy of DS, don't go to sorrow - we will help you!

We are keeping track of official patches which are free to distribute and we
store all of their repacked copies at Google Drive. Repack means that
originally a patch is an self-extracting archive (exe), but they are
inconvenient to use on any UNIX (and other normal OS). So we extracted
exe-archives and packed them as zip-archives to make everyone happy.

To obtain dedicated server you can use `il2ds-installer` tool which distributes
with alone with server daemon. So, to get server v4.09 in '/opt/games/il2/ds'
and to download patches to '/tmp', run:

    il2ds-installer -d /tmp -o /opt/games/il2/ds -v 409

To list all available patches, run:

    il2ds-installer -a

If you run `il2ds-installer` with no parameters, it will bring you the latest
version of server into './il2ds' directory, storing patches in it's 'patches'
subdirectory. To get more info, run:

    il2ds-installer -h

or look man page

    man 8 il2ds-installer

Usage
-----

The purpose of server daemon is to run `il2server.exe` under Wine as usual UNIX
service. So, nothing special, just making your life easier.

To get daemon's status:

    sudo service il2dsd status
    # Daemon is not running.

To start daemon:

    sudo service il2dsd start

To stop daemon:

    sudo service il2dsd stop

To restart daemon:

    sudo service il2dsd restart
