#!/bin/bash
#
# Copyright marke yunify. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#
nodepid=`lsof -i:4000|awk '{print $2}'`
echo $nodepid
if [ "$nodepid" = "" ]; then
    PORT=4000 node app >/dev/null 2>&1 &
fi