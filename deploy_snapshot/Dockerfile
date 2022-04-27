FROM nexell/fileserver-base

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

COPY deploy-file-server-snapshot.sh /usr/local/bin/deploySnapshots

RUN /usr/local/bin/deploySnapshots

VOLUME [ "/srv/snapshots.nexell.co.kr/www" ]
WORKDIR /srv/snapshots.nexell.co.kr/www

COPY snapshots.conf /etc/apache2/sites-available/snapshots.conf
COPY header.html /srv/snapshots.nexell.co.kr/linaro-license-protection/templates/header.html
RUN echo "Listen 8080" >> /etc/apache2/ports.conf

RUN a2enmod xsendfile
RUN a2enmod wsgi
RUN a2enmod ssl
RUN a2enmod proxy
RUN a2enmod proxy_balancer
RUN a2enmod proxy_http
RUN a2enmod rewrite
RUN a2enmod lbmethod_byrequests
RUN a2enmod slotmem_shm

RUN a2dissite 000-default
RUN a2ensite snapshots.conf

EXPOSE 8080

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
