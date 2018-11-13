FROM node:9.11.2
LABEL maintainer="Arjun"
RUN apt-get update
RUN apt-get install debconf-utils
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server-5.6 mysql-community-server/root-pass password root'"]
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-server-5.6 mysql-community-server/re-root-pass password root'"]
RUN apt-get -y install mysql-server-5.6
CMD ["/bin/bash"]
