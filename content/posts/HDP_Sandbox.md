+++
date = "2021-07-27"
title = "Hortonworks Data Platform (HDP) Sandbox on AWS EC2"
description = "Hortonworks Data Platform (HDP) Sandbox Docker on AWS EC2"
series = ["AWS", "HDP"]
draft = "false"
+++

This post demonstrates the process of installing the docker image of Hortonworks Data Platform (HDP) sandbox, used  for exploring a single node Hadoop Cluster for Big Data Analytics applications. The installation is done on an AWS EC2 instance, running Amazon Linux 2.

The HDP Sandbox makes it easy to get started with Apache Hadoop, Apache Spark, Apache Hive, Apache HBase, Druid and Data Analytics Studio (DAS).
 
  - Learn more about the HDP Sandbox at: https://www.cloudera.com/products/hdp.html  
  - Official Installtion documentation of HDP Sandbox at: https://www.cloudera.com/downloads/hortonworks-sandbox/hdp.html

**Installation of HDP Sandbox via Docker on an AWS EC2 instance**

1. Spin up an AWS EC2 instance with the following specifications
    - OS:  **Amazon Linux 2** (Amazon Linux 2 AMI (HVM), SSD Volume Type)
    - 4 vCPUs, 16 GB RAM   (t2.xlarge)
    - In Security policy,
      - Open SSH Port 22 to be accessed only from your local machine
      - Open TCP Port 8080 to be accessed from any IPv4 (0.0.0.0/0)
      - Open TCP Port 2222 to access the Sandbox through SSH from any IPv4
    - Default user name is ec2-user
2. In the terminal, Update your Amazon Linux repositories
```
sudo yum update -y
```
3. Install & Start Docker
```
sudo amazon-linux-extras install docker
sudo service docker start
```
4. Add the ec2-user to the docker group so you can execute Docker commands without using sudo.
```
sudo usermod -a -G docker ec2-user
```
5. Log out and log back in again to pick up the new docker group permissions.
```
logout
```
6. Login again with same username: ec2-user
 
7. Verify that the ec2-user can run Docker commands without sudo.
 ```
docker info
```
8. Change the user of the current session to 'root'
 ```
sudo -s
```
9. Download HDP 2.6.5 sandbox files
 ```
curl -O https://archive.cloudera.com/hwx-sandbox/hdp/hdp-2.6.5/HDP_2.6.5_deploy-scripts_180624d542a25.zip
```
This link is obtained from: https://www.cloudera.com/downloads/hortonworks-sandbox/hdp.html
10. Unzip the downloaded files
 ```
unzip HDP_2.6.5_deploy-scripts_180624d542a25.zip
```
11. Run the HDP setup script
 ```
bash docker-deploy-hdp265.sh
```
12. Test if the HDP sandbox is running properly
 ```
curl localhost:8080
```
  - If response received is as below, then all is well. 
{{< figure src="/files/hdp-sandbox.png" caption="" width="600" >}}

13. Apache Ambari should now be available in the browser from  
<AWS_Public_IP_host_name>:8080  
Username: raj_ops  
Password: raj_ops

14. Logout now. HDP Sandbox terminal can be accessed from
  - Port: 2222
  - Username: root
  - Password: hadoop
  -  Login using these credentials at Port 2222  
15. After logging in verify,
 ```
sandbox-version
```
Output should be:
{{< figure src="/files/hdp-sandbox-version.png" caption="" width="500" >}}
16. Check installed version of Hadoop and Hive
```
hadoop version
hive --version
```
Hadoop 2.7.3.2.6.5.0-292 & Hive 1.2.1000.2.6.5.0-292 should be obtained.

17. On reboot, the docker container does not start. Do the follow for it to restart after every reboot.
```
docker stop sandbox-hdp
docker stop sandbox-proxy
docker update --restart unless-stopped sandbox-hdp
docker update --restart unless-stopped sandbox-proxy
docker container start sandbox-hdp
docker container start sandbox-proxy
```
Checking docker container status with:
```
docker container ls -a
```

You can now continue in your journey to exploring Big Data Analytics using the HDP Sandbox.. Enjoy!

**Credits:** [Peter Reiter, Thomas Feilhauer, Armin Simma from FH Vorarlberg University of Applied Sciences, Austria](https://energie.labs.fhv.at/~repe/bigdata/introduction-to-big-data-projects/tutorials/hdp-sandbox-deploy-2019/)