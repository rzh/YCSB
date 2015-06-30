#!/bin/bash

export JAVA_HOME="/usr/lib/jvm/java-7-oracle/jre/"

source /etc/profile.d/maven.sh

mvn clean package
