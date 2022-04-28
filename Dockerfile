FROM seojikim/ubuntu16-04

RUN apt-get update && apt-get install --yes libapache2-mod-xsendfile libapache2-mod-python python-django python-django-auth-openid
RUN apt-get update && apt-get install --yes python-apache-openid libapache2-mod-wsgi uwsgi-plugin-python python-pip git apache2 vim wget
RUN apt-get update && apt-get install --yes libapache2-mod-xsendfile libapache2-mod-wsgi
RUN pip install --upgrade pip
RUN pip install south textile BeautifulSoup requests

COPY package-install.sh /usr/local/bin/pkginstall

RUN /usr/local/bin/pkginstall
