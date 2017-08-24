--일련번호관리객체
drop sequence seq_lecture_idx
create sequence seq_lecture_idx

drop table lecture
--테이블명
create table lecture
(
	idx int, --일련번호
	name varchar2(100) unique , --강의명
	lecture_level varchar2(100), --레벨
	teacher varchar2(100), --선생님
	book varchar2(100), --교재
	price varchar2(100), --가격
	point varchar2(100), --포인트적립
	regdate date --등록일자
)


select * from lecture

--기본키설정
alter table lecture add constraint pk_lecture_idx primary key(idx)

--sample data
insert into lecture values(seq_lecture_idx.nextVal, '초급강의', '초급', '초급선생님', '초급교재', 
'100000', '5000', sysdate);
insert into lecture values(seq_lecture_idx.nextVal, '중급강의', '중급', '중급선생님', '중급교재', 
'110000', '5500', sysdate);
insert into lecture values(seq_lecture_idx.nextVal, '고급강의', '고급', '고급선생님', '고급교재', 
'120000', '6000', sysdate);

delete from lecture where name='고급강의'

select * from lecture where lecture_level in('초급', '중급') or teacher in('고급선생님')