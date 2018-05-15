#!/bin/bash
nodepid=`lsof -i:8080|awk '{print $2}'`
echo "POST request Enroll on Org1  ..."
echo
ORG1_TOKEN=$(curl -s -X POST \
  http://localhost:4000/users \
  -H "content-type: application/x-www-form-urlencoded" \
  -d 'username=lwl&orgName=org1')
echo $ORG1_TOKEN
ORG1_TOKEN=$(echo $ORG1_TOKEN | jq ".token" | sed "s/\"//g")
echo
echo "ORG1 token is $ORG1_TOKEN"

echo "GET query Channels"
echo
peer0channel=$(curl -s -X GET \
  "http://localhost:4000/channels?peer=peer0" \
  -H "authorization: Bearer $ORG1_TOKEN" \
  -H "content-type: application/json"\
  )
echo
sleep 3
echo "channel######:"$peer0channel

if [[ "$nodepid" = "" ]] || [[ "$peer0channel"x = ""x ]]; then
    echo "Trying to start orderer and ca nodes..." 
    source /opt/fabric-samples/blockchain-explorer/client-restart.sh
    for i in $(seq 0 30); do
        nodepid=`lsof -i:4000|awk '{print $2}'`
        if [ "$nodepid" != "" ]; then
            break
        fi
        sleep 2
    done
fi
