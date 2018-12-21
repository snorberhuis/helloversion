FROM golang:alpine as compiler

WORKDIR /go/src/github.com/snorberhuis/helloversion
COPY .git .
COPY helloversion.go .

RUN apk add --no-cache util-linux

RUN UUID=$(uuidgen) && \
  CGO_ENABLED=0 go install -ldflags "-s -X main.version=$UUID"

FROM scratch
COPY --from=compiler /go/bin/helloversion .
EXPOSE 8080
CMD ["./helloversion"]