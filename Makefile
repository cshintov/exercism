.PHONY: build run shell test deps clean

all: watch

build:
	docker-compose build

run:
	docker-compose up

shell:
	docker-compose exec app bash

iex:
	docker-compose exec app rlwrap -a iex

test:
	docker-compose exec -w /exercism/$(exercise) app mix test

deps:
	docker-compose run -w /exercism/$(exercise) app mix deps.get

clean:
	docker-compose down

submit:
	exercism submit $(language)/$(exercise)/lib/$(ex_file).ex

watch:
	fswatch -o elixir/$(exercise) | xargs -n1 -I{} script -q /dev/null make test


