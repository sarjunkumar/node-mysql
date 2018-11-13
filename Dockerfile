FROM arjunkumarselvamani/mysql-node:2.0
LABEL maintainer="Arjun"
RUN chown -R mysql:mysql /var/lib/mysql /var/run/mysqld && \
    service mysql start
CMD ["/bin/bash"]
