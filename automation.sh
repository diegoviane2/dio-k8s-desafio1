#!/bin/bash

echo "[ CRIANDO IMAGENS ... ]"

docker build -t viane/backend:1.0 backend/.
docker build -t viane/database:1.0 database/.


echo "[ REALIZANDO PUSH DAS IMAGENS ... ]"

docker push viane/backend:1.0
docker push viane/database:1.0

echo "[ CRIANDO SERVIÇOS NO CLUSTER ... ]"

kubectl apply -f ./services.yml

echo "[ CRIANDO DEOLOYMENTS NO CLUSTER ... ]"

kubectl apply -f ./deployment.yml

