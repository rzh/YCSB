#!/bin/bash

SERVER="10.2.0.100"

./bin/ycsb load mongodb -s -P workloads/workloadShard -p mongodb.url=$SERVER:27017 -threads 64 2>&1 | tee loadPhase.log
./bin/ycsb run  mongodb -s -P workloads/workloadShard -p mongodb.url=$SERVER:27017 -threads 64 2>&1 | tee  runPhase.log
