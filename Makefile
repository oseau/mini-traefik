SHELL := /usr/bin/env bash -o errexit -o pipefail -o nounset

rsync: ## rsync to remote server
	@source .env && rsync -azvhP --exclude='.git/' $(shell pwd) $$DEST

start: ## (re)start docker compose
	@docker compose up --build --force-recreate -d
	@docker compose -f docker-compose.simple-service.yml up --build --force-recreate -d

.PHONY: rsync restart
