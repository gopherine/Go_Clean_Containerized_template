# Load environment variables from .env
include .env
export

# Default values if not provided in .env
DOCKER_ENV ?= Dockerfile.dev

.PHONY: all build up down restart logs build_dev build_prod build_debug

all: build up

build:
	@echo "Building Docker containers with ${DOCKER_ENV}..."
	DOCKER_ENV=$(DOCKER_ENV) docker-compose build

up:
	@echo "Starting Docker containers..."
	DOCKER_ENV=$(DOCKER_ENV) docker-compose up -d

down:
	@echo "Stopping Docker containers..."
	docker-compose down

restart: down up

logs:
	@echo "Showing logs..."
	docker-compose logs -f

# Targets for specific environments
build-dev:
	@echo "Building development environment..."
	$(MAKE) DOCKER_ENV=Dockerfile.dev build

build-prod:
	@echo "Building production environment..."
	$(MAKE) DOCKER_ENV=Dockerfile build

build-debug:
	@echo "Building debugging environment..."
	$(MAKE) DOCKER_ENV=Dockerfile.debug build