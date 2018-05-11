#!/bin/bash
#
# Copyright marke yunify. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#
nodepid=`lsof -i:4000|awk '{print $2}'`
echo $nodepid
if [ "$nodepid" = "" ]; then
    cd /opt/fabric-samples/balance-transfer/
    nohup node app.js > app.log 2>&1 &
fi