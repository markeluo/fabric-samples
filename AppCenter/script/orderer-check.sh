#!/bin/bash
pscount=`docker ps -q | wc -l`
echo $pscount
if [ "$pscount"x = "2"x ]; then
    echo "orderer and ca is running..........."
    exit 0
else
    echo "orderer or ca node is not running!"  
    exit 1  
fi
exit 0
