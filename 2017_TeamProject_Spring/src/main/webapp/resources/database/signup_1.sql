--�Ϸù�ȣ������ü
drop sequence seq_lecture_idx
create sequence seq_lecture_idx

drop table lecture
--���̺��
create table lecture
(
	idx int, --�Ϸù�ȣ
	name varchar2(100) unique , --���Ǹ�
	lecture_level varchar2(100), --����
	teacher varchar2(100), --������
	book varchar2(100), --����
	price varchar2(100), --����
	point varchar2(100), --����Ʈ����
	regdate date --�������
)


select * from lecture

--�⺻Ű����
alter table lecture add constraint pk_lecture_idx primary key(idx)

--sample data
insert into lecture values(seq_lecture_idx.nextVal, '초급강의', '초급', '초급선생님', '초급책', 
'100000', '5000', sysdate);
insert into lecture values(seq_lecture_idx.nextVal, '중급강의', '중급', '중급선생님', '중급책', 
'110000', '5500', sysdate);
insert into lecture values(seq_lecture_idx.nextVal, '고급강의', '고급', '고급선생님', '고급책', 
'120000', '6000', sysdate);

delete from lecture where name=''

select * from lecture where lecture_level in('초급', '중급') or teacher in('초급선생님')