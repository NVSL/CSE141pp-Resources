
SHELL:=/bin/bash
docker: Dockerfile
	([ -v CONFIG_REPO ] && [ -v GITHUB_OAUTH_TOKEN ] && [ -v CONFIG_REPO_ROOT_NAME ] && [ -v CONFIG_REPO_ROOT ] ) || (echo "You seed to source config.sh"; exit 1)
	docker build -t $(DOCKER_IMAGE) --build-arg GITHUB_OAUTH_TOKEN=$(GITHUB_OAUTH_TOKEN)  --build-arg CONFIG_REPO_ROOT_NAME=$(CONFIG_REPO_ROOT_NAME) --build-arg CONFIG_REPO_ROOT=$(CONFIG_REPO_ROOT) .
