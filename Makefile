APP_NAME = starter
APP_VERSION = 0.1.0

# build with version infos
BUILD_DATE = $(shell date +%FT%T)
GIT_COMMIT = $(shell git log --pretty=format:'%h' -n 1)
GIT_BRANCH = $(shell git rev-parse --abbrev-ref HEAD)

GO_LDFLAGS += -X "main.BuildDate=${BUILD_DATE}"
GO_LDFLAGS += -X "main.CurrentCommit=${GIT_COMMIT}"
GO_LDFLAGS += -X "main.CurrentBranch=${GIT_BRANCH}"
GO_LDFLAGS += -X "main.CurrentVersion=${APP_VERSION}"

help: Makefile
	@printf "${BLUE}Choose a command run:${NC}\n"
	@sed -n 's/^##//p' $< | column -t -s ':' | sed -e 's/^/    /'

## make install: Go build the project
build:
	go build -ldflags '${GO_LDFLAGS}' ./cmd/${APP_NAME}
	@printf "Build ${APP_NAME} successfully!\n"

## make install: Go install the project
install:
	go install -ldflags '${GO_LDFLAGS}' ./cmd/${APP_NAME}
	@printf "Install ${APP_NAME} successfully!\n"

## make linter: Run golanci-lint
linter:
	golangci-lint run

## make test: Run go unittest
test:
	@go test `go list ./... | grep -v 'mock_*'` -count=1

## make test-coverage: Test project with cover
test-coverage:
	@go test -short -coverprofile coverage.txt -covermode=atomic `go list ./... | grep -v 'mock_*'`

.PHONY: test
