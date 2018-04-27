#!/bin/bash +x
#
# Copyright IBM Corp. All Rights Reserved.
#
# SPDX-License-Identifier: Apache-2.0
#
echo 'scp file to 192.168.0.8'
scp -r /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/crypto-config root@192.168.0.8:/root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/
scp -r /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/channel-artifacts root@192.168.0.8:/root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/

echo 'scp file to 192.168.0.10'
scp -r /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/crypto-config root@192.168.0.10:/root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/
scp -r /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/channel-artifacts root@192.168.0.10:/root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/

echo 'scp file to 192.168.0.13'
scp -r /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/crypto-config root@192.168.0.13:/root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/
scp -r /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/channel-artifacts root@192.168.0.13:/root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/