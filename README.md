# Newhope

## Objective

These standalone docker images can be used by developers without having a JDK and Maven insatlled locally. The idea came to me while I was looking for a practical usage of docker in a DevOPS enviornment.

Two JDK distributions are used as examples to build the docker images

  - Amazon Corretto JDK  - https://aws.amazon.com/blogs/opensource/amazon-corretto-no-cost-distribution-openjdk-long-term-support/
  - Zulu JDK - https://www.azul.com/downloads/zulu-community/?&architecture=x86-64-bit&package=jdk


### Notes
- Clone the repository

- Linux **make** command is used to as an alternative to using **docker** commands. The **Makefile** used in these example is in ./NewHope/Maven-Dockers. Running **make** command  in this direcory will list the available make sub-commands

- Maven-Dockers - This directory contains the code to build two variants of the docker images in seperate  sub-directories:
-  - AWSCorrettoJDK-Maven
-  - ZuluJDk-Maven

- build-all.sh -  This script sits inside each version of maven build sub-direcory and uses the make command to build the docker image

- Make sue **wget** is available on the host. If not please install it
- The build process has been tested on "Amazon Linux 2" and "MacOS". If it necessary to install Docker in these two platforms follow the correct procedure and install docker before continuing. 

Installing Docker "Amazon Linux 2" :
https://docs.aws.amazon.com/AmazonECS/latest/developerguide/docker-basics.html

Installing Docker on "MacOS" : 
https://docs.docker.com/docker-for-mac/install/

### Dependencies

Confirm following paths are available as the necessary software is downloaded on the fly. **In real life the software must be available locally.**

AWS JDK: 
wget https://d3pxv6yz143wms.cloudfront.net/8.212.04.2/amazon-corretto-8.212.04.2-linux-x64.tar.gz

ZuluJDK: wget https://cdn.azul.com/zulu/bin/zulu12.2.3-ca-jdk12.0.1-linux_musl_x64.tar.gz

Maven : wget http://apache.osuosl.org/maven/maven-3/3.3.9/binaries/apache-maven-3.3.9-bin.tar.gz


#### Steps to build AWSCorrettoJDK-Maven
```sh
$ git clone https://github.com/vmendis/NewHope.git
$ cd ./NewHope/Maven-Dockers/AWSCorrettoJDK-Maven
$ ./build-all.sh
Set few aliases.  Put these in ~/.bashrc, if your shell is bash
alias mvn='docker run -it --rm -v "$PWD":/app -w /app -u $(id -u ${USER}):$(id -g ${USER}) maven:3.3-AWSJDK-8-21 mvn
alias java='docker run --rm -v $PWD:/app -w /app -u $(id -u ${USER}):$(id -g ${USER}) awscorrettojdk:8.21  java'
alias javac='docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER})   awscorrettojdk:8.21 javac'
```

#### Steps to build ZuluJDK-Maven

```sh
$ cd ./NewHope/Maven-Dockers/ZuluJDk-Maven
$ ./build-all.sh
Set few aliases.  Put these in ~/.bashrc, if your shell is bash
alias mvn='docker run -it --rm -v "$PWD":/app -w /app -u $(id -u ${USER}):$(id -g ${USER}) maven:3.3-ZULUJDK-12 mvn'
alias java='docker run --rm -v $PWD:/app -w /app -u $(id -u ${USER}):$(id -g ${USER}) zulujdk:12.0.1 java'
alias javac='docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) zulujdk:12.0.1 javac'
```


#### Test a java application

The example code used for testing is in ./NewHope/Java-Code
```sh
$ cd ./NewHope/Java-Code

**Compiling and running code using AWSJDK**
[ec2-user@10 Java-Code]$  ./build-using-aws-jdk.sh
Compiling code using AWSJDK....

Running code using AWSJDK .....
Hello, World
[ec2-user@10 Java-Code]$

**Compiling and running code using Zulu JDK**

[ec2-user@10 Java-Code]$  ./build-using-zulu-jdk.sh
rm: cannot remove ‘./Main.class’: No such file or directory
Compiling code using ZuluJDK....

Running code using ZuluJDK.....

Hello, World
[ec2-user@10 Java-Code]$


**Further notes will be added describing few more examples of building Java applications
**

