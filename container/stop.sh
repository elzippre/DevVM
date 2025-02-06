#!/bin/bash
# DevVM Stop Script


for app in $(cat apps2install.txt )
do
   docker compose -f ./$app/docker-compose.yaml --env-file ./.env down
done


