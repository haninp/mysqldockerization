-- create basic schema with name basic_db
CREATE DATABASE basic_db;

-- create basic user
CREATE USER 'userapp'@'%' IDENTIFIED WITH mysql_native_password BY 'secret123';
CREATE USER 'userdb'@'localhost' IDENTIFIED WITH mysql_native_password BY 'secret123';
CREATE USER 'repl_user'@'%' IDENTIFIED WITH mysql_native_password BY 'secret123';
CREATE USER 'monitor'@'%' IDENTIFIED WITH mysql_native_password BY 'monitor123';

-- grant basic user
GRANT ALL PRIVILEGES ON * . * TO 'userapp'@'%';
GRANT ALL PRIVILEGES ON * . * TO 'userdb'@'localhost';
GRANT REPLICATION SLAVE ON *.* TO 'repl_user'@'%';
GRANT REPLICATION CLIENT ON *.* TO 'repl_user'@'%';
GRANT SUPER ON *.* TO 'repl_user'@'%' IDENTIFIED WITH mysql_native_password BY 'secret123';
GRANT REPLICATION SLAVE ON *.* TO 'monitor'@'%';
GRANT REPLICATION CLIENT ON *.* TO 'monitor'@'%';
GRANT SUPER ON *.* TO 'monitor'@'%' IDENTIFIED WITH mysql_native_password BY 'monitor123';

-- flush config
FLUSH PRIVILEGES;