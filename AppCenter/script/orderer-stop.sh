#!/bin/bash
echo "停止orderer 节点服务...."
source /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/orderer_setup.sh down
echo "orderer 节点服务已停止!"
exit 0