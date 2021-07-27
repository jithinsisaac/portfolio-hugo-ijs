+++
date = "2020-09-16"
title = "InfluxDB OSS installation locally or on AWS EC2"
description = "The post demonstrates installation of InfluxDB locally or on AWS EC2"
series = ["AWS", "InfluxDB"]
draft = "false"
+++

This post demonstrates the process of installing the OSS version of InfluxDB locally or on an AWS EC2 instance, running Ubuntu 18.04/20.04.

InfluxDB is a time series database designed to handle high write and query loads. Sensor data used in IoT applications can be logged in this time series DB.

'InfluxDB is meant to be used as a backing store for any use case involving large amounts of timestamped data, including DevOps monitoring, application metrics, IoT sensor data, and real-time analytics.'

- Learn more about the InfluxDB database at: https://docs.influxdata.com/influxdb/.
- Official Installtion documentation of InfluxDB at: https://docs.influxdata.com/influxdb/v1.8/introduction/install/

**Installation of InfluxDB locally or in an AWS EC2 instance**

1. Spin up an AWS EC2 instance with the following specifications
   - Ubuntu 18.04 Server LTS OS
   - 2 vCPUs, 4 GB RAM
   - In Security policy,
     - Open SSH Port 22 to be accessed only from your local machine
     - Open TCP Port 1880 to be accessed from any IP (0.0.0.0/0)
2. In the terminal, Update your Ubuntu repositories

```
sudo apt update
```

3. Add the InfluxDB repository sources & Update your Ubuntu repositories once again

```
wget -qO- https://repos.influxdata.com/influxdb.key | sudo apt-key add -
source /etc/lsb-release
echo "deb https://repos.influxdata.com/${DISTRIB_ID,,} ${DISTRIB_CODENAME} stable" | sudo tee /etc/apt/sources.list.d/influxdb.list
sudo apt update
```

4. Install InfluxDB in your machine

```
sudo apt-get install influxdb
```

5. Start InfluxDB service

```
sudo service influxdb start
```

6. Start InfluxDB in your terminal via command

```
influx
```

OR

```
influx -precision rfc3339
```

7. You should get the following output. If so, then your installtion is proper.

{{< figure src="/images/influxdb-install-aws.jpg" caption="Node-RED on AWS EC2 instance" >}}

You are now ready to explore InfluxDB.
