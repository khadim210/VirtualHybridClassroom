#Script de deconnexion 
#Virtual interface activation vxlan43
echo "1 - Virtual interface disactivation ..."
ifconfig vxlan43 down

#Delete a virtual interface (vxlan43) from the bridge  
echo "2 - Deleting a virtual interface from the bridge..."
brctl delif vbr0 vxlan43

# Unconfigure the computer as an End point or VTEP
echo "3 - Unset the computer as a Virtual End Point"
ip link delete name vxlan43  

# Bridge desactivation 
echo "4 - Bridge desactivation..."
ifconfig vbr0 down 

# Deleting a bridge named vbr0
echo "5 - Deleting the bridge connection..."
brctl delbr vbr0

# Disconnecting from VPN Server
wg-quick down gre5
