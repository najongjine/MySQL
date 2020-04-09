-- secure DB schema 생성
create database secure;

-- 사용자 등록
create user 'secure'@'localhost' identified by 'secure';

-- 권한 부여
grant all privileges on *.* to 'secure'@'locahlhost';

select username,password,enabled from users where username=?;

-- schema open
use secure;
create table users(
id bigint  primary key auto_increment,
username varchar(50),
password varchar(125),
enabled boolean
);