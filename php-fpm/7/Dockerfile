FROM debian:jessie

RUN apt-get update && apt-get install -y wget

RUN wget https://www.dotdeb.org/dotdeb.gpg
RUN apt-key add dotdeb.gpg

RUN echo "deb http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list
RUN echo "deb-src http://packages.dotdeb.org jessie all" >> /etc/apt/sources.list

RUN apt-get update && apt-get install -y php7.0-common php7.0-cli php7.0-fpm php7.0-mcrypt php7.0-mysql php7.0-gd php7.0-imagick php7.0-curl php7.0-intl php7.0-memcache php7.0-imap php-dev php-pear

ADD php.ini /etc/php/7.0/fpm/php.ini

RUN sed -i 's/listen = \/run\/php\/php7.0-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php/7.0/fpm/pool.d/www.conf
RUN echo "clear_env = no" >> /etc/php/7.0/fpm/pool.d/www.conf

RUN usermod -u 1000 www-data

CMD ["php-fpm7.0", "--nodaemonize"]

EXPOSE 9000
