#!/bin/sh

gsettings set org.gnome.settings-daemon.plugins.media-keys custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybinding/custom0/ name "Launch Terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybinding/custom0/ command "gnome-terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybinding/custom0/ binding "<Primary><Alt>t"
echo "Added Launch Terminal keyboard shortcut (Ctrl+Alt+T)"

echo "deb http://http.kali.org/kali kali main contrib non-free" >> /etc/apt/sources.list
echo "deb http://security.kali.org/kali-security kali/updates main contrib non-free" >> /etc/apt/sources.list
echo "Added necessary Kali repositories"

python -c 'proxy = raw_input(""); oF = open("/etc/apt/apt.conf", "a"); out = "Acquire::http::Proxy \"http://" + proxy + ":80\";\n" if proxy != "" else ""; oF.write(out)'

pip install requests --upgrade

apt-get update
apt-get -y upgrade

mv index.php /var/www/
mv upload.php /var/www/

sed -i 's/.*post_max_size *=.*/post_max_size = 128M/' /etc/php5/apache2/php.ini
sed -i 's/.*upload_max_filesize *=.*/upload_max_filesize = 128M/' /etc/php5/apache2/php.ini
echo "File uploads set up. Run 'service apache2 start' in the terminal and browse to http://ip_address/index.php in a browser"

mv payloads/ ~/
chattr +i ~/payloads/*


