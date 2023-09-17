.PHONY: build run shell test deps clean

all: watch

build:
	docker-compose build

start: run
	
run:
	docker-compose --compatibility up -d

shell:
	docker-compose exec app bash

iex:
	docker-compose exec app rlwrap -a iex --dot-iex ../.iex.exs

test:
	docker-compose exec -w /exercism/$(exercise) app mix test #--exclude task_id --include task_id:1 #--include task_id:2 --include task_id:3 --include task_id:4

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
	./download.sh
