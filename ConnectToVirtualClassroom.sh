#To install bridge-utils at first execution please uncomment the following line
apt-get install bridge-utils

#Connection to the VPN network
echo "1 - Connection to VPN network..."
wg-quick up gre5

# Create a bridge named vbr0
echo "2 - Adding a bridge ..."
brctl addbr vbr0


# give an address to the bridge
echo "3 - Giving an address to the bridge...."
ip address add 172.16.0.6/24 dev vbr0

# Bridge activation 
echo "4 - Bridge activation..."
ifconfig vbr0 up

# Configure the computer as an End point or VTEP
echo "5 - Set the computer as a Virtual End Point"
ip link add name vxlan43 type vxlan id 43 dev gre5 remote 10.6.0.1 local 10.6.0.6 dstport 4789

#Add a virtual interface (vxlan43) to the bridge  
echo "6 - Adding a virtual interface to the bridge..."
brctl addif vbr0 vxlan43

#Virtual interface activation vxlan43
echo "7 - Virtual interface activation ..."
ifconfig vxlan43 up
