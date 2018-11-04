#
# LegionMarket Dartlang base

# Pull base image.
FROM debian:stretch-slim

# Install Dart.
ENV DART_VERSION=2.1.0-dev.9.1
RUN apt-get update &&\
    apt-get install -y unzip wget git build-essential &&\
    apt-get -y autoclean &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

# Set environment variables.
RUN mkdir /opt/dart /opt/dart/code /opt/dart/data /opt/dart/bin /opt/dartlang /opt/config
#ADD files/dartsdk-linux-x64-release.zip /opt/dartlang/dartsdk-linux-x64-release.zip
ADD https://storage.googleapis.com/dart-archive/channels/dev/release/${DART_VERSION}/sdk/dartsdk-linux-x64-release.zip /opt/dartlang/

RUN cd /opt/dartlang/ && \
    unzip dartsdk-linux-x64-release.zip && \
    rm dartsdk-linux-x64-release.zip

ADD files/config.sh /opt/config/config.sh
RUN chmod +x /opt/config/config.sh &&\
    ./opt/config/config.sh

# Define working directory.
WORKDIR /opt/dart/code

# Define default command.
#CMD ["bash"]
#ENTRYPOINT ["/bin/bash"]
