-- 생성자 Oracle SQL Developer Data Modeler 21.2.0.165.1515
--   위치:        2021-11-26 09:53:28 KST
--   사이트:      Oracle Database 11g
--   유형:      Oracle Database 11g



-- predefined type, no DDL - MDSYS.SDO_GEOMETRY

-- predefined type, no DDL - XMLTYPE

CREATE TABLE cafe.member (
    mem_id      VARCHAR2(20 BYTE) NOT NULL,
    mem_pw      VARCHAR2(20 BYTE) NOT NULL,
    mem_name    VARCHAR2(20 BYTE) NOT NULL,
    mem_tel     VARCHAR2(13 BYTE) NOT NULL,
    mem_email   VARCHAR2(50 BYTE) NOT NULL,
    mem_regdate DATE DEFAULT sysdate NOT NULL,
    mem_level   NUMBER(1) DEFAULT 0 NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX cafe.member_pk ON
    cafe.member (
        mem_id
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE cafe.member
    ADD CONSTRAINT member_pk PRIMARY KEY ( mem_id )
        USING INDEX cafe.member_pk;

CREATE TABLE cafe.post (
    post_no      NUMBER(5) NOT NULL,
    post_writer  VARCHAR2(20 BYTE) NOT NULL,
    post_title   VARCHAR2(50 BYTE) NOT NULL,
    post_content VARCHAR2(1000 BYTE),
    post_hit     NUMBER(5) DEFAULT 0 NOT NULL,
    post_like    NUMBER(5) DEFAULT 0 NOT NULL,
    post_regdate DATE DEFAULT sysdate NOT NULL,
    post_moddate DATE
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX cafe.post_pk ON
    cafe.post (
        post_no
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE cafe.post
    ADD CONSTRAINT post_pk PRIMARY KEY ( post_no )
        USING INDEX cafe.post_pk;

CREATE TABLE cafe.reply (
    reply_no      NUMBER(5) NOT NULL,
    post_no       NUMBER(5) NOT NULL,
    mem_id        VARCHAR2(20 BYTE) NOT NULL,
    reply_grp     NUMBER(5),
    reply_grps    NUMBER(5),
    reply_grpl    NUMBER(5),
    reply_content VARCHAR2(1000 BYTE),
    reply_regdate DATE DEFAULT sysdate NOT NULL
)
PCTFREE 10 PCTUSED 40 TABLESPACE users LOGGING
    STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL DEFAULT );

CREATE UNIQUE INDEX cafe.reply_pk ON
    cafe.reply (
        reply_no
    ASC )
        TABLESPACE users PCTFREE 10
            STORAGE ( INITIAL 65536 NEXT 1048576 PCTINCREASE 0 MINEXTENTS 1 MAXEXTENTS 2147483645 FREELISTS 1 FREELIST GROUPS 1 BUFFER_POOL
            DEFAULT )
        LOGGING;

ALTER TABLE cafe.reply
    ADD CONSTRAINT reply_pk PRIMARY KEY ( reply_no )
        USING INDEX cafe.reply_pk;

ALTER TABLE cafe.post
    ADD CONSTRAINT post_member_fk FOREIGN KEY ( post_writer )
        REFERENCES cafe.member ( mem_id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE cafe.reply
    ADD CONSTRAINT reply_member_fk FOREIGN KEY ( mem_id )
        REFERENCES cafe.member ( mem_id )
            ON DELETE CASCADE
    NOT DEFERRABLE;

ALTER TABLE cafe.reply
    ADD CONSTRAINT reply_post_fk FOREIGN KEY ( post_no )
        REFERENCES cafe.post ( post_no )
            ON DELETE CASCADE
    NOT DEFERRABLE;



-- Oracle SQL Developer Data Modeler 요약 보고서: 
-- 
-- CREATE TABLE                             3
-- CREATE INDEX                             3
-- ALTER TABLE                              6
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
-- CREATE USER                              0
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
