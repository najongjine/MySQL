-- secure DB schema 생성
create database secure;

drop user 'secure'@'localhost';
-- 사용자 등록
create user 'secure'@'localhost' identified by 'secure';

-- 권한 부여
grant all privileges on *.* to 'secure'@'localhost';

select username,password,enabled from users where username=?;

-- schema open
use secure;
create table users(
id bigint  primary key auto_increment,
username varchar(50),
password varchar(125),
enabled boolean
);
drop table tbl_users;
create table tbl_users(
id bigint  primary key auto_increment,
user_name varchar(50) unique,
user_pass varchar(125),
enabled boolean
);

select username,authority from authorities where username=?;
create table authorities(
id bigint  primary key auto_increment,
username varchar(50),
authority varchar(50)
);