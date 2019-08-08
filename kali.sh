#!/usr/bin/bash

apt install kitty -y
apt install google-chrome-stable -y
echo "[+] Installed apt packages"

cd /opt
mv Bloodhound-linux-x64 Bloodhound-linux-x64-old
wget https://github.com/BloodHoundAD/BloodHound/releases/download/2.1.0/BloodHound-linux-x64.zip
unzip BloodHound-linux-x64.zip
echo "[+] Downloaded new Bloodhound"

cd /root/Desktop
mkdir nmap
mkdir sync
echo "[+] Created desktop directories"

cd /root/tools
git clone https://github.com/Coalfire-Research/vampire
git clone https://github.com/Coalfire-Research/git-scrapers
git clone https://github.com/Djent-/NTLMssp-Extract
git clone https://github.com/secureauthcorp/impacket
echo "[+] Cloned git repositories"

pip3 install --update pip
pip3 install pyshark
cd impacket
pip install .
echo "[+] Pip installed and upgraded"

cd /root/tools
go get github.com/michenriksen/aquatone
go install github.com/michenriksen/aquatone
echo "export PATH=\$PATH:/root/go/bin" >> /root/.bashrc
echo "[+] Set up go and aquatone"

cd /root/tools/cobaltstrike
./update
echo "[+] Cobalt Strike updated"

echo ""
hostname
ifconfig eth0 | grep inet | cut -d ' ' -f 10
ifconfig eth0 | grep ether | cut -d ' ' -f 10
