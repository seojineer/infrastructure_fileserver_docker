#!/bin/sh

docker pull ubuntu:16.04
docker build -t seojikim/fileserver-base .

cd deploy_releases
docker build -t seojikim/fileserver-releases .

cd ../deploy_snapshot
docker build -t seojikim/fileserver-snapshot .
