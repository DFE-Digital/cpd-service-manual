#!/bin/bash

mkdir "${PWD}/c4"

docker pull structurizr/cli:latest

docker run --rm -v "${PWD}/c4":/usr/local/structurizr structurizr/cli:latest \
  validate --workspace ./workspace.dsl

docker run --rm -v "${PWD}/c4":/usr/local/structurizr structurizr/cli:latest \
  list --workspace ./workspace.dsl
