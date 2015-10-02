#!/bin/bash

dconf write /org/gnome/settings-daemon/plugins/media-keys/custom-keybindings "['/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/']"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ name "Launch Terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ command "gnome-terminal"
gsettings set org.gnome.settings-daemon.plugins.media-keys.custom-keybinding:/org/gnome/settings-daemon/plugins/media-keys/custom-keybindings/custom0/ binding "<Primary><Alt>t"
echo "Added Launch Terminal keyboard shortcut (Ctrl+Alt+T)"

echo "deb http://http.kali.org/kali sana main contrib non-free" >> /etc/apt/sources.list
echo "deb-src http://http.kali.org/kali sana main contrib non-free" >> /etc/apt/sources.list
echo "Added necessary Kali 2.0 repositories"

python -c 'proxy = raw_input("Enter proxy name (blank if none): "); oF = open("/etc/apt/apt.conf", "a"); out = "Acquire::http::Proxy \"http://" + proxy + ":80\";\n" if proxy != "" else ""; oF.write(out); oF.close()'

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

gtg=0
until [ $gtg -eq 1 ]; do
 echo -n "Would you like to install Virtualbox? [y/n]: "
 read pick
 if [ $pick == "y" ]; then
  apt-get -y install virtualbox
  gtg=1
 elif [ $pick == "n" ]; then
  echo "Skipping Virtualbox install..."
  gtg=1
 else
  echo "Invalid option!"
 fi
done

gtg=0
until [ $gtg -eq 1 ]; do
 echo -n "Would you like to install MetasploitPro? [y/n]: "
 read pick
 if [ $pick == "y" ]; then
  wget http://downloads.metasploit.com/data/releases/metasploit-latest-linux-x64-installer.run
  chmod +x metasploit-latest-linux-x64-installer.run
  ./metasploit-latest-linux-x64-installer.run
  gtg=1
 elif [ $pick == "n" ]; then
  echo "Skipping MetasploitPro install..."
  gtg=1
 else
  echo "Invalid option!"
 fi
done

echo "Thanks for riding the pwn train. Have a nice day!"
