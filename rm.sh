#!/bin/bash

if [ -z "$(docker ps -aq)" ]; then
        echo "Nada a remover"
else
        docker rm -f $(docker ps -aq)
fi