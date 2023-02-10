GIT_CONFIG_USER_NAME='Felipe Campara'
GIT_CONFIG_USER_EMAIL='fcamparasilva@gmail.com'

sudo apt-get update

echo 'installing curl'
sudo apt install curl -y

echo 'installing git'
sudo apt install git -y

echo 'installing vim'
sudo apt install vim -y

echo "install xclip"
sudo apt install xclip -y

echo 'config git'
git config --global user.name $GIT_USER_NAME
git config --global user.email $GIT_CONFIG_USER_EMAIL
git config --global core.editor vim

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $GIT_CONFIG_USER_EMAIL
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

# Don't forget to insert shortcut "flameshot gui"
echo 'installing flameshot'
sudo apt install flameshot -y

echo 'htop'
sudo apt install htop -y

echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y

echo 'installing extensions'
code --install-extension Shan.code-settings-sync

echo 'installing chrome'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'installing nvm'
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

echo 'installing slack'
sudo snap install slack --classic

echo 'installing teams'
sudo curl https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /usr/share/keyrings/microsoft-archive-keyring.gpg
sudo sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/microsoft-archive-keyring.gpg] https://packages.microsoft.com/repos/ms-teams stable main" > /etc/apt/sources.list.d/teams.list'
sudo apt-get update
sudo apt-get install teams -y

# Don't forgot add in startup application (/usr/bin/guake)
echo 'installing guake'
sudo apt-get update
sudo apt-get install guake -y
sudo ln -s /usr/share/applications/guake.desktop /etc/xdg/autostart/

echo 'installing docker'
sudo apt-get remove docker docker-engine docker.io
sudo apt install docker.io -y
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -aG docker $USER
docker --version

chmod 777 /var/run/docker.sock
docker run hello-world

echo 'installing docker-compose'
sudo curl -L "https://github.com/docker/compose/releases/download/1.24.0/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo 'installing dbeaver'
wget -c https://dbeaver.io/files/22.2.2/dbeaver-ce_22.2.2_amd64.deb
sudo dpkg -i dbeaver-ce_22.2.2_amd64.deb
sudo apt-get install -y

echo 'installing VPN'
sudo apt-get install openconnect network-manager-openconnect network-manager-openconnect-gnome -y

echo 'installing postman'
sudo snap install postman

echo 'installing jq'
sudo apt-get install jq

echo '----- installing zsh -----'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

# Deprecated
# echo 'installing ckb-next'
# echo 'required packages'
# sudo apt install build-essential cmake libudev-dev qt5-default zlib1g-dev libpulse-dev libquazip5-dev libqt5x11extras5-dev libxcb-screensaver0-dev libxcb-ewmh-dev libxcb1-dev qttools5-dev git libdbusmenu-qt5-dev -y
# echo 'ckb-next'
# git clone https://github.com/ckb-next/ckb-next.git
# cd ckb-next
# source quickinstall
