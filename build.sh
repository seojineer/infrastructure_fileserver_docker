#!/bin/sh

docker pull ubuntu:16.04
docker build -t nexell/fileserver-base .

cd deploy_releases
docker build -t nexell/fileserver-releases .

cd deploy_snapshot
docker build -t nexell/fileserver-snapshot .
