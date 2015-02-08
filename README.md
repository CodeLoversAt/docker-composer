# Docker HHVM + Composer

This dockerfile creates a container with [Composer](https://getcomposer.org/) run with [HHVM](http://hhvm.com/). It's based on a [blog article on marmelab blog](http://marmelab.com/blog/2014/09/10/make-docker-command.html).

## Usage

1. clone this repo

    ```bash
    git clone https://github.com/CodeLoversAt/docker-hhvm-composer.git
    ```
    
2. build the container

    ```bash
    cd docker-hhvm-composer
    docker build -t docker-composer .
    ```
    
3. put the `run_composer.sh` somewhere.

   ```bash
   cp run_composer.sh ~/docker
   ```
   
4. create an alias for conveniance

    ```bash
    alias "composer"="~/docker/run_composer.sh"
    ```