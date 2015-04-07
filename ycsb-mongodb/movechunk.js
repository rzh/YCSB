
// stop balancer
sh.stopBalancer();

var db = db.getSiblingDB("ycsb");

var coll = db.usertable;
var config = db.getSiblingDB("config");


var moveChunkTo = function (coll, from, to) {
    var chunksOnShard = config.chunks.find({ns: coll.getFullName(), shard: { $eq: from } }).toArray();

    var chunk = chunksOnShard[ parseInt(Math.random() * chunksOnShard.length) ];

    // move chunk
    var re = config.adminCommand({ 
          moveChunk : coll + "", 
          find : chunk.min,  // "min" lives in this chunk.
          to : to, 
          _waitForDelete: true,
          _secondaryThrottle: true
        });
    
    var re = config.adminCommand({ 
          moveChunk : coll + "", 
          find : chunk.min,  // "min" lives in this chunk.
          to : from, 
          _waitForDelete: false,
          _secondaryThrottle: true
        });
    return re
}

var t1, t2;
var i = 0;

var re;

for(;true;) {
    re = moveChunkTo(coll, "rs"+ (i % 4), "rs" + (i + 1) % 4);
    if ( re.ok ) {
        print(i + " rs"+ (i % 4) + " rs" + (i + 1) % 4 + " " + re.millis)
    } else {
        printjson(re);
    }
    i++;
}
