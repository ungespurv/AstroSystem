#!/bin/bash

echo "Witaj w skrypcie instalacyjnym AstroSystem v2!"
mkdir astrosystem
cd astrosystem
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
sudo apt install git libc6-dev flex bison libncurses5-dev libreadline-dev libssl-dev libbz2-dev libffi-dev libgdbm-dev liblzma-dev libsqlite3-dev tk-dev libxml2-dev libxmlsec1-dev libyaml-dev -y


# Download Phoebe
FILE=phoebe_1.0.1_amd64.deb
if [ ! -f "$FILE" ]; then
    echo "$FILE nie istnieje. Pobieram..."
    wget https://github.com/phoebe-project/phoebe2-ui/releases/download/1.0.1/phoebe_1.0.1_amd64.deb
fi

# Install Phoebe
dpkg -i phoebe_1.0.1_amd64.deb

# Install dependencies
sudo apt -f install

# Download ds9
git clone https://github.com/SAOImageDS9/SAOImageDS9.git
cd SAOImageDS9
./configure
make
sudo make install


# Download Starlink
FILE=starlink-2021A-Ubuntu-REV1.tar.gz
if [ ! -f "$FILE" ]; then
    echo "$FILE nie istnieje. Pobieram..."
    wget https://ftp.eao.hawaii.edu/starlink/2021A/REV1/starlink-2021A-Ubuntu-REV1.tar.gz

fi

# Extract the archive
tar -xzf starlink-2021A-Ubuntu-REV1.tar.gz

cd starlink-2021A-Ubuntu-REV1
./install.pl
export STARLINK_DIR=/path/to/starlink
source $STARLINK_DIR/etc/profile



# Download XEphem
FILE=xephem-4.1.0.tar.gz
if [ ! -f "$FILE" ]; then
    echo "$FILE nie istnieje. Pobieram..."
    wget http://www.clearskyinstitute.com/xephem/xephem-4.1.0.tar.gz

fi

# Extract the files
tar -xzf xephem-4.1.0.tar.gz
cd xephem-4.1.0
./configure
make
sudo make install
export XEphem=/usr/local/xephem
export PATH=$XEphem:$PATH

echo "XEphem installation complete!"

# Download IRAF source code
git clone https://github.com/iraf-community/iraf.git
cd iraf

./configure --with-tables=$HOME/iraf/tables
cd sys
make
make install
echo "export IRAFARCH=linux64" >> ~/.bashrc
echo "export IRAF=$HOME/iraf" >> ~/.bashrc
echo "source $HOME/iraf/unix/hlib/irafuser.csh" >> ~/.cshrc
source ~/.bashrc

sudo apt update -y & sudo apt upgrade -y & sudo apt autoremove -y
echo "Koniec instalacji!"
source ~/.bashrc