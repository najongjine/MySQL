-- root 계정을 비밀번호 분실했을떼
-- 기존에 등록된 다른 id로 로그인하여 수행
-- 단 다른 id의 grant all로 지정되 있어야 한다.
-- mysql 설치후에 새로운 사용자를 등록하고
-- grant를 all로 선언하여 생성해 두자!!
alter user 'root'@'localhost' identified with mysql_native_password by
'aa1234';

-- UTF-8
use emsDB;
create table tbl_bbs(
BBS_ID	BIGINT	AUTO_INCREMENT	PRIMARY KEY,
BBS_P_ID	BIGINT	DEFAULT 0	,
BBS_WRITER	VARCHAR(50)	NOT NULL,	
BBS_DATE	VARCHAR(10)		,
BBS_TIME	VARCHAR(10)		,
BBS_SUBJECT	VARCHAR(125)	,	
BBS_CONTENT	VARCHAR(1000)	,	
BBS_COUNT	 int	DEFAULT 0	
) char set utf8mb4;

-- mysql8에서는 기본 문자열 인코딩이 utf8mb4 방식으로 
-- 설정되어 varchar type의 칼럼에 문자열을 저장하면
-- 영문, 숫자 등은 1개가 1byte,기타 다국어는 1~4byte까지 자동으로 변형된다.
-- mysql에서 현재 database schema가 어떤 encoding인지 확인
show session variables like 'collation_connection';

-- mysql 5.x이하에서는 utf-8과 latin1 방식으로 설정되어 많은 문제를 일으켰다.
-- mysql 5.x이하의 utf8은 3byte방식 가변 문자열로
-- Emoji와 같은 특수문자는 인식하지 못한다.

create table tbl_menu(
MENU_ID	VARCHAR(3)	NOT NULL	PRIMARY KEY,
MENU_P_ID	VARCHAR(3)		,
MENU_TITLE	VARCHAR(10)	NOT NULL	,
MENU_HREF	VARCHAR(125)		
);

INSERT INTO `emsdb`.`tbl_menu`
VALUES
('M01',
null,
'Home',
'/'
);

INSERT INTO `emsdb`.`tbl_menu`
VALUES
('M02',
null,
'관리자',
'#'
);

INSERT INTO `emsdb`.`tbl_menu`
VALUES
('M03',
'M02',
'로그인',
'#'
);
INSERT INTO `emsdb`.`tbl_menu`
VALUES
('M04',
'M02',
'회원가입',
'#'
);
INSERT INTO `emsdb`.`tbl_menu`
VALUES
('M05',
'M02',
'게시판정리',
'#'
);

update tbl_menu
set menu_p_id=null
where menu_p_id in ('M01'.'M02');