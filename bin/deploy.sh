#!/bin/bash
DIST_FILES_LIST=$(ls -A1 /home/ec2-user/build/dist)
DIST_FOLDER=/home/ec2-user/build/dist
echo "> 3-tier-web 파일 리스트" >> /home/ec2-user/deploy.log
echo "$DIST_FILES_LIST" >> /home/ec2-user/deploy.log

echo "> dist 파일 복사" >> /home/ec2-user/deploy.log
TOMCAT_HOME_PATH=/var/www/html/
sudo cp -rf $DIST_FOLDER/* $TOMCAT_HOME_PATH
