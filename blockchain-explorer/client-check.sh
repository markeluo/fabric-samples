#!/bin/bash
nodepid=`lsof -i:8080|awk '{print $2}'`
echo $nodepid
if [ "$nodepid" != "" ]; then
    echo "client is running..........."
    exit 0
else
    echo "client is not running!"  
    exit 1  
fi
exit 0