#!/bin/bash
sudo -s
apt update -y && apt upgrade -y
apt install snapd -y
apt install wget -y
apt install python3 -y
apt install vlc -y
apt install mc -y
apt install nano -y
pip3 install numpy matplotlib astropy 
snap install stellarium-daily
snap install codium --classic

apt install build-essential groff-base libmotif-dev libnext-dev libxext-dev libxmu-dev libxt-dev libsll-dev libx11-dev libxft-dev libpng-dev libjpeg-dev libtiff-dev zlib1g-dev -y
apt install gcc make flex fortran libncurses-dev -y
apt install libcurl4-openssl-dev libexpat-dev libreadline-dev -y


# Download Phoebe
wget https://github.com/phoebe-project/phoebe2-ui/releases/download/1.0.1/phoebe_1.0.1_amd64.deb

# Install Phoebe
dpkg -i phoebe_1.0.1_amd64.deb

# Install dependencies
apt -f install

# Download DS9 source code
wget https://github.com/SAOImageDS9/SAOImageDS9/archive/master.tar.gz -O ds9.tar.gz

# Extract the archive
tar -xzf ds9.tar.gz

# Enter the directory
cd SAOImageDS9-master

# Compile and install DS9
./configure
make
make install

# Clean up
cd ..
rm ds9.tar.gz
rm -rf SAOImageDS9-master

# Download Starlink
wget https://ftp.eao.hawaii.edu/starlink/2021A/REV1/starlink-2021A-Ubuntu-REV1.tar.gz

# Extract the archive
tar -xzf starlink-2021A-Ubuntu-REV1.tar.gz

# Enter the directory
cd starlink-2021A-Ubuntu-REV1

# Install Starlink
./install

# Clean up
cd ..
rm starlink-2021A-Ubuntu-REV1.tar.gz
rm -rf starlink-2021A-Ubuntu-REV1


# Download XEphem source code
wget https://github.com/XEphem/XEphem/archive/refs/tags/4.1.0.tar.gz -O xephem.tar.gz

# Extract the archive
tar -xzf xephem.tar.gz

# Enter the directory
cd XEphem-4.1.0

# Compile and install XEphem
make linux
sudo make install

# Clean up
cd ..
rm xephem.tar.gz
rm -rf XEphem-4.1.0


# Download IRAF source code
wget https://github.com/iraf-community/iraf/archive/refs/tags/v2.17.tar.gz -O iraf.tar.gz

# Extract the archive
tar -xzf iraf.tar.gz

# Enter the directory
cd iraf-2.17

# Configure IRAF
./configure

# Compile and install IRAF
make
sudo make install

# Set IRAF environment variables
echo "export IRAFARCH=linux" >> ~/.bashrc
echo "export iraf=$HOME/iraf" >> ~/.bashrc
echo "source $iraf/unix/hlib/irafuser.csh" >> ~/.cshrc

# Clean up
cd ..
rm iraf.tar.gz
rm -rf iraf-2.17