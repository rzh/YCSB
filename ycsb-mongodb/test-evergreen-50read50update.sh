#!/bin/bash

SERVER="10.2.0.100"

./bin/ycsb run  mongodb -s -P workloads/workloadEvergreen_50read50update -p mongodb.url=$SERVER:27017 -threads 32 
