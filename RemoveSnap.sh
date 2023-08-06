#!/usr/bin/sh

sudo systemctl disable snapd.service
sudo systemctl disable snapd.socket
sudo systemctl disable snapd.seeded.service

# Check to see what you need to remove with `snap list`
sudo snap remove --purge firefox
sudo snap remove --purge snap-store
sudo snap remove --purge snapd-desktop-integration
sudo snap remove --purge gtk-common-themes
sudo snap remove --purge gnome-3-38-2004
sudo snap remove --purge core20
sudo snap remove --purge bare
sudo snap remove --purge snapd

sudo rm -rf /var/cache/snapd/
sudo apt autoremove --purge snapd
rm -rf ~/snap

# This stops `snapd` from auto installing
sudo apt-mark hold snapd

sudo add-apt-repository ppa:mozillateam/ppa
sudo apt update
sudo apt install firefox -y
