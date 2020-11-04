create table board(
	num number not null primary key,
	writer nvarchar2(20) not null,
	email varchar2(30),
	subject nvarchar2(50) not null,
	passwd varchar(12) not null,
	reg_date date not null,
	readcount number,
	ref number not null,
	re_step number(3) not null,
	re_level number(3) not null,
	content long not null,
	ip varchar2(20) not null);
	
create sequence s_board 
	start with 1
	increment by 1;
	
insert into board(num, writer, email, subject, passwd, 
 reg_date, ref, re_step, re_level, content, ip) 
 value(s_board.nextval, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?);
 
 select * from board;
 
select rownum, p.* from 
    (select rownum as rnum, k.* from 
    (select * from board order by ref desc, re_step asc) k 
    where rownum <= 100	)p  where rnum >= 1;
			