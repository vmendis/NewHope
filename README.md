# NewHope

Useful web pages:

0. Dockerize your Java Application

     https://runnable.com/docker/java/dockerize-your-java-application

1. How to run docker image as current host user 

       https://jtreminio.com/blog/running-docker-containers-as-current-host-user/

2. How to fix Java version errors get thrown when running "mvn package" 

      http://maven.40175.n5.nabble.com/Problem-with-Maven-Tutorial-td5940067.html

3. https://github.com/maping/java-maven-calculator-web-app     // I am using the code from here to test my 
                                                              // docker images. jetty par$t not working as of 24.may.2019
                                                              // needs fixing  



---------------------------------------------------------------------------------------------------------------
Build the docker images

Purpose : Build a docker based maven 

Variants : One is using JDK from AWS

           One is using ZuluJDK from https://www.azul.com/downloads/zulu-community/

Objective : These standalone docker images can be used by developers without having JDK and Maven insatlled locally


1. make command is used to as an alternative to docker commands.

This is in ~/Work/Makefile

cd ~/Work/Makefile
make                            // This lists the available make commands

2. build-all.sh                 // This is within each version of maven  and used for building the docker image
					// This uses the make command to build the docker images

3. How to build a specific version of maven. Example, build AWS JDK based maven

cd ~/Work/Maven-Dockers/AWSCorrettoJDK-Maven
./build-all.sh



Set few aliases.    // Put these in ~/.bashrc, if your shell is bash 

These are for zulujdk, change the aliases accordingly

alias mvn='docker run -it --rm -v "$PWD":/app -w /app -u $(id -u ${USER}):$(id -g ${USER}) maven:3.3-jdk-12 mvn'
alias java='docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) zulujdk:12.0.1 java'                                                        
alias javac='docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) zulujdk:12.0.1 javac'  


Test a java application

This example is in ~/Work/Java-Code

Building and executing of the application is automated using a sherll script

1. cd ~/Work/Java-Code

2. ./build.sh 

3. Output from the build script

Compiling code using AWSJDK....
 
 
Running code using AWSJDK .....
Hello, World



Manaul way of running the same application

0. Create Main.java

public class Main
{
     public static void main(String[] args) {
        System.out.println("Hello, World");
    }
}


1. Compile Main.java

$ javac Main.java

2. Run complied Main.class

$ java Main 
Hello, World 

-------------------------------------------------------


0. Create a Maven Project on a suitable sub directory

$ docker run -it --rm -v "$PWD":/app -w /app -u $(id -u ${USER}):$(id -g ${USER}) maven:3.3-jdk-12 mvn archetype:generate -DgroupId=com.mycompany.app -DartifactId=my-app -DarchetypeArtifactId=maven-archetype-quickstart -Dint

  // This create "my-app" sub directory


1.  Build the project and test the JAR file 

Go to the project directory.

$ cd  my-app

2. Modify the pom.xml and add the code snippet which is after the ERRORS. This will stop these errors:

"ERROR] Failed to execute goal org.apache.maven.plugins:maven-compiler-plugin:3.1:compile (default-compile) on project my-app: Compilation failure: Compilation failure:
[ERROR] Source option 5 is no longer supported. Use 7 or later.
[ERROR] Target option 5 is no longer supported. Use 7 or later."

// these must be inside <project

  <properties>
    <maven.compiler.source>1.8</maven.compiler.source>
    <maven.compiler.target>1.8</maven.compiler.target>
  </properties>


3. Build the project.


$ docker run -it --rm -v "$PWD":/app -w /app -u $(id -u ${USER}):$(id -g ${USER}) maven:3.3-jdk-12 mvn package


4. Test the newly compiled and packaged JAR with the following command.

$ docker run -it --rm -v "$PWD":/app -w /app maven:3.3-jdk-12 java -cp target/my-app-1.0-SNAPSHOT.jar com.mycompany.app.App

    // This should print the following output:

Hello World!

