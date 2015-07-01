#!/bin/bash

SERVER="10.2.0.100"

./bin/ycsb run  mongodb -s -P workloads/workloadEvergreen_100insert -p mongodb.url=$SERVER:27017 -threads 32 
