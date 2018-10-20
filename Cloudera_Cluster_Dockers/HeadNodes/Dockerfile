## INSTALL CENTOS
FROM centos:6.9

## INSTALL JDK 7
RUN yum update -y 
RUN yum install -y  java-1.7.0-openjdk*

## MISCELANEOUS PACKAGES 
RUN yum update -y
RUN yum install  -y nano
RUN yum install  -y sudo 
RUN yum -y install openssh-server; yum -y install openssh-clients
RUN yum install -y wget 
RUN yum install -y tar.x86_64 
RUN yum clean all

## INSTALL PYTHON RELATED PACKAGES

RUN yum -y update; yum clean all
RUN yum -y install python-devel
RUN yum -y install epel-release; yum clean all
RUN yum -y install python-pip; yum clean all
RUN wget https://bootstrap.pypa.io/2.6/get-pip.py
RUN python get-pip.py
RUN yum install -y zlib-devel
RUN yum install -y bzip2-devel
RUN yum install -y openssl-devel
RUN yum install -y ncurses-devel
RUN yum install -y sqlite-devel
RUN yum install -y readline-devel
RUN yum install -y tk-devel
RUN yum install -y gdbm-devel
RUN yum install -y db4-devel
RUN yum install -y libpcap-devel
RUN yum install -y xz-devel
RUN yum install -y expat-devel
RUN yum install -y postgresql-libs
RUN yum install -y python-psycopg2

# INSTALL MYSQL DATABASE

RUN yum install -y mysql-server
COPY create_databases.sql /var/lib/mysql

## COPY CLOUDERA REPO FILE
WORKDIR "/root"
RUN wget https://archive.cloudera.com/cm5/redhat/6/x86_64/cm/cloudera-manager.repo && \
cp cloudera-manager.repo /etc/yum.repos.d/

## INSTALL CLOUDERA MANAGER SERVER PACKAGES
RUN yum -y install openssl;yum -y install openssl-devel;yum -y install gcc;yum -y install sqlite-devel
RUN yum clean all
RUN yum install -y cloudera-manager-daemons cloudera-manager-server cloudera-manager-server-db-2 cloudera-manager-agent

## CHANGE PASSWORD FOR root user
RUN echo "admin" |passwd root --stdin

## CREATE DATABASES IN MYSQL 
RUN wget https://dev.mysql.com/get/Downloads/Connector-J/mysql-connector-java-5.1.45.tar.gz
RUN tar zxvf mysql-connector-java-5.1.45.tar.gz
RUN sudo mkdir -p /usr/share/java/
RUN sudo cp mysql-connector-java-5.1.45/mysql-connector-java-5.1.45-bin.jar /usr/share/java/mysql-connector-java.jar
RUN sudo service mysqld start && sudo service mysqld stop
RUN sudo /sbin/chkconfig mysqld on
COPY create_databases.sql /etc/create_databases.sql
COPY my.cnf /etc/my.cnf
RUN sudo service mysqld start && \
mysql -e "UPDATE mysql.user SET Password = PASSWORD('admin') WHERE User = 'root'" && \
mysql -e "FLUSH PRIVILEGES" && \
mysql -h "localhost" -u "root" "-padmin" < "/etc/create_databases.sql"

CMD ["/bin/bash"]

