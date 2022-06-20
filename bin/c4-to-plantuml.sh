#!/bin/bash

# config
diagram_type="plantuml"                   # "dot" | "mermaid" | "plantuml"
image_folder="/source/images/c4"
file_ex="puml"                            # "dot" | "mmd"     | "puml"

# paths
image_path="${PWD}${image_folder}"

# output folders
mkdir "${PWD}/source"
mkdir "${PWD}/source/images"
mkdir "${image_path}"

rm -f "${image_path}/*.${file_ex}"

docker pull structurizr/cli:latest

docker run --rm -v "${PWD}":/usr/local/structurizr structurizr/cli:latest \
  export --workspace ./c4/workspace.dsl --format "${diagram_type}" --output ".${image_folder}"
