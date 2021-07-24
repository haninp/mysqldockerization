FROM mysql:8
ENV MYSQL_ROOT_PASSWORD=toor
COPY ./mysql-conf/conf.d /etc/mysql/conf.d
COPY ./initial.sql /docker-entrypoint-initdb.d