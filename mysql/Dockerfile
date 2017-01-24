FROM mysql:latest

ADD config/my.cnf /etc/mysql/
RUN chmod o-w /etc/mysql/my.cnf

RUN chown -R mysql:mysql /var/lib/mysql/
RUN usermod -u 1000 mysql

CMD ["mysqld"]
