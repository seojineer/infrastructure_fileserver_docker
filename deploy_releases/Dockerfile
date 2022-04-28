FROM seojikim/fileserver-base

ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_LOG_DIR /var/log/apache2
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2

RUN mkdir -p $APACHE_RUN_DIR $APACHE_LOCK_DIR $APACHE_LOG_DIR

COPY deploy-file-server-releases.sh /usr/local/bin/deployReleases

RUN /usr/local/bin/deployReleases

VOLUME [ "/srv/releases.nexell.co.kr/www" ]
WORKDIR /srv/releases.nexell.co.kr/www

COPY releases.conf /etc/apache2/sites-available/releases.conf
COPY header.html /srv/releases.nexell.co.kr/linaro-license-protection/templates_releases/header.html
RUN echo "Listen 8090" >> /etc/apache2/ports.conf

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
RUN a2ensite releases.conf

EXPOSE 8090

CMD ["/usr/sbin/apache2ctl", "-D", "FOREGROUND"]
