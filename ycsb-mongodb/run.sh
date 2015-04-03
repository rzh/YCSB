#!/bin/bash

./bin/ycsb load mongodb -s -P workloads/workloadShard -p mongodb.url=10.2.1.99:27017 -threads 64 2>&1 | tee loadPhase.log
./bin/ycsb run  mongodb -s -P workloads/workloadShard -p mongodb.url=10.2.1.99:27017 -threads 64 2>&1 | tee  runPhase.log
