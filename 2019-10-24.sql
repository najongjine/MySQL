-- FK,참조무결성:= 2개 이상의 테이블을 EQ JOin을 실행했을때
-- 연관 정보가 원하는 모든 데이터가 보여진다.
-- FK 설정되는 Table은 1:N 관계로 설정
--  FK 지정하여 테이블을 생성할때 engine 옵션을 추가해주는것이 좋다.
-- chracter set을 통일시켜주어야 한다.

-- FK 설정하기 위해서
-- 칼럼들은 Type, 크기가 동일해야 된다.
-- 1:N 일때 1에 해당하는 table의 칼럼은 반드시 PK로 선언해야 한다.
-- N에 해당하는 칼럼은 not null
-- N은 child, 1은 parent
/*
create table ...(
) engine= InnoDB character set='UTF-8';
*/
use myDB;

desc tbl_score2;
/*
s_id	int(11)	NO	PRI	
s_std	varchar(5)	NO		
s_subject	varchar(5)	NO	MUL	
s_score	int(3)	NO		
s_rem	varchar(50)	YES		
*/

desc tbl_subject;
/*
sb_code	varchar(5)
sb_name	varchar(20)
sb_pro	varchar(20)
*/

-- N 테이블에 대해서 alter를 수행하고
-- 1의 테이블을 references로 설정
alter table tbl_score2
add constraint fk_01
foreign key (s_subject)
references tbl_subject(sb_code);

alter table tbl_score2
drop foreign key fkscore;

select * from information_schema.table_constraints
where table_name='tbl_score2';

-- FK로 설정하면 참조무결성 관계 설정됨

-- 없는 과목코드 입력시도하면 안됨.
insert into tbl_score2(s_std,s_subject,s_score)
values('S0001','B0100',100);

insert into tbl_subject(sb_code,sb_name)
values('B0100','화학');

update tbl_subject
set sb_code='B0005'
where sb_code='B0100'; -- 참조무결성 때문에 안됨

-- subject table의 sb_code값을 변경하는것을 허용하겠다 하면
-- subject의 sb_code를 변경하면 서로 연결된 table의
-- 해당 칼럼을 모두 자동으로 수정하게 하라.
alter table tbl_score2
drop foreign key fk_score_subject;

alter table tbl_score2
add constraint fk_score_subject
foreign key (s_subject)
references tbl_subject(sb_code)
on update cascade 
on delete cascade; -- delete cascade는 안하는게 좋음

update tbl_subject
set sb_code='B0005'
where sb_code='B0100';

insert into tbl_subject(sb_code,sb_name)
values('B1000','미술');

update tbl_subject
set sb_code='B2000'
where sb_code='B1000';