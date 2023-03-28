#!/bin/bash

# Install Python 3, VLC media player, nano editor, and VSCodium
sudo apt-get update -y
sudo apt install wget -y
sudo apt-get -y install python3 vlc nano
pip3 install numpy matplotlib astropy 
wget -qO - https://gitlab.com/paulcarroty/vscodium-deb-rpm-repo/raw/master/pub.gpg | sudo apt-key add -
echo 'deb https://paulcarroty.gitlab.io/vscodium-deb-rpm-repo/debs/ vscodium main' | sudo tee /etc/apt/sources.list.d/vscodium.list
sudo apt-get update -y
sudo apt-get -y install codium
sudo apt install build-essential groff-base libmotif-dev libnext-dev libxmu-dev libxt-dev libsll-dev -y
sudo apt install gcc make flex -y
sudo apt install libcurl4-openssl-dev libexpat-dev libreadline-dev -y

# Install Stellarium
sudo add-apt-repository -y ppa:stellarium/stellarium-releases
sudo apt-get update -y
sudo apt-get -y install stellarium

# Install Phoebe
wget https://github.com/phoebe-project/phoebe2-ui/releases/download/1.0.1/phoebe_1.0.1_amd64.deb
sudo dpkg -i phoebe_1.0.1_amd64.deb
sudo apt-get -y install -f

# Install Carta
sudo snap install carta

# Install Starlink
wget https://ftp.eao.hawaii.edu/starlink/2021A/REV1/starlink-2021A-Ubuntu-REV1.tar.gz
tar -xzvf starlink-2021A-Ubuntu-REV1.tar.gz
cd starlink-2021A-Ubuntu-REV1
./configure --prefix=/usr/local/starlink
make
sudo make install
cd ..

# Install XEphem
wget https://github.com/XEphem/XEphem/archive/refs/tags/4.1.0.tar.gz
tar -xzvf 4.1.0.tar.gz
cd XEphem-4.1.0
./configure
make
sudo make install
cd ..

# Install IRAF
sudo apt-get -y install build-essential xorg-dev libbz2-dev libpng-dev libx11-dev libxpm-dev libncurses5-dev
wget https://github.com/iraf-community/iraf/archive/refs/tags/v2.17.tar.gz
tar -xzvf v2.17.tar.gz
cd iraf-2.17/unix
./install
cd ../..

sudo apt update -y & sudo apt upgrade -y & sudo apt autoremove -y