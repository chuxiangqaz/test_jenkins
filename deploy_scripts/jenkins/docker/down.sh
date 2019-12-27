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

IMAGE_NAME=${DOCKER_IMAGE%:*}
container_id=$(docker ps | grep $PROJECT | awk '{print $1}')
if [ $container_id ]; then
    docker-compose down
fi

# 清理镜像
images_id=$(docker images | grep $IMAGE_NAME | awk '{print $3}')
if [ "$images_id" ]; then
    for i in $images_id;
    do
       docker rmi $i
    done
fi
