

sh.enableSharding('test');
db.getSiblingDB('test').test_collection.createIndex({'number' : 1});
sh.shardCollection('test.test_collection', {'number':1});

var bulk = db.getSiblingDB('test').test_collection.initializeUnorderedBulkOp();
people = ['Marc', 'Bill', 'George', 'Eliot', 'Matt', 'Trey', 'Tracy', 'Greg', 'Steve', 'Kristina', 'Katie', '    Jeff'];
for(var i = 0; i < 1000000; i++) {
    user_id = i;
    name = people[Math.floor(Math.random() * people.length)];
    number = Math.floor(Math.random() * 10001);
    bulk.insert({'user_id': user_id, 'name': name, 'number': number});
}
bulk.execute();

db.getSiblingDB('test').printShardingStatus();
