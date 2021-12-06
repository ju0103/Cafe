-- 생성자 Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   위치:        2021-12-06 09:19:36 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



--CREATE USER cafe 
--    IDENTIFIED BY
--    DEFAULT TABLESPACE users
--    QUOTA 10485760 ON users
--    ACCOUNT UNLOCK;

--GRANT UNLIMITED TABLESPACE TO CAFE ;

-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cafe.member (
    mem_id      VARCHAR2(20 BYTE) NOT NULL,
    mem_pw      VARCHAR2(20 BYTE) NOT NULL,
    mem_name    VARCHAR2(20 BYTE) NOT NULL,
    mem_tel     VARCHAR2(13 BYTE) NOT NULL,
    mem_email   VARCHAR2(50 BYTE),
    mem_regdate DATE DEFAULT sysdate,
    mem_days    NUMBER(3) DEFAULT 0,
    mem_level   NUMBER(1) DEFAULT 1,
    mem_post    NUMBER(3) DEFAULT 0
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE cafe.member
    ADD CONSTRAINT member_pk PRIMARY KEY ( mem_id )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT );

CREATE TABLE cafe.post (
    post_no          NUMBER(5) NOT NULL,
    post_writer      VARCHAR2(30 BYTE),
    post_title       VARCHAR2(50 BYTE),
    post_content     VARCHAR2(1000 BYTE),
    post_view        NUMBER(5) DEFAULT 0,
    post_like        NUMBER(5) DEFAULT 0,
    post_regdate     DATE DEFAULT sysdate,
    post_moddate     DATE DEFAULT sysdate,
    file_name        VARCHAR2(50 BYTE) DEFAULT '0',
    file_size        NUMBER(5),
    stored_file_name VARCHAR2(50 BYTE)
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE cafe.post
    ADD CONSTRAINT post_pk PRIMARY KEY ( post_no )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT );

CREATE TABLE cafe.reply (
    reply_no      NUMBER(5) NOT NULL,
    post_no       NUMBER(5) NOT NULL,
    reply_writer  VARCHAR2(30 BYTE) NOT NULL,
    reply_content VARCHAR2(1000 BYTE) NOT NULL,
    reply_regdate DATE DEFAULT sysdate NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

ALTER TABLE cafe.reply
    ADD CONSTRAINT reply_pk PRIMARY KEY ( reply_no,
                                          post_no )
        USING INDEX PCTFREE 10 INITRANS 2 TABLESPACE users LOGGING
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT );

ALTER TABLE cafe.reply
    ADD CONSTRAINT reply_post_no FOREIGN KEY ( post_no )
        REFERENCES cafe.post ( post_no )
            ON DELETE CASCADE
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             0
-- ALTER TABLE                              4
-- CREATE VIEW                              0
-- ALTER VIEW                               0
-- CREATE PACKAGE                           0
-- CREATE PACKAGE BODY                      0
-- CREATE PROCEDURE                         0
-- CREATE FUNCTION                          0
-- CREATE TRIGGER                           0
-- ALTER TRIGGER                            0
-- CREATE COLLECTION TYPE                   0
-- CREATE STRUCTURED TYPE                   0
-- CREATE STRUCTURED TYPE BODY              0
-- CREATE CLUSTER                           0
-- CREATE CONTEXT                           0
-- CREATE DATABASE                          0
-- CREATE DIMENSION                         0
-- CREATE DIRECTORY                         0
-- CREATE DISK GROUP                        0
-- CREATE ROLE                              0
-- CREATE ROLLBACK SEGMENT                  0
-- CREATE SEQUENCE                          0
-- CREATE MATERIALIZED VIEW                 0
-- CREATE MATERIALIZED VIEW LOG             0
-- CREATE SYNONYM                           0
-- CREATE TABLESPACE                        0
-- CREATE USER                              1
-- 
-- DROP TABLESPACE                          0
-- DROP DATABASE                            0
-- 
-- REDACTION POLICY                         0
-- 
-- ORDS DROP SCHEMA                         0
-- ORDS ENABLE SCHEMA                       0
-- ORDS ENABLE OBJECT                       0
-- 
-- ERRORS                                   0
-- WARNINGS                                 0
