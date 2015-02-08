# Docker HHVM + Composer

This dockerfile creates a container with [Composer](https://getcomposer.org/) run with [HHVM](http://hhvm.com/). It's based on a [blog article on marmelab blog](http://marmelab.com/blog/2014/09/10/make-docker-command.html).

## Installation

### a) Use the prepared container

1. load the container
    
    ```bash
    docker pull codelovers/docker-hhvm-composer
    ```
    
2. copy `run_composer.sh`

    ```bash
    wget -O ~/docker/run_composer.sh https://raw.githubusercontent.com/CodeLoversAt/docker-hhvm-composer/master/run_composer.sh
    ```
    
3.  in `run_composer.sh` replace the container name in line 10 with `codelovers/docker-hhvm-composer`.

    ```bash
    docker run -ti -v `pwd`:/srv -v $HOME/.composer:/root/.composer codelovers/docker-hhvm-composer $params
    ```
   
4. create an alias for conveniance

    ```bash
    alias "composer"="~/docker/run_composer.sh"
    ```
    
### b) Build on your own

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

## Usage

If you have created the alias from step 4, then it's just like normal:

    ```bash
    cd /path/to/project
    composer install
    ```
    
Otherwise use the path to `run_composer.sh`


    ```bash
    cd /path/to/project
    ~/docker/run_composer.sh install
    ```

## How to use it on Mac OS X?

Well, I'm glad you asked. Since docker runs in a VM on Mac OS, mounting volumes gets a little bit tricky. A detailed blog post will follow, but in short: use shared folders with your VM. By default the VM created by boot2docker already mounts `/Users` so you should be ready to mount anything underneath `/Users`.