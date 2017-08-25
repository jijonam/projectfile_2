-- 일련번호 관리객체
create sequence seq_test_member_idx

-- 테이블명
create table test_member
(
   idx int,                 -- 일련번호
   name varchar2(100),      -- 회원명
   email varchar2(100) unique, -- 아이디
   pwd varchar2(100),       -- 비밀번호
   ip varchar2(100),        -- 아이피
   rating varchar2(50),     -- 회원등급
   regdate date             -- 가입일자
)

-- 기본키설정
alter table test_member add constraint pk_test_member_idx primary key(idx)

-- sample data
insert into test_member 
values(seq_member_idx.nextVal, '홍길동', 'hong@naver.com','1234', '127.0.0.1', 'master', sysdate);

select * from test_member

delete from member where idx=6

select * from sawon
select * from gogek
select * from visit