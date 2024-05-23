-- SQL/ create_tables.sql

-- Create users table
CREATE TABLE users (
    id NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    username VARCHAR2(50) NOT NULL,
    email VARCHAR2(100) NOT NULL,
    password VARCHAR2(50) NOT NULL,
    shopName VARCHAR2(100),
    address VARCHAR2(255),
    about CLOB,
    PRIMARY KEY (id)
);

-- Create posts table
CREATE TABLE posts (
    postId NUMBER GENERATED BY DEFAULT ON NULL AS IDENTITY,
    title VARCHAR2(255) NOT NULL,
    content CLOB NOT NULL,
    author VARCHAR2(50) NOT NULL,
    date DATE DEFAULT SYSDATE,
    PRIMARY KEY (postId)
);
