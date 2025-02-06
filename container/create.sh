#!/bin/bash
# DevVM Install Script

echo "Enter all variables in .env file!"
echo "MEDIAPATH, DOCKERPATH, JCPUS, JMEMORY"


echo "Done, variables written to .env!"

for app in $(cat apps2install.txt )
do
   docker compose -f ./$app/docker-compose.yaml --env-file ./.env up -d
done
