create database todo;

/* 사용자 */
DROP TABLE t_user;
CREATE TABLE t_user (
    ID VARCHAR(20) NOT NULL, /* 아이디 */
    PASSWORD VARCHAR(40) NOT NULL, /* 패스워드 */
    EMAIL VARCHAR(20), /* 이메일 */
    constraint PK_ID primary key (
    ID
    )
);

COMMENT ON TABLE t_user IS '사용자';

COMMENT ON COLUMN t_user.ID IS '아이디';

COMMENT ON COLUMN t_user.PASSWORD IS '패스워드';

COMMENT ON COLUMN t_user.EMAIL IS '이메일';

/* TODO마스터 */
DROP TABLE t_todo_master;
CREATE TABLE t_todo_master (
    SEQ bigint DEFAULT 0 NOT NULL, /* 순번 */
    ID VARCHAR(20) NOT NULL, /* 아이디 */
    DATEID VARCHAR(8) NOT NULL, /* 일자 */
    constraint PK_TODO_MASTER_SEQ primary key (
        SEQ
    )
);

COMMENT ON TABLE t_todo_master IS 'TODO마스터';

COMMENT ON COLUMN t_todo_master.SEQ IS '순번';

COMMENT ON COLUMN t_todo_master.ID IS '아이디';

COMMENT ON COLUMN t_todo_master.DATEID IS '일자';

/* TODO상세 */
DROP TABLE t_todo_detail;
CREATE TABLE t_todo_detail (
    SEQ bigint DEFAULT 0 NOT NULL, /* 순번 */
    P_SEQ bigint DEFAULT 0 NOT NULL, /* 상위순번 */
    COL VARCHAR(1000), /* 내용 */
    CONFIRM CHAR(1), /* 확인 */
    USE_YN CHAR(1), /* 사용여부 */
    constraint PK_TODO_DETAIL_SEQ primary key (
        SEQ
    )
);

COMMENT ON TABLE t_todo_detail IS 'TODO상세';

COMMENT ON COLUMN t_todo_detail.SEQ IS '순번';

COMMENT ON COLUMN t_todo_detail.P_SEQ IS '상위순번';

COMMENT ON COLUMN t_todo_detail.COL IS '내용';

COMMENT ON COLUMN t_todo_detail.CONFIRM IS '확인';

COMMENT ON COLUMN t_todo_detail.USE_YN IS '사용여부';

ALTER TABLE t_todo_master
    ADD
        CONSTRAINT FK_t_user_TO_t_todo_master
        FOREIGN KEY (
            ID
        )
        REFERENCES t_user (
            ID
        );

ALTER TABLE t_todo_detail
    ADD
        CONSTRAINT FK_t_todo_master_TO_t_todo_detail
        FOREIGN KEY (
            P_SEQ
        )
        REFERENCES t_todo_master (
            SEQ
        );

drop sequence todo_master_seq;
create sequence todo_master_seq
  increment    1
  minvalue     1
  maxvalue     1000000
  start        1
  cache        100
  cycle
;

drop sequence todo_detail_seq;
create sequence todo_detail_seq
  increment    1
  minvalue     1
  maxvalue     1000000
  start        1
  cache        100
  cycle
;
