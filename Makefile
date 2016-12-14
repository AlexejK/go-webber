.PHONY: build docker clean

VERSION=2

GO_FLAGS= CGO_ENABLED=0
GO_LDFLAGS= -ldflags="-X main.Version=$(VERSION)"
GO_BUILD_CMD=$(GO_FLAGS) go build $(GO_LDFLAGS)
BUILD_DIR=build
BINARY_NAME=go-webber


all: clean build

clean:
	rm -Rf $(BUILD_DIR)

build:
	@mkdir -p $(BUILD_DIR)
	GOOS=linux GOARCH=amd64 $(GO_BUILD_CMD) -o $(BUILD_DIR)/$(BINARY_NAME)-linux-amd64

docker: build
	docker build -t $(BINARY_NAME):$(VERSION) --rm .
