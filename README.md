# eos-docker

[![Build Status](https://travis-ci.org/nanmu42/eos-docker.svg?branch=master)](https://travis-ci.org/nanmu42/eos-docker)

EOS docker image for mainnet production.

[Docker image](https://hub.docker.com/r/nanmu42/eos/) is built and pushed to Docker Hub by Travis CI directly.

# Usage

```bash
# clone
git clone https://github.com/nanmu42/eos-docker.git
cd eos-docker

# modify config.ini if you need
nano config.ini

# run!
docker volume create --name=nodeos-data-volume
docker volume create --name=keosd-data-volume
docker-compose up -d
```

# Supported Version

| version |                              build                              |      docker pull     |
|:-------:|:---------------------------------------------------------------:|:--------------------:|
| v1.1.3  | [#11](https://travis-ci.org/nanmu42/eos-docker/builds/412474668) | `nanmu42/eos:v1.1.3` |
| v1.1.2  | [#10](https://travis-ci.org/nanmu42/eos-docker/builds/411132897) | `nanmu42/eos:v1.1.2` |
| v1.1.1  | [#9](https://travis-ci.org/nanmu42/eos-docker/builds/408078022) | `nanmu42/eos:v1.1.1` |
| v1.1.0  | [#8](https://travis-ci.org/nanmu42/eos-docker/builds/405639870) | `nanmu42/eos:v1.1.0` |
| v1.0.10  | [#6](https://travis-ci.org/nanmu42/eos-docker/builds/404748634) | `nanmu42/eos:v1.0.10` |
| v1.0.9  | [#5](https://travis-ci.org/nanmu42/eos-docker/builds/402543083) | `nanmu42/eos:v1.0.9` |
| v1.0.8  | [#4](https://travis-ci.org/nanmu42/eos-docker/builds/401471073) | `nanmu42/eos:v1.0.8` |
