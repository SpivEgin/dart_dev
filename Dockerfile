#
# LegionMarket Dartlang base

# Pull base image.
FROM debian:stretch-slim

# Install Dart.
ENV DART_VERSION=2.1.1-dev.3.2
RUN apt-get update
RUN apt-get install -y unzip git

RUN apt-get -y autoclean
# Set environment variables.
RUN mkdir /opt/dart /opt/dart/code /opt/dart/data /opt/dart/bin /opt/dartlang
RUN cd /opt/dartlang/ && \
    wget https://storage.googleapis.com/dart-archive/channels/dev/release/${DART_VERSION}/sdk/dartsdk-linux-x64-release.zip && \
    unzip dartsdk-linux-x64-release.zip && \
    rm dartsdk-linux-x64-release.zip

ENV DARTPATH /opt/dartlang/dart-sdk/bin \
    DARTPUB ~/.pub-cache 

RUN echo export PATH=$DARTPATH:$PATH > ~/.bashrc    

# Define working directory.
WORKDIR /opt/dart/code

# Define default command.
#CMD ["bash"]
#ENTRYPOINT ["/bin/bash"]
