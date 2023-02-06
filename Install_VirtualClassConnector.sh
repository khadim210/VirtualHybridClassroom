echo "1- Packages source update...."
sudo echo "deb http://deb.debian.org/debian buster-backports main" >> /etc/apt/sources.list
sudo apt-get update

echo "2- Dependancies intallation..."
sudo apt-get install git wireguard* resolvconf bridge-utils net-tools

echo "3- Scripts download..."
git clone https://github.com/khadim210/VirtualHybridClassroom /usr/bin/VirtualHybridClassroom
sudo echo "export PATH=\"/usr/bin/VirtualHybridClassroom:$PATH\"" >> ~/.bashrc
sudo cp /usr/bin/VirtualHybridClassroom/myVirtualClassroom.conf /etc/wireguard/myVirtualClassroom.conf 

