create table member_tbl_ch14(
	id varchar2(50) not null primary key,
	passwd varchar2(16) not null,
	name nvarchar2(10) not null,
	reg_date date not null,
	address nvarchar2(100) not null,
	tel varchar2(20) not null);
	

insert into member_tbl_ch14(id, passwd, name, reg_date, address, tel)
values('hongd@aaa.com','1234','홍길동',sysdate,'인천시 남동구 정각로 29', '010-2222-1234');



create table manager_tbl_ch14(
	managerId varchar2(50) not null primary key,
	managerPasswd varchar2(16) not null);
	
insert into manager_tbl_ch14(managerId, managerPasswd)
values('bookmaster@shop.com', '1234');


create table book_tbl_ch14(
	book_id number(12) not null primary key,
	book_kind varchar2(3) not null,
	book_title nvarchar2(100) not null,
	book_price int not null,
	book_count number(6) not null,
	author nvarchar2(40) not null,
	publishing_com nvarchar2(3) not null,
	publishing_date varchar2(15) not null,
	book_image nvarchar2(16) default 'nothing.jpg',
	book_content long not null,
	discount_rate number(6) default 10,
	reg_date date not null);
	
create sequence sbook_id_book_tbl_ch14
	start with 100001
	increment by 1;
	
	
drop table bank_tbl_ch14;
create table bank_tbl_ch14(
	account varchar2(30) not null,
	bank nvarchar2(10) not null,
	name nvarchar2(10) not null);
	

insert into bank_tbl_ch14(account, bank, name)
values('11111-111-11111', '내일은행','오내일');


create table cart_tbl_ch14(
	cart_id number(6) not null primary key,
	buyer nvarchar2(50) not null,
	book_id number(12) not null,
	book_title nvarchar2(100) not null,
	buy_price number not null,
	buy_count number(4) not null,
	book_image nvarchar2(16) default 'nothing.jpg');
	
	
create sequence scart_id_cart_tbl_ch14
	start with 100001
	increment by 1
	maxvalue 999999;
	
	

create table buy_tbl_ch14(
	buy_id number not null,
	buyer nvarchar2(50) not null,
	book_id number(6) not null,
	book_title nvarchar2(100) not null,
	buy_price number not null,
	buy_count number(4) not null,
	book_image nvarchar2(16) default 'nothing.jpg',
	buy_date date not null,
	account varchar2(30) not null,
	deliveryName nvarchar2(10) not null,
	deliveryTel varchar2(20) not null,
	deliveryAddress nvarchar2(100) not null,
	sanction nvarchar2(10) default '상품 준비중');