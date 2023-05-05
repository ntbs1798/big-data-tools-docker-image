# BIG DATA TOOLS WITH DOCKER IMAGE
---
## BUILDING DOCKER IMAGE FOR BIG DATA TOOLS FROM SCRATCH
* This project is mainly created for building docker image of big-data-tools(hadoop, hive, spark, kafka), which ran on ubuntu server. 
* The repository contains Dockerfile as well as 2 folders(hadoop_config-configs for hadoop software, hive_config-configs for hive software). 

---
## INCEPTION:
* The reason why I built this project is to deploy my own big-data-tools for personal data handling, and I will be no longer need to use the Cloudera or Hortonworks Sandbox for these tools.

---
## STEP TO BUILD:

### 1. DOCKER SETUP:
* Please refering to the docker main page for downloading and setting up the docker for your desktop through [here](https://docs.docker.com/desktop/)

### 2. BUILDING IMAGE:
* After installing docker desktop, you will need to run the docker desktop application. Besides, you can type a simple command I provided below in your command line to check if docker is running:
```bash
~$ docker --version
```
* By seeing the version of docker on cmd-command line, we know that docker is working properly (mine response is: Docker version 20.10.24, build 297e128). 
* Make sure your cmd path is in this project(which contain Dockerfile), then build your docker image by command:
```bash
~$ docker build .
```
