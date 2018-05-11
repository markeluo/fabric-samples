#!/bin/bash

nodepid=`lsof -i:8080|awk '{print $2}'`
if [ "$nodepid" = "" ]; then
    echo "Trying to start orderer and ca nodes..." 
    source /opt/fabric-samples/blockchain-explorer/client-start.sh
    for i in $(seq 0 30); do
        nodepid=`lsof -i:4000|awk '{print $2}'`
        if [ "$nodepid" != "" ]; then
            break
        fi
        sleep 2
    done
fi
