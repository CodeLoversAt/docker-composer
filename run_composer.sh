#!/bin/bash

for i in $*;

do
    params=" $params $d$i"
done

mkdir -p $HOME/.composer
docker run -ti -v `pwd`:/srv -v $HOME/.composer:/root/.composer docker-composer $params
