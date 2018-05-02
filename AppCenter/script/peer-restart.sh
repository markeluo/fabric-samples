#!/bin/bash
echo "停止 peer 节点服务...."
source /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/peer_setup.sh down
echo "peer 节点服务已停止!" && \
sleep 1 && \
echo "开始启动 peer 节点服务...."
source /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/peer_setup.sh up
echo "peer 节点服务已正常启动！"
exit 0