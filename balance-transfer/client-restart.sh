#!/bin/bash
echo "停止client 节点...."
source /opt/fabric-samples/balance-transfer/client-stop.sh
echo "client 节点已停止!" && \
sleep 1 && \
echo "启动 client 节点...."
source /opt/fabric-samples/balance-transfer/client-start.sh
echo "client 节点已正常启动！"
exit 0
