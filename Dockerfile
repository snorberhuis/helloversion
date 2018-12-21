FROM golang as compiler

WORKDIR /go/src/github.com/snorberhuis/helloversion
COPY .git .
COPY helloversion.go .

RUN GIT_COMMIT=$(git rev-list -1 HEAD) && \
  CGO_ENABLED=0 go install -ldflags "-s -X main.version=$GIT_COMMIT"

FROM scratch
COPY --from=compiler /go/bin/helloversion .
EXPOSE 8080
CMD ["./helloversion"]