#!/bin/bash

help () {
	echo "
	\$1 = 27001
	\$2 = rs
	\$3 = ./data/rs1/
	"
}

if [ $# -lt 3 ]; then
	echo "You should define 3 incoming parameters"
	help
	exit 1
fi

mkdir -p $3
mongod --port $1 --replSet $2 --dbpath $3 --oplogSize 50 --bind_ip localhost

echo "mongod instance has started :-)"

