#!/bin/bash

echo "Witaj w skrypcie instalacyjnym AstroSystem v2!"
sudo apt update -y && sudo apt upgrade -y
sudo apt install snapd -y
sudo apt install wget -y
sudo apt install python3 -y
sudo apt install vlc -y
sudo apt install mc -y
sudo apt install nano -y
pip3 install numpy matplotlib astropy 
snap install stellarium-daily
snap install codium --classic

sudo apt install build-essential groff-base libmotif-dev libnext-dev libxext-dev libxmu-dev libxt-dev libsll-dev libx11-dev libxft-dev libpng-dev libjpeg-dev libtiff-dev zlib1g-dev -y
sudo apt install gcc make flex fortran libncurses-dev -y
sudo apt install libcurl4-openssl-dev libexpat-dev libreadline-dev -y


# Download Phoebe
wget https://github.com/phoebe-project/phoebe2-ui/releases/download/1.0.1/phoebe_1.0.1_amd64.deb

# Install Phoebe
dpkg -i phoebe_1.0.1_amd64.deb

# Install dependencies
sudo apt -f install

# Download ds9
wget https://ds9.si.edu/download/ubuntu20/ds9.ubuntu20.8.4.1.tar.gz

# Extract ds9
tar -xzf ds9.ubuntu20.8.4.1.tar.gz
sudo rm ds9.ubuntu20.8.4.1.tar.gz

# Move ds9 to /opt
sudo mv ds9 /opt/

# Create symlink for ds9
sudo ln -s /opt/ds9/ds9 /usr/local/bin/ds9



# Download Starlink
wget https://ftp.eao.hawaii.edu/starlink/2021A/REV1/starlink-2021A-Ubuntu-REV1.tar.gz

# Extract the archive
tar -xzf starlink-2021A-Ubuntu-REV1.tar.gz

# Enter the directory
mv starlink-2021A-Ubuntu-REV1 /opt
cd starlink-2021A-Ubuntu-REV1

# Install Starlink
./install

# Clean up
cd ..
sudo rm starlink-2021A-Ubuntu-REV1.tar.gz
sudo rm -rf starlink-2021A-Ubuntu-REV1
echo "STARLINK_DIR=/home/$USER/opt/star"


# Download XEphem
wget http://www.clearskyinstitute.com/xephem/xephem-3.7.7.tar.gz

# Extract the files
tar xvzf xephem-3.7.7.tar.gz

# Change directory to the extracted folder
cd xephem-3.7.7

# Configure and build the software
./configure
make

# Install the software
sudo make install

# Clean up the downloaded files
cd ..
sudo rm -rf xephem-3.7.7
sudo rm xephem-3.7.7.tar.gz

# Add XEphem to the PATH environment variable
echo 'export PATH=/usr/local/xephem:$PATH' >> ~/.bashrc
source ~/.bashrc

echo "XEphem installation complete!"


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
sudo rm iraf.tar.gz
sudo rm -rf iraf-2.17

sudo apt update -y & sudo apt upgrade -y & sudo apt autoremove -y
echo "Koniec instalacji!"