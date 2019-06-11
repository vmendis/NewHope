# Dockerfile
# Build : docker build -t maven:3.3-jdk-12 .                 // This will override the current version


FROM awscorrettojdk:8.21

ENV MAVEN_VERSION 3.3.9

ENV MAVENHOME="/opt/maven"
ENV MAVENHOMEBIN="$MAVENHOME/bin"

# zulujdk runs as user java, so we must become root here to do rooty things
USER root


RUN groupadd maven && \
    useradd -c 'Maven User' -g maven -m -d $MAVENHOME -s /usr/bin/mvn maven

RUN mkdir -p $MAVENHOME && \
    cd  $MAVENHOME  &&   \
    wget -q http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-3.3.9-bin.tar.gz && \
    tar -xzf apache-maven-$MAVEN_VERSION-bin.tar.gz --strip-components=1 && \
    rm apache-maven-$MAVEN_VERSION-bin.tar.gz && \
    chown -R maven:maven $MAVENHOME && \
    ln -s $MAVENHOME/bin /usr/bin/mvn

ENV PATH "$PATH:$MAVENHOMEBIN"


VOLUME /root/.m2

USER maven

# Remember to run this docker image as the user running it on the host
# use the -u option :
# -u $(id -u ${USER}):$(id -g ${USER})

CMD ["mvn"]
