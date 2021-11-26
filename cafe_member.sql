create table member
(MEM_ID VARCHAR2(20) PRIMARY KEY
,MEM_PW VARCHAR2(20) NOT NULL
,MEM_NAME VARCHAR2(20) NOT NULL
,MEM_TEL VARCHAR2(13) NOT NULL
,MEM_EMAIL VARCHAR2(50)
,MEM_REGDATE DATE DEFAULT SYSDATE
,MEM_LEVEL NUMBER(1) DEFAULT 1
);
drop table member;
insert into member(mem_id,mem_pw,mem_name,mem_tel,mem_email) values('admin','1234','admin','010-1111-1111','admin@admin.com');
UPDATE member SET mem_level = 0 where mem_id='admin';
commit;
SELECT * FROM member;
