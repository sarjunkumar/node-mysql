FROM node:9.11.2
LABEL maintainer="Arjun"

ENV MYSQL_USER=mysql \
    MYSQL_VERSION=5.6 \
    MYSQL_DATA_DIR=/var/lib/mysql \
    MYSQL_RUN_DIR=/run/mysqld \
    MYSQL_LOG_DIR=/var/log/mysql

RUN apt-get update \
    && sudo debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password password devops' \
    && sudo debconf-set-selections <<< 'mysql-server-5.6 mysql-server/root_password_again password devops' \
    && sudo apt-get -y install mysql-server-5.6
#RUN apt-get update \
# && DEBIAN_FRONTEND=noninteractive apt-get install -y mysql-server=${MYSQL_VERSION}* \
# && rm -rf ${MYSQL_DATA_DIR} \
# && rm -rf /var/lib/apt/lists/*

#COPY entrypoint.sh /sbin/entrypoint.sh

#RUN chmod 755 /sbin/entrypoint.sh

#EXPOSE 3306/tcp

#ENTRYPOINT ["/sbin/entrypoint.sh"]

CMD ["/usr/bin/mysqld_safe"]
