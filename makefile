include .env

APP_NAME ?= $(shell grep -w TARGETS .env | cut -d '=' -f2)
PORT ?= $(shell grep -w PORT .env | cut -d '=' -f2)

#run_dev:
#	ngrok http $(PORT)
init:
	rm -f go.mod
	rm -f go.sum
	go mod init $(APP_NAME)
	go mod tidy
	go run . artisan key:generate


build:
	go build -o build/$@ main.go


run:
	go run . --env=./.env


.PHONY: build

