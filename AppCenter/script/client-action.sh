#!/bin/bash

nodepid=`lsof -i:4000|awk '{print $2}'`
if [ "$nodepid" = "" ]; then
    echo "Trying to start orderer and ca nodes..." 
    source /opt/fabric-samples/balance-transfer/client-start.sh
    for i in $(seq 0 30); do
        nodepid=`lsof -i:4000|awk '{print $2}'`
        if [ "$nodepid" != "" ]; then
            break
        fi
        sleep 1
    done
fi
