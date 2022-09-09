server:
	npm i @mermaid-js/mermaid-cli
	bundle exec middleman server

.PHONY: build
build:
	npm i @mermaid-js/mermaid-cli
	bundle exec middleman build --verbose
