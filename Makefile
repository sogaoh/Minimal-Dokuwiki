.PHONY: all clean


help:
		cat Makefile

up:
		docker-compose up -d

upb:
		docker-compose up -d --build

bd:
		docker-compose build

rbd:
		docker-compose build --no-cache

restart:
		docker-compose restart

down:
		docker-compose down

#clearex:
		#docker images -aq | xargs docker rmi -f
		#docker volume rm $(docker volume ls --filter dangling=true -q)


in:
		docker-compose exec dokuwiki ash
