#!/bin/bash
#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#

function installNodeModules() {
    cd /opt/fabric-samples/blockchain-explorer/
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

rm -rf /tmp/fabric-client-kvs_peerOrg*

node main.js >log.log 2>&1 &