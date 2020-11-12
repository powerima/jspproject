create table t1105(
	num number(6) not null primary key,
	name nvarchar2(5),
	age number(3),
	email varchar2(50));

	
create sequence st1105
	start with 100001
	increment by 1;