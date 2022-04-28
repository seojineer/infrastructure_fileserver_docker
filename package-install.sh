#!/bin/bash

mkdir -p /srv/releases.nexell.co.kr

chown nexell:www-data /srv/releases.nexell.co.kr
chmod 775 /srv/releases.nexell.co.kr

cd /srv/releases.nexell.co.kr
#git clone http://git.nexell.co.kr:8081/gerrit/nexell/infrastructure/linaro-license-protection.git
#git clone http://git.nexell.co.kr:8081/gerrit/nexell/infrastructure/linaro-license-protection-configs.git configs
git clone https://github.com/seojineer/infrastructure_server_linaro-license-protection.git
git clone https://github.com/seojineer/infrastructure_server_linaro-license-protection-configs.git
mv infrastructure_server_linaro-license-protection linaro-license-protection
mv infrastructure_server_linaro-license-protection-configs configs
cd linaro-license-protection
pip install -r requirements.txt

cp -a /srv/releases.nexell.co.kr /srv/snapshots.nexell.co.kr
