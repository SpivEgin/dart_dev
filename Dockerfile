#
# LegionMarket Dartlang base

# Pull base image.
FROM debian:stretch-slim

# Install Dart.
ENV DART_VERSION=2.0.0-dev.48.0
RUN apt-get update
RUN apt-get install -y unzip curl git

#https://storage.googleapis.com/dart-archive/channels/dev/release/2.0.0-dev.12.0/sdk/dartsdk-linux-x64-release.zip
#curl -O https://storage.googleapis.com/dart-archive/channels/stable/release/${DART_VERSION}/sdk/dartsdk-linux-x64-release.zip && \
RUN apt-get -y autoclean
# Set environment variables.
RUN mkdir /opt/dart /opt/dart/code /opt/dart/data /opt/dart/bin /opt/dartlang
RUN cd /opt/dartlang/ && \
    curl -O https://storage.googleapis.com/dart-archive/channels/dev/release/${DART_VERSION}/sdk/dartsdk-linux-x64-release.zip && \
    unzip dartsdk-linux-x64-release.zip && \
    rm dartsdk-linux-x64-release.zip
    
ENV DARTPATH=~/.pub-cache/bin:/opt/dartlang/dart-sdk/bin

RUN echo export PATH=$DARTPATH:$PATH >> ~/.bashrc    

# Define working directory.
WORKDIR /opt/dart/code

# Define default command.
#CMD ["bash"]
#ENTRYPOINT ["/bin/bash"]
