docker pull structurizr/lite:latest

docker run -it --rm -p 8080:8080 -v $(pwd):/usr/local/structurizr structurizr/lite:latest
