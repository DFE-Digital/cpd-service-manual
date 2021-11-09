mkdir ./output
rm -fr ./output/*

docker pull structurizr/cli:latest

docker run --rm -v $(pwd):/usr/local/structurizr structurizr/cli:latest \
  validate --workspace workspace.dsl

docker run --rm -v $(pwd):/usr/local/structurizr structurizr/cli:latest \
  list --workspace workspace.dsl

docker run --rm -v $(pwd):/usr/local/structurizr structurizr/cli:latest \
  export --workspace workspace.dsl --format dot --output ./output

docker run --rm -v $(pwd):/usr/local/structurizr structurizr/cli:latest \
  export --workspace workspace.dsl --format json --output ./output
