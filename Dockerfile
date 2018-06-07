FROM golang:1.10-alpine

MAINTAINER luisbebop <luisbebop@gmail.com>

# set environment PATH variable again, because docker doesn't recognise it from the base container at building time. 
ENV PATH $PATH:$GOPATH/bin:$GOROOT/bin

RUN apk update && apk add git
RUN git clone https://github.com/sythe21/echo-server.git /opt/echo-server/
RUN cd /opt/echo-server && git pull && go get github.com/hashicorp/http-echo/version && go test && go build

EXPOSE 8800

CMD ["/opt/echo-server/echo-server", "-text", "hello world"]
