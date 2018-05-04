#!/bin/bash
#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#

function copyconfig () {
    mkdir "/opt/fabric-samples/balance-transfer/artifacts/channel/crypto-config"
    cp /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/channel-artifacts/* /opt/fabric-samples/balance-transfer/artifacts/channel/ && \
    sleep 1 && \
    cp -r /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/crypto-config /opt/fabric-samples/balance-transfer/artifacts/channel/
}
function installNodeModules() {
    cd /opt/fabric-samples/balance-transfer/
    echo
    if [ -d node_modules ]; then
            echo "============== node modules installed already ============="
    else
            echo "============== Installing node modules ============="
            npm install
    fi
    echo
}
installNodeModules
copyconfig

PORT=4000 node app