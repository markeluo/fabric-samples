#!/bin/bash
UP_DOWN="$1"
COMPOSE_FILE=docker-compose-peer.yaml
function printHelp () {
        echo "Usage: ./orderer_setup <up|down> arguments must be in order."
}
function networkUp () {
        echo "---- start couchdb service ----"
        docker run -p 5984:5984 -d --name couchdb -e COUCHDB_USER=admin -e COUCHDB_PASSWORD=password -v ~/gopath/src/github.com/hyperledger/fabric/examples/e2e_cli/couchdb:/opt/couchdb/data klaemo/couchdb 2>&1
        echo "---- start peer node ----"
        docker-compose -f $COMPOSE_FILE up 2>&1
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