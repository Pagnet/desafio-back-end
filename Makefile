SHELL := /bin/bash # Use bash syntax

rc:
	docker exec -it $(docker ps | grep -E "web" | awk '{print $1}') bash -c "rails c"

dev:
	docker exec -it $(docker ps | grep -E "web" | awk '{print $1}') sh

up:
	docker-compose run  --service-ports --rm web bash

stop:
	docker-compose stop

down:
	docker-compose down
