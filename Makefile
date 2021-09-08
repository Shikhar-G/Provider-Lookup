.DEFAULT_GOAL := all
MAKEFLAGS += --no-builtin-rules
SHELL         := bash

all: database run

database:
	./scripts/pull_data.sh
	./scripts/run_psql.sh -d provider_lookup -e -f sql/all.sql
	python3 scripts/generate_secret.py
	python3 web/manage.py migrate

run:
	python3 web/manage.py runserver