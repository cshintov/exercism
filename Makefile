.PHONY: build run shell test deps clean

build:
	docker-compose build

run:
	docker-compose up

shell:
	docker-compose exec app bash

test:
	docker-compose exec -w /exercism/$(exercise) app mix test

deps:
	docker-compose run -w /exercism/$(exercise) app mix deps.get

clean:
	docker-compose down

submit:
	exercism submit $(language)/$(exercise)/lib/$(ex_file).ex
