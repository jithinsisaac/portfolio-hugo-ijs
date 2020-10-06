+++
date = "2020-10-06"
title = "Metabase installation on AWS EC2"
description = "The post demonstrates installation of Metabase on AWS EC2"
series = ["AWS", "Metabase"]
draft = "false"
+++

This post demonstrates the process of installation of Metabase Business Intelligence Tool on an AWS EC2 instance.

Metabase is an open source Business Intelligence Tool used to query databases for individuals and companies with or without knowledge of SQL.

'Metabase is a simple and powerful analytics tool which lets anyone learn and make decisions from their company’s data. No technical knowledge required!'

  - Learn more about the Metabase at: https://www.metabase.com/  
  - Official Installtion documentation of Metabase at: https://www.metabase.com/docs/latest/operations-guide/installing-metabase.html

**Installation of Metabase in an AWS EC2 instance**

1. Spin up an AWS EC2 instance with the following specifications
    - Ubuntu 18.04 Server LTS OS
    - 2 vCPUs, 4 GB RAM (t2.medium)
    - In Security policy,
      - Open SSH Port 22 to be accessed only from your local machine/ or from anywhere.
      - Open Custom TCP Port 3000 to be accessed from any IP (0.0.0.0/0)
2. In the terminal, Update your Ubuntu repositories
```
sudo apt update
```
3. We will be installing the Metabase software by the Docker container approach. https://www.metabase.com/docs/latest/operations-guide/running-metabase-on-docker.html

4. First, we need to install Docker. https://docs.docker.com/engine/install/ubuntu/ Run the following commands to install Docker
```
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common

curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

 sudo apt-get update
 sudo apt-get install docker-ce docker-ce-cli containerd.io
```

5. Verify that docker had installed properly.
```
sudo docker run hello-world
```
You should get the following output. If so, then docker is installed properly.

{{< figure src="/images/docker-install-proper.jpg"  >}}
6. Run the following one-liner docker command for installating Metabase
```
sudo docker run -d -p 3000:3000 --name metabase metabase/metabase
```
7. Start Metabase in your browser by putting in the URL as 
    - http://AWS-EC2-PublicIP:3000 if you are installing in an AWS EC2 instance
      - E.g. http://15.206.178.52:1880
    - NOTE: It takes some time for the software to run for the first time. Sometimes it can takes minutes! Please wait till you get the following landing page on your browser.

{{< figure src="/images/metabase-landing-page.jpg"  >}}

8. Click on 'Getting Started', enter your details and a password. Submitting this will take you to the main Dashboard page of Metabase.

You are now ready to explore Metabase! 