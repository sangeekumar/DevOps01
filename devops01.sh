#!/bin/bash
# This works only on Mac machine.


# Number of volumes, size of each volume, free space on each volume. 
df -H

echo ""
# Number cpus/cores, information about the cpus/core.
echo "cpus/cores= `sysctl hw.physicalcpu hw.logicalcpu`"

echo ""
# Amount of ram
echo "memory= `sysctl hw.memsize`"

echo ""
# mac address and ip address.
echo ""
echo "mac address=`ifconfig en0|grep 'ether'`"
echo ""
echo  "ip address= `ipconfig getifaddr en0` " 


