#!/bin/bash

mkdir "${PWD}/c4"

docker pull structurizr/lite:latest

docker run -it --rm -p 8080:8080 -v "${PWD}/c4":/usr/local/structurizr structurizr/lite:latest
