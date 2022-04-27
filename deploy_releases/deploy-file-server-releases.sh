#!/bin/bash

TYPE="releases"

echo "=================================================="
echo "       deploy file-server for ${TYPE}"
echo "=================================================="

DIR=${TYPE}.nexell.co.kr

echo "Setup DB ---->"
export PYTHONPATH=/srv/${DIR}:/srv/${DIR}/linaro-license-protection:/srv/${DIR}/configs/django
export DJANGO_SETTINGS_MODULE="settings_${TYPE}"
mkdir -p /srv/${DIR}/db
chown nexell:www-data /srv/${DIR}/db
chmod 775 /srv/${DIR}/db
django-admin.py syncdb --noinput
django-admin.py collectstatic --noinput
chown -R nexell:www-data /srv/${DIR}/linaro-license-protection
chown -R nexell:www-data /srv/${DIR}/configs
chmod 664 /srv/${DIR}/db/licenses.db
chown nexell:www-data /srv/${DIR}/db/licenses.db
echo "end"

mkdir -p /srv/${DIR}/www
chown www-data:www-data /srv/${DIR}/www

echo "Setup apache2 ---->"
cp -a /srv/${DIR}/configs/apache/${TYPE}.conf /etc/apache2/sites-available
echo "end"
