
module github.com/swaggo/gin-swagger

go 1.15

require (
	github.com/gin-contrib/gzip v0.0.5
	github.com/gin-gonic/gin v1.7.7
	github.com/stretchr/testify v1.7.0
	github.com/swaggo/files v0.0.0-20210815190702-a29dd2bc99b2
	github.com/swaggo/swag v1.8.1
	golang.org/x/net v0.0.0-20220425223048-2871e0cb64e4
)
=======

name: build

on:
  push:
    branches: [ master ]
  pull_request:
    branches: [ master ]

jobs:
  test:
    strategy:
      matrix:
        go: [ '1.17.x', '1.18.x','1.19.x', '1.20.x' ]
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@master
      - name: Set up Go
        uses: actions/setup-go@v1
        with:
          go-version: ${{ matrix.go }}
      - name: test
        run: go test -coverprofile=coverage.txt -covermode=atomic
      - name: coverage
