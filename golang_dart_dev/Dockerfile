FROM quay.io/spivegin/dart_dev:latest

ENV GO_VERSION=1.10

RUN mkdir /opt/golang /opt/tmp /opt/src /opt/go

ADD https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz /opt/tmp/

RUN tar -C /opt/ -xzf /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz &&\
    rm /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz

ENV GOPATH=/opt/src/ \
    GOROOT=/opt/go/ \
    GOBIN=/opt/go/bin/ 

RUN echo export PATH=$GOBIN:$GOPATH:$GOROOT:$PATH >> ~/.bashrc    
WORKDIR /opt/src/
