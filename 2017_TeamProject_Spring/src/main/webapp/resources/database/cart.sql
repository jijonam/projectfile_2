create sequence seq_lecture_cart_idx

--��ٱ��� ���̺�
create table lecture_cart
(
  cart_idx  int  primary key,
  member_idx int,
  lecture_idx  int
)

--lecture���̺��� idx�� lecture_idx���� �ܷ�Ű ����
alter table lecture_cart drop constraint fk_cart_p_idx
alter table lecture_cart
  add constraint fk_lecture_cart_lecture_idx foreign key(lecture_idx) 
                               references lecture(idx) on delete cascade
alter table lecture_cart
  add constraint fk_lecture_cart_member_idx foreign key(member_idx) 
                               references test_member(idx)

select * from lecture
select * from test_member

insert into lecture_cart values(seq_lecture_cart_idx.nextVal,2,2);


delete from lecture_cart where member_idx=2

select * from lecture_cart

commit

-- Join�� ���ؼ� ��ȸ������ ����
create or replace view lecture_cart_view
as
	select
	   l.idx as l_idx, l.name, l.teacher, l.price, c.cart_idx, m.idx as m_idx
	from lecture l inner join lecture_cart c on l.idx = c.lecture_idx inner join test_member m on m.idx = c.member_idx

select * from lecture_cart_view;

--��ٱ��� ��ǰ�� �Ѱ�
select nvl(sum(amount),0) total from cart_view;