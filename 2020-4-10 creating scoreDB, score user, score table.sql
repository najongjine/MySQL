-- socreDB, score user
-- secure DB schema 생성
create database scoreDB;

drop user 'secure'@'localhost';
-- 사용자 등록
create user 'score'@'localhost' identified by 'score';

-- 권한 부여
grant all privileges on *.* to 'score'@'localhost';

-- schema open
use scoreDB;

create table tbl_student(
st_num bigint primary key auto_increment,
st_name nvarchar(50),
st_class int,
st_group nvarchar(50)
);

drop table tbl_score;
create table tbl_score(
s_id bigint primary key auto_increment,
s_num bigint,
s_subject nvarchar(50),
s_score int,
unique key(s_num,s_subject)
);