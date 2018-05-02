#!/bin/bash
pscount=`docker ps -q | wc -l`
echo $pscount
if [ "$pscount" = "3" ]; then
    echo "peer nodes is running..........."
    exit 0
else
    echo "peer nodes is not running!"  
    exit 1  
fi

exit 0
