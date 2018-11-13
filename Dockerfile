FROM node:9.11.2
LABEL maintainer="Arjun"
RUN apt-get update
RUN apt-get install debconf-utils
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-community-server mysql-community-server/root-pass password root'"]
RUN ["/bin/bash", "-c", "debconf-set-selections <<< 'mysql-community-server mysql-community-server/re-root-pass password root'"]
RUN apt-get -y install mysql-community-server
CMD ["/bin/bash"]
