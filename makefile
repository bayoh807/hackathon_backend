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

gen:
	gentool --dsn="loadmin:Tapgo53754718@tcp(leorano-db-uat.cqic4mwjclcw.ap-northeast-1.rds.amazonaws.com:3306)/leorano-uat?charset=utf8mb4&parseTime=True" \
	-fieldNullable -fieldWithIndexTag -fieldWithTypeTag -outPath "internal/pkg/db" -tables "" -fieldSignable

run:
	go run . --env=./.env


.PHONY: build

