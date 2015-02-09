#!/bin/bash

mkdir -p $HOME/.composer
docker run -ti -v $(pwd):/srv -v $HOME/.composer:/root/.composer docker-composer $@
