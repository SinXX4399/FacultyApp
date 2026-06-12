# Makefile (in FacultyApp root)
.PHONY: help build up down logs shell clean test

help:
	@echo "Available commands:"
	@echo "  make build    - Build Docker images"
	@echo "  make up       - Start all services"
	@echo "  make down     - Stop all services"
	@echo "  make logs     - View logs"
	@echo "  make shell    - Access app container shell"
	@echo "  make clean    - Remove containers and volumes"
	@echo "  make test     - Run tests"

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

logs:
	docker-compose logs -f

shell:
	docker-compose exec app bash

clean:
	docker-compose down -v
	rm -rf backend/static/* backend/logs/* backend/media/*

test:
	docker-compose exec app pytest