run: build-docker
	docker run -p 8080:8080 snorberhuis/helloversion

build-docker:
	docker build -t snorberhuis/helloversion .

run-local:
	go run -ldflags '-X main.version=local' helloversion.go