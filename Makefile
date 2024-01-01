include .env

SHELL := /usr/bin/env bash -o errexit -o pipefail -o nounset
CURRENTDIR := $(shell pwd)

rsync: ## rsync to remote server
	@rsync -azvhP $(CURRENTDIR)/Makefile $(CURRENTDIR)/.env $(CURRENTDIR)/docker-compose.yml $(DEST)

start: ## (re)start docker compose
	@docker compose up -d

.PHONY: rsync restart
