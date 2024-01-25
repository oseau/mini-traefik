SHELL := /usr/bin/env bash -o errexit -o pipefail -o nounset

log: ##p logs for prod
	@docker compose logs -f --tail 50 --since=1h

rsync: ## rsync to remote server
	@source .env && rsync -azvhP --exclude='.git/' $(shell pwd) $$DEST

start: ## (re)start docker compose
	@docker compose up --build --force-recreate -d
	@docker compose -f docker-compose.simple-service.yml up --build --force-recreate -d
	@if [ -f python.pid ]; then kill -9 `cat python.pid` && rm python.pid; fi
	@cd local && (python3 -m http.server 8080 > /dev/null 2>&1 & echo $$! > ../python.pid)

stop: ## stop docker compose and nc server
	@docker compose down
	@docker compose -f docker-compose.simple-service.yml down
	@if [ -f python.pid ]; then kill -9 `cat python.pid` && rm python.pid; fi
	@echo "Stopped python server."

MAKEFLAGS += --always-make
