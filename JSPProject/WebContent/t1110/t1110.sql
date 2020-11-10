create table student_tbl_t1110(
	sno number(6) not null primary key,
	sname nvarchar2(6),
	deptname nvarchar2(10),
	eng number(3),
	math number(3));
	
create sequence s_student_tbl_t1110
	start with 10001
	increment by 1
	
	
insert into student_tbl_t1110(sno, sname, depname, eng, math)
values(s_t1110.nextval, ?, ?, ?, ?);

select * from student_tbl_t1110;