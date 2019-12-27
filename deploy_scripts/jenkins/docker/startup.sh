#!/usr/bin/env bash

#############################
# profile       表示部署的环境 dev test prod
# project       项目名，将作为容器名以及宿主主机目录
# port          需要映射的端口，默认映射相同
# docker_images images 名字
# app_dir       宿主主机项目所在目录
#############################
export PROFILE=$1
export PROJECT=$2
export PORT=$3
export DOCKER_IMAGE=$4
export APP_DIR=$5

docker-compose up -d