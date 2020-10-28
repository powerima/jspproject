create table tbl_test02(
	custno number(6) not null primary key,
	custname varchar2(20),
	phone varchar2(13),
	address nvarchar2(50),
	joindate date);
	
create sequence stbl_test02
	start with 1
	increment by 1;
	
select * from tbl_test02;

select rownum, p.* from 
	(select rownum as rnum, k.*	from 
		(select  * from guest order by custname desc) k 
	where rownum <= 10	)p where rnum >= 1;