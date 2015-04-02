#!/bin/bash

/bin/ycsb load mongodb -s -P workloads/workloadShard -p mongodb.url=10.2.1.99:27017 -threads 64 | tee loadPhase.log
/bin/ycsb run  mongodb -s -P workloads/workloadShard -p mongodb.url=10.2.1.99:27017 -threads 64 | tee  runPhase.log
