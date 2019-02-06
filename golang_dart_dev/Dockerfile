FROM quay.io/spivegin/dart_dev:latest

ENV GO_VERSION=1.11.5

RUN mkdir /opt/golang /opt/tmp /opt/src /opt/go

ADD https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz /opt/tmp/

RUN tar -C /opt/ -xzf /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz &&\
    rm /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz
RUN echo $PATH    
RUN echo export PATH=$GOBIN:$GOPATH:$GOROOT:$PATH > ~/.bashrc    
WORKDIR /opt/src/


    # export GOPATH=/opt/src/ && \
    # export GOROOT=/opt/go/ && \
    # export GOBIN=/opt/go/bin/ 
