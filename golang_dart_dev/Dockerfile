FROM quay.io/spivegin/dart_dev:latest

ENV GO_VERSION=1.10
RUN mkdir /opt/golang /opt/tmp /opt/src /opt/go 
ADD https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz /opt/tmp/
RUN tar -C /opt/go/go/ -xzf /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz &&\
    export GOPATH=/opt/src/ &&\
    export GOROOT=/opt/go/go/ &&\
    export GOBIN=/opt/go/go/bin/ &&\
    export PATH=$PATH:$GOBIN:$GOPATH:$GOROOT &&\
    rm /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz

ENV GOPATH=/opt/src/
WORKDIR /opt/src/
