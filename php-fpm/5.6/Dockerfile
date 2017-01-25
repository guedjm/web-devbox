FROM debian:jessie

RUN apt-get update && apt-get install -y php5-common php5-cli php5-fpm php5-mcrypt php5-mysql php5-gd php5-imagick php5-curl php5-intl php5-memcache php5-imap php5-dev php-pear php5-memcached

RUN sed -i 's/listen = \/var\/run\/php5-fpm.sock/listen = 0.0.0.0:9000/g' /etc/php5/fpm/pool.d/www.conf
RUN echo "clear_env = no" >> /etc/php5/fpm/pool.d/www.conf

ADD php.ini /etc/php5/fpm/php.ini

RUN usermod -u 1000 www-data

CMD ["php5-fpm", "-F"]

EXPOSE 9000
