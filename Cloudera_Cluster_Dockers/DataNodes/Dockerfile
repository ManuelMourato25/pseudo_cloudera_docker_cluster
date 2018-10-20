## INSTALL CENTOS
FROM centos:6.9

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

## CHANGE PASSWORD FOR root user
RUN echo "admin" |passwd root --stdin

CMD ["/bin/bash"]


