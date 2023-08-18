.PHONY: build run shell test deps clean

all: watch

build:
	docker-compose build

run:
	docker-compose up -d

shell:
	docker-compose exec app bash

iex:
	docker-compose exec app rlwrap -a iex --dot-iex ../.iex.exs

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

mount:
	sudo mount -t nfs mini2:/home/shinto/exercism ~/Exercism

umount:
	sudo umount ~/Exercism

next:
	exercism download --exercise=$(exercise) --track=elixir
