#!/bin/bash

export JAVA_HOME=$(/usr/libexec/java_home)
export PATH=$JAVA_HOME/jre/bin:$PATH

source /etc/profile.d/maven.sh

mvn clean package
