use emsDB;
create table tbl_friend(
f_id bigint primary key auto_increment,
f_name varchar(50),
f_phone varchar(20),
f_address varchar(255),
f_relation varchar(50)
);

INSERT INTO `emsdb`.`tbl_friend`
(
`f_name`,
`f_phone`,
`f_address`,
`f_relation`)
VALUES
(
'test1',
'010-test1',
'addr test1',
'r test1'
);

// 10번째부터 5개;
select * from tbl_friend  LIMIT 10 offset 0;
select count(*) from tbl_friend;

create table tbl_member(
m_id bigint primary key auto_increment,
m_username varchar(50) unique not null,
m_password varchar(50) not null
);