-- SQL/ create_tables.sql


CREATE SEQUENCE user_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE users (
    id NUMBER,
    username VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    password VARCHAR2(50) NOT NULL,
    shopName VARCHAR2(100),
    address VARCHAR2(255),
    about CLOB,
    PRIMARY KEY (id)
);

CREATE OR REPLACE TRIGGER trg_user_id
BEFORE INSERT ON users
FOR EACH ROW
BEGIN
    IF :NEW.id IS NULL THEN
        SELECT user_seq.NEXTVAL INTO :NEW.id FROM dual;
    END IF;
END;
/


CREATE SEQUENCE post_seq
START WITH 1
INCREMENT BY 1;

CREATE TABLE posts (
    postId NUMBER,
    title VARCHAR2(255) NOT NULL,
    content CLOB NOT NULL,
    author VARCHAR2(50) NOT NULL,
    dates DATE DEFAULT SYSDATE,
    PRIMARY KEY (postId)
);

CREATE OR REPLACE TRIGGER trg_post_id
BEFORE INSERT ON posts
FOR EACH ROW
BEGIN
    IF :NEW.postId IS NULL THEN
        SELECT post_seq.NEXTVAL INTO :NEW.postId FROM dual;
    END IF;
END;
/

