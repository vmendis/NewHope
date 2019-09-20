# Dockerfile
  
# Build:  docker build -t zulujdk:12.0.1 .       NOTE: This will override this version
# Run:  docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) zulujdk:12.0.1
#       docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) zulujdk:12.0.1 javac Main.java   // Compiles Main.java, creates Main.class
#       docker run --rm  -v $PWD:/app -w /app  -u $(id -u ${USER}):$(id -g ${USER}) zulujdk:12.0.1 java Main   // Runs java Main class

#
#  tools-1.6.0.jar.zip is downloaded and installed onto /opt/lib/tools.jar     // This is for the tutorial from
#                                                                             // https://github.com/maping/java-maven-calculator-web-app
#                                                                            // mvn jetty:run  fails. Idea is to test the code  

FROM alpine-base:3.7

ENV JAVA_HOME="/opt/jvm"
ENV JAVA_HOME_BIN="$JAVA_HOME/bin"
ENV JAVA_GROUP="java"
ENV JAVA_USER="java"
ENV JAVA_VERSION="12"
ENV OPEN_JDK_VERSION="12.0.1"

ENV PATH=$PATH:$JAVA_HOME_BIN


MAINTAINER Virantha Mendis

RUN addgroup $JAVA_GROUP && \
    mkdir /opt && \
    adduser -D -g 'Java User' -s /bin/sh -G $JAVA_GROUP -h $JAVA_HOME $JAVA_USER && \
    cd $JAVA_HOME && \
    wget https://cdn.azul.com/zulu/bin/zulu$JAVA_VERSION.2.3-ca-jdk$OPEN_JDK_VERSION-linux_musl_x64.tar.gz && \
    tar -xzvf zulu$JAVA_VERSION.2.3-ca-jdk$OPEN_JDK_VERSION-linux_musl_x64.tar.gz --strip-components=1 && \
    chown  -R $JAVA_USER:$JAVA_GROUP $JAVA_HOME && \
    rm zulu$JAVA_VERSION.2.3-ca-jdk$OPEN_JDK_VERSION-linux_musl_x64.tar.gz && \
    cd /tmp  && \ 
    wget  http://www.java2s.com/Code/JarDownload/tools/tools-1.6.0.jar.zip && \
    unzip tools-1.6.0.jar.zip && \
    mkdir -p /opt/lib && \
    mv tools-1.6.0.jar  /opt/lib/tools.jar && \
    chown  $JAVA_USER:$JAVA_GROUP /opt/lib/tools.jar
    

USER $JAVA_USER

CMD ["java"]

