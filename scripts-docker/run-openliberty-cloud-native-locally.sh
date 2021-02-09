#!/bin/bash

root_folder=$(cd $(dirname $0); cd ..; pwd)

exec 3>&1

function _out() {
  echo "$(date +'%F %H:%M:%S') $@"
}

function setup() {
  echo "Run sh scripts-docker/run-monolith-db2.sh first"
    
  cd ${root_folder}
  sh scripts-docker/stop-services.sh
  
  cd ${root_folder}/monolith-open-liberty-cloud-native

  # change server.xml

  # change microprofile-config.properties

  mvn clean package
  mvn liberty:dev
}

setup
