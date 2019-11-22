
SHELL:=/bin/bash
docker: dev student

dev: dev.docker
	([ -v CONFIG_REPO ] && [ -v GITHUB_OAUTH_TOKEN ] && [ -v CONFIG_REPO_ROOT_NAME ] && [ -v CONFIG_REPO_ROOT ] ) || (echo "You seed to source config.sh"; exit 1)
	docker build --file $< -t $(DOCKER_DEVEL_IMAGE) --build-arg GITHUB_OAUTH_TOKEN=$(GITHUB_OAUTH_TOKEN)  --build-arg CONFIG_REPO_ROOT_NAME=$(CONFIG_REPO_ROOT_NAME) --build-arg CONFIG_REPO_ROOT=$(CONFIG_REPO_ROOT) .

student: student.docker
	docker build --file $< -t $(DOCKER_IMAGE) --build-arg DEV_REPO=$(DOCKER_DEVEL_IMAGE) --build-arg CONFIG_REPO_ROOT_NAME=$(CONFIG_REPO_ROOT_NAME) .

push:
	docker push stevenjswanson/cse141pp-dev
	docker push stevenjswanson/cse141pp

