bash:
	docker-compose run --rm graphql /bin/bash

setup:
	docker network create rabbitmq_network || true
	docker-compose build --target dev
	docker-compose run --rm graphql bash -c "bundler install"

run:
	docker-compose up

down:
	docker-compose down --remove-orphans