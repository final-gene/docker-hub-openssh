NAME = openssh

.PHONY: lint
lint:
	@docker run --rm --volume "$(shell pwd)":/lint/input zemanlx/remark-lint --frail .
	@docker run --rm -i hadolint/hadolint < Dockerfile

.PHONY: build
build: lint
	@docker build --tag finalgene/${NAME}:dev .
	@docker images finalgene/${NAME}:dev

.PHONY: clean
clean:
	-@docker rmi --force $(shell docker images finalgene/${NAME}:dev -q)
