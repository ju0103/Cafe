create table member
(MEM_ID VARCHAR2(20) PRIMARY KEY
,MEM_PW VARCHAR2(20) NOT NULL
,MEM_NAME VARCHAR2(20) NOT NULL
,MEM_TEL VARCHAR2(13) NOT NULL
,MEM_EMAIL VARCHAR2(50)
,MEM_REGDATE DATE DEFAULT SYSDATE
,MEM_DAYS NUMBER(3) default 0
,MEM_LEVEL NUMBER(1) DEFAULT 1
,MEM_POST NUMBER(3) DEFAULT 0
);

drop table mem_test;

insert into member(mem_id,mem_pw,mem_name,mem_tel,mem_email,mem_regdate,mem_level) 
     values('admin','1234','admin','010-1111-1111','admin@admin.com','2021/11/01','0'); --관리자 내용 인서트
UPDATE member SET mem_regdate = '2021/11/01',mem_level = 0 where mem_id='admin'; --테이블 삭제후 ↑쿼리에 대한 업데이트
commit;
SELECT * FROM member; --변경사항확인
update member SET mem_days = 29 where mem_id='admin'; -- 등급업 쿼리
update member SET mem_level = 1 where mem_id='aaa';
-- 레벨1인 아이디 입력값의 회원 레벨2로 등업
UPDATE member SET mem_regdate = '21/11/10' where mem_id='aaa'; -- 가입일 변경
UPDATE member SET mem_regdate = '21/11/15' where mem_id='bbb';
UPDATE member SET mem_regdate = '21/11/20' where mem_id='ccc';
select * from member order by mem_regdate desc;--신규가입자 순으로 정렬


         
