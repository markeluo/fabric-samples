#!/bin/bash
echo "停止 peer 节点服务...."
source /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/peer_setup.sh down
echo "peer 节点服务已停止!"