#!/bin/bash

SERVER="10.2.0.100"

./bin/ycsb run  mongodb -s -P workloads/workloadEvergreen -p mongodb.url=$SERVER:27017 -threads 64 
