create table tbl_test01(
	custno number(6) not null primary key,
	custname nvarchar2(20) not null,
	kor number(3),
	eng number(3));
	
select * from tbl_test01;