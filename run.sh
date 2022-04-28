#!/bin/bash

docker run -d --name con_releases_server -p 8090:8090 --env TZ=Asia/Seoul -v /home/snapshot/snapshot_mnt/releases:/srv/releases.test.co.kr/www seojikim/fileserver-releases

docker run -d --name con_snapshot_server -p 8080:8080 --env TZ=Asia/Seoul -v /home/snapshot/snapshot_mnt/snapshot:/srv/snapshots.test.co.kr/www seojikim/fileserver-snapshot
