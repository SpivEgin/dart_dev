FROM quay.io/spivegin/dart_dev:latest

ENV GO_VERSION=1.11.1 \
    GLIDE_VERSION=0.13.2

RUN mkdir /opt/golang /opt/tmp /opt/src /opt/go

ADD https://storage.googleapis.com/golang/go${GO_VERSION}.linux-amd64.tar.gz /opt/tmp/
RUN tar -C /opt/ -xzf /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz &&\
    rm /opt/tmp/go${GO_VERSION}.linux-amd64.tar.gz &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

#ADD files/config.sh /opt/config/config_golang.sh
#RUN chmod +x /opt/config/config_golang.sh &&\
#    bash /opt/config/config_golang.sh 
ENV DARTPATH=/opt/dartlang/dart-sdk/bin \
	DARTPUB=~/.pub-cache \
	GOPATH=/opt/src/ \
	GOROOT=/opt/go/ \
	GOBIN=/opt/go/bin/ \
	PATH=$DARTPATH:$DARTPUB:$GOBIN:$GOPATH:$GOROOT:$PATH 
	
RUN export PATH=$DARTPATH:$DARTPUB:$GOBIN:$GOPATH:$GOROOT:$PATH &&\
	echo export GOBIN=${GOBIN} > ~/.bashrc &&\
	echo export GOPATH=${GOPATH} >> ~/.bashrc &&\ 
	echo export GOROOT=${GOROOT} >> ~/.bashrc  &&\
	echo export PATH=$DARTPATH:$DARTPUB:$GOBIN:$GOPATH:$GOROOT:$PATH >> ~/.bashrc &&\  
	echo export PATH=$DARTPATH:$DARTPUB:$GOBIN:$GOPATH:$GOROOT:$PATH >> ~/.bashrc

ADD https://github.com/Masterminds/glide/releases/download/v${GLIDE_VERSION}/glide-v${GLIDE_VERSION}-linux-amd64.tar.gz /opt/tmp
RUN tar -C /opt/go/bin/ -xzf /opt/tmp/glide-v${GLIDE_VERSION}-linux-amd64.tar.gz &&\
    mv /opt/go/bin/linux-amd64/glide /opt/go/bin/ && rm -rf /opt/go/bin/linux-amd64 &&\
    chmod +x /opt/go/bin/glide &&\
    rm /opt/tmp/glide-v${GLIDE_VERSION}-linux-amd64.tar.gz &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
WORKDIR /opt/src/