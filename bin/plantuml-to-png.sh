#!/bin/bash

# config
diagram_type="plantuml"
image_folder="/source/images/c4"
docs_folder="/source/technical-architecture/c4"
file_ex="puml"

# paths
image_path="${PWD}${image_folder}"
docs_path="${PWD}${docs_folder}"

docker pull miy4/plantuml:latest

FILES="${image_path}/*-SystemContext.${file_ex}"
for FILE in $FILES
do
  echo "Processing $FILE file..."

  f="$(basename -- $FILE)"
  o=${f/".${file_ex}"/".png"}

  alt_text=${f/"-SystemContext.${file_ex}"/""}
  alt_text=${alt_text/"structurizr-"/""}

  docker run --rm -v "${image_path}":/work -w /work miy4/plantuml:latest \
    -tpng -charset utf-8 "$f"

  echo "---
  title: ${alt_text} - System Context
  weight: 100
  ---

  # <%= current_page.data.title %>

  ![${alt_text}](/images/${o})
" > "${docs_path}/${alt_text}.html.md.erb"
done

FILES="${image_path}/*-Container.${file_ex}"
for FILE in $FILES
do
  echo "Processing $FILE file..."

  f="$(basename -- $FILE)"
  o=${f/".${file_ex}"/".png"}

  alt_text=${f/"-Container.${file_ex}"/""}
  alt_text=${alt_text/"structurizr-"/""}

  docker run --rm -v "${image_path}":/work -w /work miy4/plantuml:latest \
    -tpng -charset utf-8 "$f"

  echo "---
  title: ${alt_text} - Container Context
  weight: 100
  ---

  # <%= current_page.data.title %>

  ![${alt_text}](/images/${o})
" > "${docs_path}/${alt_text}.html.md.erb"
done

FILES="${image_path}/*-Component.${file_ex}"
for FILE in $FILES
do
  echo "Processing $FILE file..."

  f="$(basename -- $FILE)"
  o=${f/".${file_ex}"/".png"}

  alt_text=${f/"-Component.${file_ex}"/""}
  alt_text=${alt_text/"structurizr-"/""}

  docker run --rm -v "${image_path}":/work -w /work miy4/plantuml:latest \
    -tpng -charset utf-8 "$f"

  echo "---
  title: ${alt_text} - Component Context
  weight: 100
  ---

  # <%= current_page.data.title %>

  ![${alt_text}](/images/${o})
" > "${docs_path}/${alt_text}.html.md.erb"
done

FILES="${image_path}/*-Deployment.${file_ex}"
for FILE in $FILES
do
  echo "Processing $FILE file..."

  f="$(basename -- $FILE)"
  o=${f/".${file_ex}"/".png"}

  alt_text=${f/"-Deployment.${file_ex}"/""}
  alt_text=${alt_text/"structurizr-"/""}

  docker run --rm -v "${image_path}":/work -w /work miy4/plantuml:latest \
    -tpng -charset utf-8 "$f"

  echo "---
  title: ${alt_text} - Deployment Context
  weight: 100
  ---

  # <%= current_page.data.title %>

  ![${alt_text}](/images/${o})
" > "${docs_path}/${alt_text}.html.md.erb"
done
