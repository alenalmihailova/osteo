#!/bin/bash
git pull
docker stop $(docker ps -q)
docker rm $(docker ps -a -q)
docker rmi $(docker images -q)
docker build . -t osteo:latest
docker run -d -p 8080:8080 osteo:latest