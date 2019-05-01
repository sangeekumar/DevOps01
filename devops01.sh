#!/bin/bash
# This works only on Mac machine.

if [ "$(uname)" == "Darwin" ]; then
	echo "Mac machine"
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

elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	echo "Linux machine"	
	df -H    
        echo "cpus = `lscpu | grep 'CPU(s)'`" ;echo "cores = `lscpu| grep 'Core(s)'`"
        echo "memory = `vmstat -s |grep memory`"
        echo "mac addr = `ifconfig -a | grep HWaddr`" ; echo "ip addr = `ifconfig -a | grep 'inet addr'`"

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
	echo "Windows 32bit"    hostname -i command

elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
	echo "Windows 64bit"    

fi



