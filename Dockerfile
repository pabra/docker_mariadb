FROM mariadb:10.1

ENV MYSQL_ALLOW_EMPTY_PASSWORD=yes

ADD set_root_password.sh /docker-entrypoint-initdb.d/

RUN ln -s /var/lib/mysql/.my.cnf /root/
