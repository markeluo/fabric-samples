#!/bin/bash
echo "停止client 节点...."
source /opt/fabric-samples/blockchain-explorer/client-stop.sh
echo "client 节点已停止!"
 
echo "启动 client 节点...."
source /opt/fabric-samples/blockchain-explorer/client-start.sh
echo "client 节点已正常启动！"
exit 0
