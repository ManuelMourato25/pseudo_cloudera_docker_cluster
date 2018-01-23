create database amon DEFAULT CHARACTER SET utf8;
create database rman DEFAULT CHARACTER SET utf8;
create database metastore DEFAULT CHARACTER SET utf8;
create database hue DEFAULT CHARACTER SET utf8;
create database oozie DEFAULT CHARACTER SET utf8;

grant all on amon.* TO 'root'@'%' IDENTIFIED BY 'admin';
grant all on rman.* TO 'root'@'%' IDENTIFIED BY 'admin';
grant all on metastore.* TO 'root'@'%' IDENTIFIED BY 'admin';
grant all on hue.* TO 'root'@'%' IDENTIFIED BY 'admin';
grant all on oozie.* TO 'root'@'%' IDENTIFIED BY 'admin';
