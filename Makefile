VERSION_TAG = latest
REPO_NAME = "pimlab/aphpbreakdown"

.PHONY = all build test tag

all: build test tag

build:
	@docker build --tag aphpbreakdown:$(VERSION_TAG) ./ \

test:
	@docker run --rm --tty aphpbreakdown:$(VERSION_TAG); \

tag:
	@docker tag aphpbreakdown:$(VERSION_TAG) $(REPO_NAME):$(VERSION_TAG); \
	docker push $(REPO_NAME):$(VERSION_TAG); \
