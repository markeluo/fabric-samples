#!/bin/bash
#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#
/opt/fabric-samples/balance-transfer/client-start.sh && \
sleep 1 && \
rm -rf /tmp/fabric-client-kvs_peerOrg* 
node main.js >log.log 2>&1 &