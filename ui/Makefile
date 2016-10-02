build:
	npm run gulp -- build

deploy: build
	aws s3 cp build/ s3://www.phil-simmons.com --recursive

.PHONY: build
