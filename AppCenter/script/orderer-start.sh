#!/bin/bash
echo "停止orderer 节点服务...."
source /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/orderer_setup.sh down
echo "orderer 节点服务已停止!" && \
sleep 1 && \
echo "开始启动 orderer 节点服务...."
source /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/orderer_setup.sh up
echo "orderer 节点服务已正常启动！"
exit 0
