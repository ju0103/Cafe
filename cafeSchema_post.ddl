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

ALTER TABLE cafe.post
    ADD CONSTRAINT post_member_fk FOREIGN KEY ( post_writer )
        REFERENCES cafe.member ( mem_id )
            ON DELETE CASCADE
    NOT DEFERRABLE;