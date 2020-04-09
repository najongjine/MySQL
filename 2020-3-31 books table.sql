-- books db에 table을 생성하기 위해 db open
use books;

create table  tbl_user(
userId varchar(20) primary key,
password varchar(125),
userName varchar(30),
userRolle varchar(10)
);