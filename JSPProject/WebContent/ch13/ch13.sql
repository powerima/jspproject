-- 1학년 게시판
create table tbl_ch13_grade01(
	custno number(6) not null primary key,
	custname nvarchar2(20) not null,
	kor number(3),
	eng number(3));

-- 2학년 게시판
create table tbl_ch13_grade02(
	custno number(6) not null primary key,
	custname nvarchar2(20) not null,
	kor number(3),
	eng number(3));

-- 3학년 게시판
create table tbl_ch13_grade03(
	custno number(6) not null primary key,
	custname nvarchar2(20) not null,
	kor number(3),
	eng number(3));

-- 시퀀스
create sequence seq_tbl_ch13_grade01
	start with 1
	increment by 1;

create sequence seq_tbl_ch13_grade02
	start with 1
	increment by 1;

create sequence seq_tbl_ch13_grade03
	start with 1
	increment by 1;
	 
	
-- 회원 가입 
create table member_tbl_ch13(
	num number(6) not null,
	id varchar2(20) not null primary key,
	passwd varchar2(20) not null);
	
create sequence seq_member_tbl_ch13
	start with 1
	increment by 1
	maxvalue 999999
	cache 20 noorder nocycle;
	
insert into member_tbl_ch13(num, id, passwd)
values(seq_member_tbl_ch13.nextval, 'admin', '1234');
insert into member_tbl_ch13(num, id, passwd)
values(seq_member_tbl_ch13.nextval, 'ppk', '1234');


-- 투표 테이블
create table vote_tbl_ch13(
	num number(6) not null,	
	ccode char(3) not null primary key,
	company nvarchar2(20) not null,
	vote_cnt number(6) not null);

create sequence seq_vote_tbl_ch13
	start with 1
	increment by 1
	maxvalue 999999
	cache 20 noorder nocycle;
	
insert into vote_tbl_ch13(num, ccode, company, vote_cnt)
values(seq_vote_tbl_ch13.nextval,'n','네이버(금융+게임)', 0);
insert into vote_tbl_ch13(num, ccode, company, vote_cnt)
values(seq_vote_tbl_ch13.nextval,'k', '카카오(검색+쇼핑)', 0);
insert into vote_tbl_ch13(num, ccode, company, vote_cnt)
values(seq_vote_tbl_ch13.nextval, 'j','JYP(음악플랫폼)', 0);

update vote_tbl_ch13 set vote_cnt = vote_cnt+1 where ccode = 'k'
	