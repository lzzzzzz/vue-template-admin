#服务器环境：os:centos7 software:git、nodejs、docker-compose
#/bin/bash
git pull git@github.com:lzzzzzz/vue-template-admin.git
npm install
npm run build:prod
docker-compose down template-nginx-app
docker-compose rm template-nginx-app
rm -rf ./docker-nginx
mkdir ./docker-nginx
mkdir ./docker-nginx/conf.d
mkdir ./docker-nginx/www
mkdir ./docker-nginx/logs
#拷贝编译后执行文件
cp ./dist/* ./docker-nginx/www
#拷贝nginx配置文件
cp ./nginx.conf ./docker-nginx/conf.d
#启动容器
docker-compose up -d&
