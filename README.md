# mongodb-scripts

Deploy MongoDB 3.6.x replica set and sharded instances on localhost.

## Single mongod instance
 - help
```bash
~$ ./mongod_start.sh
You should define 3 incoming parameters

	$1 = 27001
	$2 = rs
	$3 = ./data/rs1/
```
 - start instance
```bash
~$ ./mongod_start.sh 27001 rs1 ./data/rs1/
2018-04-18T14:02:07.305+0300 I CONTROL  [initandlisten] MongoDB starting : pid=23422 port=27001 dbpath=./data/rs1/ 64-bit host=shishmakov.local
2018-04-18T14:02:07.305+0300 I CONTROL  [initandlisten] db version v3.6.2
2018-04-18T14:02:07.305+0300 I CONTROL  [initandlisten] git version: 489d177dbd0f0420a8ca04d39fd78d0a2c539420
2018-04-18T14:02:07.305+0300 I CONTROL  [initandlisten] OpenSSL version: OpenSSL 1.0.2n  7 Dec 2017
2018-04-18T14:02:07.305+0300 I CONTROL  [initandlisten] allocator: system
2018-04-18T14:02:07.305+0300 I CONTROL  [initandlisten] modules: none
2018-04-18T14:02:07.305+0300 I CONTROL  [initandlisten] build environment:
...
```

## Replica set mongod instances
 - help
```bash
~$ ./mongod_rs_starts.sh
You should define 5 incoming parameters

	$1 = count of replica set
	$2 = start port 27000
	$3 = rs
	$4 = start path for db directory ./data/rs/
	$5 = start path for log file ./log/rs/
```
 - start replica set
```bash
~$ ./mongod_rs_starts.sh 3 27000 rs ./data/rs/ ./log/rs/

=== create replica set ===

iter = 1, dir = ./data/rs/rs1, port = 27001, log = ./log/rs/mongod_1.log
about to fork child process, waiting until server is ready for connections.
forked process: 23494
child process started successfully, parent exiting

iter = 2, dir = ./data/rs/rs2, port = 27002, log = ./log/rs/mongod_2.log
about to fork child process, waiting until server is ready for connections.
forked process: 23498
child process started successfully, parent exiting

iter = 3, dir = ./data/rs/rs3, port = 27003, log = ./log/rs/mongod_3.log
about to fork child process, waiting until server is ready for connections.
forked process: 23502
child process started successfully, parent exiting

=== init replica set ===
MongoDB shell version v3.6.2
connecting to: mongodb://127.0.0.1:27001/admin
MongoDB server version: 3.6.2
{
	"info2" : "no configuration specified. Using a default configuration for the set",
	"me" : "localhost:27001",
	"ok" : 1,
	"operationTime" : Timestamp(1524049598, 1),
	"$clusterTime" : {
		"clusterTime" : Timestamp(1524049598, 1),
		"signature" : {
			"hash" : BinData(0,"AAAAAAAAAAAAAAAAAAAAAAAAAAA="),
			"keyId" : NumberLong(0)
		}
	}
}
...
```

## Sharded cluster mongod instances
 - help
```bash
~$ ./mongod_sh_starts.sh
You should define 7 incoming parameters

	$1 = count of shards
	$2 = count of replica set
	$3 = start path for db directory: ./data/sh/
	$4 = start path for log file ./log/sh/
	$5 = start server data port: 26050
	$6 = start config port: 27000
	$7 = mongos port: 27017
```
 - start cluster
```bash
~$ ./mongod_sh_starts.sh 3 3 ./data/sh/ ./log/sh/ 26050 27000 27017
===> Do you want to init Data replicaSet of 'mongod' nodes? (y/n): y
Answer: y

=== build shards servers ===
init: ./data/sh/sh_11
about to fork child process, waiting until server is ready for connections.
forked process: 23608
...


===> Do you want to init Config replicaSet of 'mongod' nodes? (y/n): y
Answer: y

=== build 3 config servers ===
init: ./data/sh/cfg1
about to fork child process, waiting until server is ready for connections.
forked process: 23662
child process started successfully, parent exiting
...

===> Do you want to init 'mongos'? (y/n): y
Answer: y

=== start mongos ===
cfg/localhost:27001,localhost:27002,localhost:27003
about to fork child process, waiting until server is ready for connections.
forked process: 23679
child process started successfully, parent exiting
...

===> Do you want to create test collection? (y/n): y
Answer: y

MongoDB shell version v3.6.2
connecting to: mongodb://127.0.0.1:27017/
MongoDB server version: 3.6.2
--- Sharding Status ---
  sharding version: {
  	"_id" : 1,
  	"minCompatibleVersion" : 5,
  	"currentVersion" : 6,
  	"clusterId" : ObjectId("5ad7288277f062f875e38125")
  }
  shards:
        {  "_id" : "rs1",  "host" : "rs1/localhost:26051,localhost:26052,localhost:26053",  "state" : 1 }
        {  "_id" : "rs2",  "host" : "rs2/localhost:26054,localhost:26055,localhost:26056",  "state" : 1 }
        {  "_id" : "rs3",  "host" : "rs3/localhost:26057,localhost:26058,localhost:26059",  "state" : 1 }
  active mongoses:
        "3.6.2" : 1
...
```

## Stop all mongos & mongod instances
```
~$ ./mongod_stop_all.sh
Stop all mongos & mongod :-)
```
