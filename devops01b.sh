#!/bin/bash
if [ $# -lt 1 ]
then
	echo -e "Usage: $0 [-volumes|-cpu|-ram|-network|-all] "
	exit 1
fi
./devops01.sh "$@"
