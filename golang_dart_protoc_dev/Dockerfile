FROM quay.io/spivegin/golang_dart_dev

RUN mkdir /opt/protoc/
ENV PROTOC=3.5.1 

RUN export GRPCPROTO=/opt/protoc/bin/ &&\
    export DARTPATH=/opt/dartlang/dart-sdk/bin &&\
    export DARTPUB=~/.pub-cache/ &&\
    export GOPATH=/opt/src/ &&\
    export GOROOT=/opt/go/ &&\
    export GOBIN=/opt/go/bin/ 


ADD https://github.com/google/protobuf/releases/download/v${PROTOC}/protoc-${PROTOC}-linux-x86_64.zip /opt/protoc/

# ADD files/protoc-3.5.1-linux-x86_64.zip /opt/protoc/

RUN export PATH=$GRPCPROTO:$GOBIN:$GOPATH:$GOROOT:DARTPUB:DARTPATH:$PATH &&\
    go get -u google.golang.org/grpc && \
    go get -u github.com/golang/protobuf/protoc-gen-go && \
    cd /opt/protoc/ && unzip protoc-${PROTOC}-linux-x86_64.zip && cd ~ && \
    pub global activate protoc_plugin

RUN echo export PATH=$GRPCPROTO:$GOBIN:$GOPATH:$GOROOT:DARTPUB:DARTPATH:$PATH > ~/.bashrc  