SRC_FILES := $(shell find . -name '*.go' | grep -v vendor)

build: clean cli

clean:
	rm -rf ./dist

lint:
	gometalinter $(SRC_FILES)

test:
	go test ./...

dist:
	mkdir -p dist

task: dist/task
cli: dist/task
dist/task: dist
	go build -o ./dist/task ./clients/cmd/task