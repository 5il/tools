#!/bin/sh

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybinding/custom0/ name "Launch Terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybinding/custom0/ command "gnome-terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybinding/custom0/ binding "<Primary><Alt>t"

echo "deb http://http.kali.org/kali kali main contrib non-free" >> /etc/apt/sources.list
echo "deb http://security.kali.org/kali-security kali/updates main contrib non-free" >> /etc/apt/sources.list

python -c 'proxy = raw_input(""); out = "Acquire::http::Proxy \"http://" + proxy + ":80\";" if proxy != "" else ""; print out' > /etc/apt/apt.conf

pip install requests --upgrade

apt-get update
apt-get -y upgrade

mv index.php /var/www/
mv upload.php /var/www/

mv payloads/ ~/
chattr +i ~/payloads/*


