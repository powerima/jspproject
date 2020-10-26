drop table examtbl;

Create table examtbl (
sno varchar2(5) not null primary key,
sname varchar2(10) ,
kor number(3) ,
eng number(3) ,
math number(3) ,
hist number(3) 
);

insert into examtbl (sno, sname, kor,eng,math,hist)
values('10101', '김학생', 75, 85, 90, 60);
insert into examtbl (sno, sname, kor,eng,math,hist)
values('10102', '이학생', 70, 75, 70, 60);
insert into examtbl (sno, sname, kor,eng,math,hist)
values('10103', '박학생', 70, 85, 80, 75);
insert into examtbl (sno, sname, kor,eng,math,hist)
values('10201', '조학생', 90, 85, 100, 50);
insert into examtbl (sno, sname, kor,eng,math,hist)
values('10202', '황학생', 65, 65, 60, 70);
insert into examtbl (sno, sname, kor,eng,math,hist)
values('10203', '임학생', 45, 55, 50, 55);
insert into examtbl (sno, sname, kor,eng,math,hist)
values('10304', '천학생', 70, 75, 85, 80);
insert into examtbl (sno, sname, kor,eng,math,hist)
values('10305', '남학생', 100, 85, 90, 90);
insert into examtbl (sno, sname, kor,eng,math,hist)
values('10306', '여학생', 80, 95, 90, 85);
insert into examtbl (sno, sname, kor,eng,math,hist)
values('10307', '노학생', 35, 55, 70, 55);​

select * from examtbl;


create table member(
	idx int not null primary key,
	sno varchar2(5) not null,
	sname nvarchar2(10),
	tel varchar2(13),
	email varchar2(30),
	addr nvarchar2(100),
	fileT nvarchar2(50)
);


create sequence s_member
minvalue 1
maxvalue 99999
increment by 1
start with 1;

select * from member;