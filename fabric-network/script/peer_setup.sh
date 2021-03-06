#!/bin/bash
UP_DOWN="$1"
COMPOSE_FILE=/root/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/docker-compose-peer.yaml
function printHelp () {
        echo "Usage: ./orderer_setup <up|down> arguments must be in order."
}
function networkUp () {
        echo "---- start peer node ----"
        docker-compose -f $COMPOSE_FILE up >/dev/null 2>&1
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
        docker-compose -f $COMPOSE_FILE down
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