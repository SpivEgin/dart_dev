#
# LegionMarket Dartlang base

# Pull base image.
FROM debian:stretch-slim

# Install Dart.
<<<<<<< HEAD
ENV DART_VERSION=2.1.1-dev.3.2
RUN apt-get update
RUN apt-get install -y unzip git
=======
ENV DART_VERSION=2.2.0-dev.0.0
RUN apt-get update &&\
    apt-get install -y unzip wget git build-essential &&\
    apt-get -y autoclean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
>>>>>>> 9335c1475923b62c7b109ec29780ebb2c90c7bf4

# Set environment variables.
RUN mkdir /opt/dart /opt/dart/code /opt/dart/data /opt/dart/bin /opt/dartlang /opt/config
#ADD files/dartsdk-linux-x64-release.zip /opt/dartlang/dartsdk-linux-x64-release.zip
ADD https://storage.googleapis.com/dart-archive/channels/dev/release/${DART_VERSION}/sdk/dartsdk-linux-x64-release.zip /opt/dartlang/

RUN cd /opt/dartlang/ && \
    unzip dartsdk-linux-x64-release.zip && \
    rm dartsdk-linux-x64-release.zip

#ADD files/config.sh /opt/config/config_dart.sh
#RUN chmod +x /opt/config/config_dart.sh &&\
#    bash /opt/config/config_dart.sh 

ENV DARTPATH=/opt/dartlang/dart-sdk/bin \
	DARTPUB=~/.pub-cache \
    PATH=$DARTPATH:$DARTPUB:$HOME/.pub-cache/bin:$PATH
	
RUN echo export PATH=$DARTPATH:$DARTPUB:$PATH > ~/.bashrc    
# Define working directory.
WORKDIR /opt/dart/code

# Define default command.
#CMD ["bash"]
#ENTRYPOINT ["/bin/bash"]
