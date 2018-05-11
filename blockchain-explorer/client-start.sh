#!/bin/bash
# Copyright yunify marke. All Rights Reserved.
#
nodepid=`lsof -i:4000|awk '{print $2}'`
echo $nodepid
if [ "$nodepid" != "" ]; then
  echo "start init blockchain..."
  sh /opt/fabric-samples/blockchain-explorer/client-init.sh
else
  echo "start node 4000 server..."
  sh /opt/fabric-samples/balance-transfer/client-start.sh
  sleep 2 && \
  cd /opt/fabric-samples/blockchain-explorer/
  echo "start init blockchain..."
  sh /opt/fabric-samples/blockchain-explorer/client-init.sh
fi
sleep 3 && \
rm -rf /tmp/fabric-client-kvs_peerOrg*

echo "start blockchain-explorer....."
node2pid=`lsof -i:8080|awk '{print $2}'`
if [ "$node2pid" = "" ]; then
  cd /opt/fabric-samples/blockchain-explorer/
  node main.js >log.log 2>&1 &
fi