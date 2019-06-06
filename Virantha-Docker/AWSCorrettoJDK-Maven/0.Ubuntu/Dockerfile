# Dockerfile

# Build: docker build -t ubuntu-base:19.10 .
# Run: docker run -it ubuntu-base:19.10

FROM ubuntu:19.10
MAINTAINER Virantha Mendis

RUN apt-get update && \
      apt-get upgrade -y && \
      apt-get install -y wget && \
      apt-get install -y unzip && \
      apt-get clean autoclean && \
      apt-get autoremove && \
      rm -rf /var/lib/apt/*

# ENTRYPOINT ["sh"]
CMD ["sh"]
