#!/bin/bash
DOCKER_VERSION=`/usr/local/bin/docker-compose -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`
if [ "$DOCKER_VERSION" = "1.17.0," ]; then
    echo "Trying to start peer nodes..."
    source /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/peer-restart.sh
    for i in $(seq 0 30); do
        pscount=`docker ps -q | wc -l`
        if [ "$pscount" = "3" ]; then
            break
        fi
        sleep 1
    done
fi
