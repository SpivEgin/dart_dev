FROM quay.io/spivegin/golang_dart_dev

RUN mkdir /opt/protoc/
ENV PROTOC=3.5.1 \
    GRPCPROTO=/opt/protoc/bin/ \
    DARTPATH=/opt/dartlang/dart-sdk/bin \
    DARTPUB=~/.pub-cache/ \
    GOPATH=/opt/src/ \
    GOROOT=/opt/go/ \
    GOBIN=/opt/go/bin/ 


ADD https://github.com/google/protobuf/releases/download/v${PROTOC}/protoc-${PROTOC}-linux-x86_64.zip /opt/protoc/

RUN rm ~/.bashrc &&\
    echo export PATH=$GRPCPROTO:$GOBIN:$GOPATH:$GOROOT:DARTPUB:DARTPATH:$PATH >> ~/.bashrc    


#ADD files/protoc-3.5.1-linux-x86_64.zip /opt/protoc/
# RUN go get -u google.golang.org/grpc && \
#     go get -u github.com/golang/protobuf/protoc-gen-go && \
#     cd /opt/protoc/ && unzip protoc-${PROTOC}-linux-x86_64.zip && cd ~ && \
#     pub global activate protoc_plugin

