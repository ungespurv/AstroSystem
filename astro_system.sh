#!/bin/bash

#Zakomentuj to, czego nie potrzebujesz. (:

current_loaction=$PWD
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

wget https://github.com/phoebe-project/phoebe2-ui/releases/download/1.0.1/phoebe_1.0.1_amd64.deb
dpkg -i phoebe_1.0.1_amd64.deb

wget https://www.google.com/url?q=https%3A%2F%2Fds9.si.edu%2Fdownload%2Fubuntu20%2Fds9.ubuntu20.8.4.1.tar.gz&sa=D&sntz=1&usg=AOvVaw0fVs3raYtrPEyMDKjFYQFY
tar xzf ds9.ubuntu20.8.4.1.tar.gz /opt
rm ds9.ubuntu20.8.4.1.tar.gz
chown -R $USER /opt/ds9.ubuntu20

wget https://ftp.eao.hawaii.edu/starlink/2021A/REV1/starlink-2021A-Ubuntu-REV1.tar.gz
tar xzf starlink-2021A-Ubuntu-REV1.tar.gz /opt
rm starlink-2021A-Ubuntu-REV1.tar.gz
chown -R $USER /opt/starlink-2021A-Ubuntu-REV1
STARLINK_DIR=/opt/starlink-2021A-Ubuntu-REV1

wget https://github.com/XEphem/XEphem/archive/refs/tags/4.1.0.tar.gz
tar xzf 4.1.0.tar.gz /opt
rm 4.1.0.tar.gz
chown -R $USER /opt/4.1.0

wget https://github.com/iraf-community/iraf/archive/refs/tags/v2.17.tar.gz
apt install gcc make flex
apt install libcurl4-openssl-dev libexpat-dev libreadline-dev
tar xzf v2.17.tar.gz /opt
rm v2.17.tar.gz
./install 
export PATH=$PWD:$PATH
chown -R $USEr /opt/v2.17
make linux64
make sysgen 2>&1 | tee build.log
cd $current_loaction

exit

