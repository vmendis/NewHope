# Dockerfile
  
# Build:  docker build -t zulujdk:12.0.1 .       NOTE: This will override this version
# Run:  docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) zulujdk:12.0.1
#       docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) zulujdk:12.0.1 javac Main.java   // Compiles Main.java, creates Main.class
#       docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) zulujdk:12.0.1 java Main   // Runs java Main class

#
#  tools-1.6.0.jar.zip is downloaded and installed onto /opt/lib/tools.jar     // This is for the tutorial from
#                                                                             // https://github.com/maping/java-maven-calculator-web-app
#                                                                            // mvn jetty:run  fails. Idea is to test the code  
# wget    https://d3pxv6yz143wms.cloudfront.net/$JAVA_VERSION.$OPEN_JDK_VERSION.04.2/amazon-corretto-$JAVA_VERSION.$OPEN_JDK_VERSION.4.2-linux-x64.tar.gz && \

FROM ubuntu-base:19.10

ENV JAVA_HOME="/opt/jvm"
ENV JAVA_HOME_BIN="$JAVA_HOME/bin"
ENV JAVA_GROUP="java"
ENV JAVA_USER="java"
ENV JAVA_VERSION="8"
ENV OPEN_JDK_VERSION="212"


ENV PATH=$PATH:$JAVA_HOME_BIN


MAINTAINER Virantha Mendis

RUN groupadd java && \
    useradd -c 'Java User' -g java -m -d /opt/jvm -s /bin/sh java   && \
    cd $JAVA_HOME && \
    wget    https://d3pxv6yz143wms.cloudfront.net/8.212.04.2/amazon-corretto-8.212.04.2-linux-x64.tar.gz && \
    tar -xzvf   amazon-corretto-8.212.04.2-linux-x64.tar.gz --strip-components=1  && \
    rm   amazon-corretto-8.212.04.2-linux-x64.tar.gz && \
    chown  -R $JAVA_USER:$JAVA_GROUP $JAVA_HOME && \
    cd /tmp  && \ 
    wget  http://www.java2s.com/Code/JarDownload/tools/tools-1.6.0.jar.zip && \
    unzip tools-1.6.0.jar.zip && \
    mkdir -p /opt/lib && \
    mv tools-1.6.0.jar  /opt/lib/tools.jar && \
    chown  $JAVA_USER:$JAVA_GROUP /opt/lib/tools.jar
    

USER $JAVA_USER

CMD ["java"]

