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

insert into lecture_cart values(seq_lecture_cart_idx.nextVal,41,5);


delete from cart where c_idx=24

select * from lecture_cart

commit

-- Join�� ���ؼ� ��ȸ������ ����
create or replace view lecture_cart_view
as
	select
	   m.idx, p.p_idx, c_idx, p_num,p_name,p_price,p_saleprice,
	   c_cnt, c_cnt* p_saleprice amount
	from product p inner join  cart c on p.p_idx = c.p_idx inner join member m on m.idx = c.m_idx

select * from cart_view;

--��ٱ��� ��ǰ�� �Ѱ�
select nvl(sum(amount),0) total from cart_view;