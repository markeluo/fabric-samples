#!/bin/bash
nodepid=`lsof -i:4000|awk '{print $2}'`
echo "stop node server(4000)"
kill -9 $nodepid