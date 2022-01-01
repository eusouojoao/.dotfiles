#!/bin/bash
# /* services */
sudo systemctl enable NetworkManager
sudo systemctl enable bluetooth
sudo systemctl enable cups.service
sudo systemctl enable sshd
sudo systemctl enable avahi-daemon
#sudo systemctl enable tlp
sudo systemctl enable reflector.timer
sudo systemctl enable fstrim.timer
sudo systemctl enable libvirtd
sudo systemctl enable firewalld
sudo systemctl enable acpid
sudo systemctl enable lightdm

# /* setup lightdm */
#  "/etc/lightdm/"  #
sudo sed -i "/^\[Seat\:\*\]/a user-session=i3" /etc/lightdm/lightdm.conf
sudo sed -i "/^\[Seat\:\*\]/a greeter-session=lightdm-mini-greeter" /etc/lightdm/lightdm.conf
sudo sed -i "s/CHANGE_ME/joao/g" /etc/lightdm/lightdm-mini-greeter.conf
