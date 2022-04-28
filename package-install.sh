#!/bin/bash

mkdir -p /srv/releases.test.co.kr

chown test:www-data /srv/releases.test.co.kr
chmod 775 /srv/releases.test.co.kr

echo test
cd /srv/releases.test.co.kr
git clone https://github.com/seojineer/infrastructure_server_linaro-license-protection.git
git clone https://github.com/seojineer/infrastructure_server_linaro-license-protection-configs.git
mv infrastructure_server_linaro-license-protection linaro-license-protection
mv infrastructure_server_linaro-license-protection-configs configs
cd linaro-license-protection
pip install -r requirements.txt

cp -a /srv/releases.test.co.kr /srv/snapshots.test.co.kr
