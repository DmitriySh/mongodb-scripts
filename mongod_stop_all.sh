#!/bin/bash

pkill -2 mongos
sleep 2
pkill -2 mongod
sleep 2

echo "Stop all mongos & mongod :-)"

