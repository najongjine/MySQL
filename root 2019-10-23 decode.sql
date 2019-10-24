-- root
-- 기본적으로 root이 활성화 되있음.
-- mysql server가 원격 접속이 차단 되 있음.
-- schema 개념이 database 라는 것으로 집중이 되있음.
-- DB가 물리적, 논리적(개념)을 같은 의미로 사용된다.

-- 1. login(root)절차를 수행하고
-- 2. 사용할 DB를 open 수행해야한다.
--  현재 사용가능한 DB를 확인하는 명령들.
show databases;

create database myDB_1;

-- DB open(접속)
-- mysql에서 DB는 사용자와 연관성이 oracle에 비해 느슨하다
-- 권한만 있으면 어떤 DB에 접속하여 다양한 SQL 명령을 수행할수 있다.
use myDB;

show tables;

create table tbl_score(
s_id	INT		PRIMARY KEY	AUTO_INCREMENT,
s_std	nVARCHAR(50)	NOT NULL		,
s_subject	nVARCHAR(50)	NOT NULL	,	
s_score	INT(3)	NOT NULL		,
s_rem	nVARCHAR(50)			

);
desc tbl_score;

insert into tbl_score(s_std,s_subject,s_score)
values('홍길동','과학',80);
select * from tbl_score;
delete from tbl_score
where s_id>100;

-- auto increament로 지정된 칼럼은 한번 최대값이 지정되고 나면
-- 중간의 값들을 삭제하더라도
-- 최대값보다 큰 값들이 생성되어 기존의 값을 재활용 하지 않다.

select s_std, sum(s_score)
from tbl_score;

select s_std,
case when s_subject='국어' then s_score else 0 end as 국어,
case when s_subject='국어' then s_score else 0 end as 수학
from tbl_score
group by s_std;

select s_std,
sum(if(s_std='국어',s_score,0)) as 국어,
sum(if(s_std='영어',s_score,0)) as 영어,
sum(if(s_std='수학',s_score,0)) as 수학,
sum(s_score) as 총점,
round(avg(s_score),1) as 평균
from tbl_score;

select s_std,
sum(if(s_std='국어',s_score,0)) as 국어,
sum(if(s_std='영어',s_score,0)) as 영어,
sum(if(s_std='수학',s_score,0)) as 수학,
sum(s_score) as 총점,
truncate(avg(s_score),0) as 평균
from tbl_score;

update tbl_score
set s_score=20
where s_id=3;
select * from tbl_score;

create table tbl_score2(
s_id	INT		PRIMARY KEY	AUTO_INCREMENT,
s_std	nVARCHAR(5)	NOT NULL		,
s_subject	nVARCHAR(5)	NOT NULL	,	
s_score	INT(3)	NOT NULL		,
s_rem	nVARCHAR(50)			
);
create table tbl_subject(
sb_code	varchar(5)		PRIMARY KEY	,
sb_name	nVARCHAR(20)	NOT NULL		,
sb_pro	nVARCHAR(20)			
);
drop table tbl_subject;
insert into tbl_score2(s_std,
s_subject,
s_score)
values('S0001','B0001',90);
insert into tbl_score2(s_std,
s_subject,
s_score)
values('S0001','B0002',90);
insert into tbl_score2(s_std,
s_subject,
s_score)
values('S0001','B0003',80);
insert into tbl_score2(s_std,
s_subject,
s_score)
values('S0001','B0004',70);
select * from tbl_score2;
delete from tbl_score2
where s_id>4;

insert into tbl_subject(sb_code,sb_name)
values('B0001','국어');
insert into tbl_subject(sb_code,sb_name)
values('B0002','영어');
insert into tbl_subject(sb_code,sb_name)
values('B0003','수학');
insert into tbl_subject(sb_code,sb_name)
values('B0004','과학');
select * from tbl_subject;

select * from tbl_score2 as SC,tbl_subject as SB
where sc.s_subject=sb.sb_code;
select s_id,s_std,s_subject,sb_name,s_score
 from tbl_score2 as SC,tbl_subject as SB
where sc.s_subject=sb.sb_code;

select s_id,s_std,s_subject,sb_name,s_score
 from tbl_score2 as SC
 left join tbl_subject as SB
on sc.s_subject=sb.sb_code;

create view view_score as (
select s_id as id,
s_std as 학번,
s_subject as 과목코드,
sb_name as 과목명,
s_score as 점수view_score
 from tbl_score2 as SC
 left join tbl_subject as SB
on sc.s_subject=sb.sb_code);

alter table tbl_score2 modify s_subject varchar(5) not null;
-- score table과 subject table 간에는
-- 잠초무결성 관계가 유지되고 있다.
-- 참조무결성을 강제조항으로 설정하자.
alter table tbl_score2 
add constraint fk_score_subject
foreign key(s_subject)
references tbl_subject(sb_code);