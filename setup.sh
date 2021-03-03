sudo apt-get update

echo 'installing curl'
sudo apt install curl -y

echo 'installing git'
sudo apt install git -y

echo 'config git'
git config --global user.name Felipe Campara
git config --global user.email fcamparasilva@gmail.com
git config --global core.editor vim

echo "Generating a SSH Key"
ssh-keygen -t rsa -b 4096 -C $git_config_user_email
ssh-add ~/.ssh/id_rsa
cat ~/.ssh/id_rsa.pub | xclip -selection clipboard

echo 'enabling workspaces for both screens'
gsettings set org.gnome.mutter workspaces-only-on-primary false

# Don't forget to insert shortcut "flameshot gui"
echo 'installing flameshot'
sudo apt install flameshot -y

echo 'htop'
sudo apt install htop -y

echo 'installing vim'
sudo apt install vim -y

echo 'installing code'
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > microsoft.gpg
sudo install -o root -g root -m 644 microsoft.gpg /etc/apt/trusted.gpg.d/
sudo sh -c 'echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
sudo apt-get install apt-transport-https -y
sudo apt-get update
sudo apt-get install code -y

echo 'installing extensions'
code --install-extension Shan.code-settings-sync

echo 'installing spotify'
snap install spotify

echo 'installing chrome'
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

echo 'installing nvm'
wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.3/install.sh | bash

# Now is used franz
# echo 'installing slack'
# sudo snap install slack --classic

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
wget -c https://dbeaver.io/files/6.0.0/dbeaver-ce_6.0.0_amd64.deb
sudo dpkg -i dbeaver-ce_6.0.0_amd64.deb
sudo apt-get install -y

echo 'installing meet franz'
wget https://github.com/meetfranz/franz/releases/download/v5.6.1/franz_5.6.1_amd64.deb -O franz.deb
sudo dpkg -i franz.deb
sudo apt-get install -y -f

echo 'installing postman'
sudo snap install postman

echo 'installing zsh'
sudo apt-get install zsh -y
sh -c "$(wget https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
chsh -s /bin/zsh

echo 'export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc

source ~/.zshrc
nvm --version
nvm install 12
nvm alias default 12
node --version
npm --version

echo 'installing yarn'
curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
sudo apt update
sudo apt install yarn -y
yarn --version


echo 'installing autosuggestions'
git clone https://github.com/zsh-users/zsh-autosuggestions ~/.zsh/zsh-autosuggestions
echo "source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
source ~/.zshrc

echo 'installing theme'
sudo apt install fonts-firacode -y
sudo apt-get install fonts-powerline -y
wget -O ~/.oh-my-zsh/themes/node.zsh-theme https://raw.githubusercontent.com/skuridin/oh-my-zsh-node-theme/master/node.zsh-theme 
sed -i 's/.*ZSH_THEME=.*/ZSH_THEME="agnoster"/g' ~/.zshrc

echo 'installing ckb-next'
echo 'required packages'
sudo apt install build-essential cmake libudev-dev qt5-default zlib1g-dev libpulse-dev libquazip5-dev libqt5x11extras5-dev libxcb-screensaver0-dev libxcb-ewmh-dev libxcb1-dev qttools5-dev git libdbusmenu-qt5-dev -y
echo 'ckb-next'
git clone https://github.com/ckb-next/ckb-next.git
cd ckb-next
source quickinstall
