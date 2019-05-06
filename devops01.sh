#!/bin/bash

volumes=false
cpu=false
ram=false
network=false
all=false

while test $# -gt 0
do
    case "$1" in
        -volumes) volumes=true
            ;;
        -cpu) cpu=true
            ;;
        -ram) ram=true
            ;;
        -network) network=true
            ;;
        -all) all=true
            ;;
        *) echo -e "Usage: $0 [-volumes|-cpu|-ram|-network|-all] "
	       exit 1
    
            ;;
    esac
    shift
done


# This works only on Mac machine.

if [ "$(uname)" == "Darwin" ]; then
	echo "Mac machine"
    if [ "$volumes" = true  ] || [ "$all" = true ] ; then
        # Number of volumes, size of each volume, free space on each volume. 
        df -H
	    echo ""
    fi
    if [ "$cpu" = true  ] || [ "$all" = true ] ; then
        # Number cpus/cores, information about the cpus/core.
        echo "cpus/cores= `sysctl hw.physicalcpu hw.logicalcpu`"
        echo ""
    fi
    if [ "$ram" = true  ] || [ "$all" = true ] ; then
        # Amount of ram
        echo "memory= `sysctl hw.memsize`"
        echo ""
    fi
    if [ "$network" = true  ] || [ "$all" = true ] ; then
        # mac address and ip address.
        echo ""
        echo "mac address=`ifconfig en0|grep 'ether'`"
        echo ""
        echo  "ip address= `ipconfig getifaddr en0` "    
    fi     
# This works on Linux
elif [ "$(expr substr $(uname -s) 1 5)" == "Linux" ]; then
	echo "Linux machine"	
	if [ "$volumes" = true  ] || [ "$all" = true ] ; then
        df -H 
    fi  
    if [ "$cpu" = true  ] || [ "$all" = true ] ; then 
        echo "cpus = `lscpu | grep 'CPU(s)'`" ;echo "cores = `lscpu| grep 'Core(s)'`"
    fi
    if [ "$ram" = true  ] || [ "$all" = true ] ; then
        echo "memory = `vmstat -s |grep memory`"
    fi
    if [ "$network" = true  ] || [ "$all" = true ] ; then
        echo "mac addr = `ifconfig -a | grep HWaddr`" ; echo "ip addr = `ifconfig -a | grep 'inet addr'`"
    fi
#This works on Windows   32 bit 
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW32_NT" ]; then
	echo "Windows 32bit"    hostname -i command

#This works on Windows 64 bit
elif [ "$(expr substr $(uname -s) 1 10)" == "MINGW64_NT" ]; then
	echo "Windows 64bit"    

fi



