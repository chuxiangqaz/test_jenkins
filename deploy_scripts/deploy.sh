#! /bin/bash

cd $WORKSPACE

#############################
# profile   表示部署的环境 dev test prod
# project   项目名，将作为容器名以及宿主主机目录
# ssh_host  使用 SSH 登陆的远程主机 www@127.0.0.1
# port      需要映射的端口，默认映射相同
# images_id 镜像的Image，带 TAG
#############################
profile=$1
project=$2
ssh_host=$3
port=$4
images_id=$5

deploy_dir="/data/apps/$project"
# 创建项目目录
ssh $ssh_host "mkdir -p $deploy_dir"


# 拷贝文件
scp $WORKSPACE/deploy_scripts/jenkins/docker/{docker-compose.yml,down.sh,startup.sh} $ssh_host:$deploy_dir

ssh $ssh_host "cd $deploy_dir && chmod +x *.sh"

# 停止容器
ssh $ssh_host "cd $deploy_dir && ./down.sh $profile $project $port $images_id $deploy_dir"

# 启动docker
ssh $ssh_host "cd $deploy_dir && ./startup.sh $profile $project $port $images_id $deploy_dir"

