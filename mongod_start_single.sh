#!/bin/bash

help () {
	echo "
	\$1 = 27001
	\$2 = ./data/db/
	"
}

if [ $# -lt 2 ]; then
	echo "You should define 2 incoming parameters"
	help
	exit 1
fi

mkdir -p $2
mongod --port $1 --dbpath $2 --oplogSize 50 --bind_ip localhost

echo "mongod instance has started :-)"

