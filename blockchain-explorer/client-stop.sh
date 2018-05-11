#!/bin/bash
nodepid=`lsof -i:8080|awk '{print $2}'`
echo "stop node server(8080)"
taskkill /pid $nodepid /f