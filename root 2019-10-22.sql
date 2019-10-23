-- MySQL 과 Oracle의 차이점
/*
Database		TableSpace
*/
-- mySQL의 database를 사용하겠다.
use mysql;
show tables;

create database myDB;
use myDB;

-- auto_increment는 int형 PK에 설정함.
-- 정수형으로 1부터 일련번호를 자동으로 설정함.
-- 정수형은 최대 11자리까지 저장.
create table tbl_test(
id int primary key auto_increment,
name nvarchar(50) not null,
tel varchar(20),
addr nvarchar(125)
);
describe tbl_test;
insert into tbl_test(id,name)
values(0,'홍길동');
select * from tbl_test
where name like '%홍%';
select 'aa'+'bb';