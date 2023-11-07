
TAG = wip
DOCKERFILE = path/to/Dockerfile

build:
	docker build . -t $(TAG) -f $(DOCKERFILE) --build-arg VERSION=$$(git rev-parse --short HEAD) --ssh default

run:
	docker run -ti --rm $(TAG) $$CMD

