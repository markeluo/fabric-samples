#!/bin/bash
UP_DOWN="$1"
COMPOSE_FILE=/root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/docker-compose-orderer.yaml
DOCKER_VERSION=`/usr/local/bin/docker-compose -version 2>&1 |awk 'NR==1{ gsub(/"/,""); print $3 }'`
if [ "$DOCKER_VERSION" != "1.17.0," ]; then
    sleep 2
fi
function printHelp () {
        echo "Usage: ./orderer_setup <up|down> arguments must be in order."
}
function networkUp () {
        if [ -d "/root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/cahome" ]; then
                echo "cahome directory already exists."
        else
                mkdir "/root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/cahome"
        fi

        if [ -d "/root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/crypto-config" ]; then
                echo "crypto-config directory already exists."
        else
                #Generate all the artifacts that includes org certs, orderer genesis block,
                # channel configuration transaction
                source /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/generateArtifacts.sh
        fi

        /usr/local/bin/docker-compose -f $COMPOSE_FILE up
}
function scpfiletopeerfun(){
        if [ -d "/root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/crypto-config" ]; then
                source /root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/scpfiletopeer.sh
        else
                echo "crypto-config directory already exists."
        fi
}
function clearContainers () {
        CONTAINER_IDS=$(docker ps -aq)
        if [ -z "$CONTAINER_IDS" -o "$CONTAINER_IDS" = " " ]; then
                echo "---- No containers available for deletion ----"
        else
                docker rm -f $CONTAINER_IDS
        fi
}
function networkDown () {
        /usr/local/bin/docker-compose -f $COMPOSE_FILE down
        #Cleanup the chaincode containers
        clearContainers
}
if [ "${UP_DOWN}" == "up" ]; then
        networkUp
elif [ "${UP_DOWN}" == "down" ]; then ## Clear the network
        networkDown
elif [ "${UP_DOWN}" == "restart" ]; then ## Restart the network
        networkDown
        networkUp
else
        printHelp
        exit 1
fi