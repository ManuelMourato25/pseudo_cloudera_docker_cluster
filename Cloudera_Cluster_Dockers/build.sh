#!/bin/bash

# CREATE DATA VOLUMES
sudo mkdir -p /etc/Cloudera_Pseudo_Cluster/headnode1/data
sudo mkdir -p /etc/Cloudera_Pseudo_Cluster/datanode1/data
sudo mkdir -p /etc/Cloudera_Pseudo_Cluster/datanode2/data
sudo mkdir -p /etc/Cloudera_Pseudo_Cluster/datanode3/data
sudo mkdir -p /etc/Cloudera_Pseudo_Cluster/mysql_files

# ADD SQL RELATED FILES TO VOLUMES
sudo cp ./HeadNodes/create_databases.sql /etc/Cloudera_Pseudo_Cluster/mysql_files/
sudo cp ./HeadNodes/my.cnf /etc/Cloudera_Pseudo_Cluster/mysql_files/

# ADD HOSTS FOR THE DOCKER CLUSTER NETWORK
sudo bash -c "cat docker_cluster_hosts >> /etc/hosts"

# BUILD IMAGES
sudo docker-compose build
    


