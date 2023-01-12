#!/bin/bash
sudo
current_loaction=$PWD
apt update -y && apt upgrade -y
apt install snapd -y
apt install wget -y
apt install python3 -y
apt install vlc -y
apt install mc -y
pip3 install numpy matplotlib astropy phoebe
snap install stellarium-daily
snap install codium --classic
wget https://github.com/phoebe-project/phoebe2-ui/releases/download/1.0.1/phoebe-linux-x64.tar.gz
mv phoebe-linux-x64.tar.gz /opt
tar xjf phoebe-linux-x64.tar.gz
chown -R $USER /opt/phoebe-linux-x64
cd $current_loaction

wget https://www.google.com/url?q=https%3A%2F%2Fds9.si.edu%2Fdownload%2Fubuntu20%2Fds9.ubuntu20.8.4.1.tar.gz&sa=D&sntz=1&usg=AOvVaw0fVs3raYtrPEyMDKjFYQFY
mv ds9.ubuntu20.8.4.1.tar.gz /opt
tar xjf ds9.ubuntu20.8.4.1.tar.gz
chown -R $USER /opt/ds9.ubuntu20
cd $current_loaction

wget https://ftp.eao.hawaii.edu/starlink/2021A/REV1/starlink-2021A-Ubuntu-REV1.tar.gz
mv starlink-2021A-Ubuntu-REV1.tar.gz /opt
tar xjf starlink-2021A-Ubuntu-REV1.tar.gz
chown -R $USER /opt/starlink-2021A-Ubuntu-REV1
STARLINK_DIR=/opt/starlink-2021A-Ubuntu-REV1
cd $current_loaction

wget https://github.com/XEphem/XEphem/archive/refs/tags/4.1.0.tar.gz
mv 4.1.0.tar.gz /opt
tar xjf 4.1.0.tar.gz
chown -R $USER /opt/4.1.0
cd $current_loaction

wget https://github.com/iraf-community/iraf/archive/refs/tags/v2.17.tar.gz
apt install gcc make flex
apt install libcurl4-openssl-dev libexpat-dev libreadline-dev
mv v2.17.tar.gz /opt
tar xjf v2.17.tar.gz
./install 
export PATH=$PWD:$PATH
chown -R $USEr /opt/v2.17
make linux64
make sysgen 2>&1 | tee build.log
cd $current_loaction

