FROM quay.io/spivegin/golang_dart_dev

RUN mkdir /opt/protoc/
ENV PROTOC=3.5.1 

ADD https://github.com/google/protobuf/releases/download/v${PROTOC}/protoc-${PROTOC}-linux-x86_64.zip /opt/protoc/

# ADD files/config.sh /opt/config/config_protoc.sh
# # ADD files/protoc-3.5.1-linux-x86_64.zip /opt/protoc/
# RUN chmod +x /opt/config/config_protoc.sh &&\
#     bash /opt/config/config_protoc.sh && \
#     rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
ENV DARTPATH=/opt/dartlang/dart-sdk/bin  \
    DARTPUB=~/.pub-cache \
    DARTPROTO=~/.pub-cache/bin  \
    GOPATH=/opt/src/ \
    GOROOT=/opt/go/ \
    GOBIN=/opt/go/bin/ \
    GRPCPROTO=/opt/protoc/bin/ \
    PATH=$DARTPATH:$DARTPUB:$GOBIN:$GOPATH:$GOROOT:$GRPCPROTO:$PATH

RUN export PATH=$DARTPATH:$DARTPUB:$GOBIN:$GOPATH:$GOROOT:$GRPCPROTO:$PATH &&\
    echo export PATH=$DARTPATH:$DARTPUB:$GOBIN:$GOPATH:$GOROOT:$GRPCPROTO:$DARTPROTO:$PATH >> ~/.bashrc
RUN go get -u google.golang.org/grpc && \
    go get -u github.com/golang/protobuf/protoc-gen-go && \
    cd /opt/protoc/ && unzip protoc-${PROTOC}-linux-x86_64.zip && cd ~ && \
    pub global activate protoc_plugin &&\
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/* 