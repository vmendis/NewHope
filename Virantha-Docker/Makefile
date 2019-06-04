# Inspired by : https://gist.github.com/mpneuried/0594963ad38e68917ef189b4e6a269db


# import config.
# You can change the default config with `make cnf="config_special.env" build`
cnf ?= config.env
include $(cnf)
export $(shell sed 's/=.*//' $(cnf))

# import deploy config
# You can change the default deploy config with `make cnf="deploy_special.env" release`
dpl ?= deploy.env
include $(dpl)
export $(shell sed 's/=.*//' $(dpl))

# grep the version from the mix file
VERSION=$(shell ./version.sh)

# HELP
# This will output the help for each task
# thanks to https://marmelab.com/blog/2016/02/29/auto-documented-makefile.html
.PHONY: help

help: ## This help.
#	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "\033[36m%-30s\033[0m %s\n", $$1, $$2}' $(MAKEFILE_LIST)
	@awk 'BEGIN {FS = ":.*?## "} /^[a-zA-Z_-]+:.*?## / {printf "%-30s   %s\n", $$1, $$2}' $(MAKEFILE_LIST)

.DEFAULT_GOAL := help

# DOCKER TASKS
# List docker repository
list: ## List docker repository
	docker images

lista: ## List docker repository
	docker images -a

build: ## Build the container
	docker build -t $(APP_NAME) .

build-nc: ## Build the container without caching
	docker build --no-cache -t $(APP_NAME) .


remove:  ## Remove docker image (latest) as defined in deploy.env
	docker rmi $(APP_NAME)

run: ## Run container on port configured in `config.env`
	docker run -i -t --rm --env-file=./config.env -p=$(PORT):$(PORT) --name="$(APP_NAME)" $(APP_NAME)

runsh: ## Run container on port configured in `config.env` with sh
	docker run -i -t --rm --env-file=./config.env -p=$(PORT):$(PORT) --name="$(APP_NAME)" $(APP_NAME) sh

up: build run ## Run container on port configured in `config.env` (Alias to run)

stop: ## Stop and remove a running container
	docker stop $(APP_NAME); docker rm $(APP_NAME)

# Containers

ps:  ## List containers
	docker ps

psa:  ## List all containers
	docker ps -a

# Docker tagging
# tag: tag-latest tag-version ## Generate container tags for the `{version}` ans `latest` tags

#tag-latest: ## Generate container `{version}` tag
#@echo 'create tag latest'
#docker tag $(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):latest


tag-version: ## Generate container `latest` tag
	@echo 'create tag $(VERSION)'
#	docker tag $(APP_NAME) $(DOCKER_REPO)/$(APP_NAME):$(VERSION)
	docker tag $(APP_NAME) $(APP_NAME):$(VERSION) 

# Docker system maintenance


prune:  ## remove dangling images
	   docker system prune 

nuke:  ## Wholesale clean !!
	   docker system prune --all --volumes



version: ## Output the current version
	@echo $(VERSION)

rm:   ## Remove latest
	docker rmi $(APP_NAME) 

