# Pseudo Dockerized Cloudera Distribution Cluster

## Summary 
This project contains scripts to create a fully dockerized Cloudera Cluster, on a single host, allowing Big Data developers to test frameworks in a low cost and controlled environment. 
## What you will find
* Dockerfiles for Cluster Headnodes and for Datanodes
* A Docker Compose file with IP, network, hostanames and volume mappings, one for a first install and another for prior usages
* Some miscelaneous files

## How to start the cluster
If you want a more detailed explanation for these steps visit 

* Have docker and docker-compose installed in your machine 


* Before starting the docker service increase your containers size limit 

```
$ service docker-service stop 
$ dd if=/dev/zero of=/var/lib/docker/devicemapper/devicemapper/data bs=1G count=0 seek=200 
# Create the following file if it does not exist
$ touch /etc/docker/daemon.json
# Insert the following into the file:
{
  "storage-driver": "devicemapper"
}
$ dockerd --storage-opt dm.basesize=20G
# After running this command do Ctrl+C
$ service docker start
# Check docker info to see if the sizes have changed
$ docker info
```

* Start your docker service
* Go to the Cloudera_Cluster_Dockers directory and run

```
$ cp DockerComposeFiles_First_Use/docker-compose.yml .
$ ./build.sh
```
* After the images build, run
```
./up.sh
```

* Wait about 10 minutes and go to localhost:7180, you should see the Cloudera Manager UI
* Follow the setup instructions (again there is more detailed info for configuration tuning and instalation guide here: )
* Once you have installed what you need in your cluster, save changes to the docker images
```
# First get the running container list
$ sudo docker ps
# Then get the existing images
$ sudo docker images
# Finally run this for ALL hosts in your cluster
$ sudo docker commit <CONTAINER_ID> <IMAGE_NAME>
# For example: sudo docker commit 117007b8464a datanode2_image
# When the images are commited, run:
$ cp DockerComposeFiles_Regular_Use/docker-compose.yml .
````


## Customizing your Cluster

If you want to add or remove nodes, just change the `docker-compose.yml` file accordingly: add a new container,assign a new ip, a new hostname, etc, and just run the up.sh script again
