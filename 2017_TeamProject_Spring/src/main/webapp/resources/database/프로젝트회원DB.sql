-- �Ϸù�ȣ ������ü
create sequence seq_test_member_idx

-- ���̺��
create table test_member
(
   idx int,                 -- �Ϸù�ȣ
   name varchar2(100),      -- ȸ����
   email varchar2(100) unique, -- ���̵�
   pwd varchar2(100),       -- ��й�ȣ
   ip varchar2(100),        -- ������
   rating varchar2(50),     -- ȸ�����
   regdate date             -- ��������
)

-- �⺻Ű����
alter table test_member add constraint pk_test_member_idx primary key(idx)

-- sample data
insert into test_member 
values(seq_test_member_idx.nextVal, '나다', 'hong@naver.com','1234', '127.0.0.1', 'master', sysdate);

select * from test_member

delete from member where idx=6

select * from sawon
select * from gogek
select * from visit