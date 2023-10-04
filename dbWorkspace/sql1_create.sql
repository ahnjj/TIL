-- create schema 
CREATE SCHEMA sqldb1 DEFAULT CHARACTER SET utf8;
CREATE SCHEMA sqldb2 DEFAULT CHARACTER SET UTF8MB4;
CREATE DATABASE sqldb3 DEFAULT CHARACTER SET UTF8MB4;
-- delete schema
DROP SCHEMA sqldb1;
DROP DATABASE sqldb2;
DROP DATABASE sqldb3;

-- create table
CREATE TABLE product(
	prdNo VARCHAR(10) NOT NULL PRIMARY KEY,
	prdName VARCHAR(30) NOT NULL,
	prdPrice INT,
	pridCompany VARCHAR(30)
);

CREATE TABLE product2(
	prdNo VARCHAR(10),
	prdName VARCHAR(30) NOT NULL,
	prdPrice INT,
	pridCompany VARCHAR(30),
    PRIMARY KEY(prdNo)
);

CREATE TABLE product3(
	prdNo VARCHAR(10) NOT NULL,
	prdName VARCHAR(30) NOT NULL,
	prdPrice INT,
	pridCompany VARCHAR(30),
    CONSTRAINT PK_product_prdNo PRIMARY KEY (prdNo)
);

 -- foreign key
-- 출판사 테이블 
CREATE TABLE publisher (
	pubNo VARCHAR(10) NOT NULL PRIMARY KEY,
	pubName VARCHAR(30) NOT NULL
 );
 
 /* 도서 테이블
 -- constraint : 
 - pk : bookNo, NOT NULL
 - fk :pubNo
 - bookPrice : 기본값 10000, 1000보다 크게 설정

*/
CREATE TABLE book(
bookNo VARCHAR(10) NOT NULL PRIMARY KEY,
bookName VARCHAR(30) NOT NULL,
bookPrice INT DEFAULT 10000 CHECK(bookPrice > 1000),
bookDate DATE,
pubNo VARCHAR(10) NOT NULL,  -- fk
FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)  -- fk constraints
-- FOREIGN KEY (현재 테이블의 열이름) REFERENCES 참조테이블명(참조테이블 기본키)
);
-- 방법2
CREATE TABLE book2(
bookNo VARCHAR(10) NOT NULL PRIMARY KEY,
bookName VARCHAR(30) NObookT NULL,
bookPrice INT DEFAULT 10000 CHECK(bookPrice > 1000),
bookDate DATE,
pubNo VARCHAR(10) NOT NULL,  -- fk
CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)  -- fk constraints
-- FOREIGN KEY (현재 테이블의 열이름) REFERENCES 참조테이블명(참조테이블 기본키)
);

-- table detail check
describe book;
-- PRI : pk
-- MUL : 중복가능한 키 (fk)


-- 연습문제
CREATE TABLE student(
stdName VARCHAR(10) NOT NULL,
stdYear INT DEFAULT 4 CHECK(stdYear >= 1 AND stdYear <= 4),
stdNo VARCHAR(10) NOT NULL PRIMARY KEY,
stdDept INT,
FOREIGN KEY (stdDept) REFERENCES department (deptID)
);


CREATE TABLE department(
deptID INT PRIMARY KEY,
deptName VARCHAR(20) NOT NULL
);
-- FOREIGN KEY (현재 테이블의 열이름) REFERENCES 참조테이블명(참조테이블 기본키)

DROP TABLE department;
DROP TABLE student;
DROP TABLE employee;

-- 연습문제2
CREATE TABLE department(
deptID VARCHAR(10) NOT NULL PRIMARY KEY,
deptName VARCHAR(20) NOT NULL
);
CREATE TABLE employee(
empName VARCHAR(10) NOT NULL,
empNo VARCHAR(10) NOT NULL PRIMARY KEY,
empDept VARCHAR(10) NOT NULL,
FOREIGN KEY (empDept) REFERENCES department(deptID)
);

-- 연습문제3
CREATE TABLE product(
	prdID VARCHAR(10) NOT NULL PRIMARY KEY,
	prdName VARCHAR(10) NOT NULL,
	ctgID VARCHAR(10) NOT NULL,
	FOREIGN KEY (ctgID) REFERENCES category (ctgID)
);
CREATE TABLE category(
	ctgID VARCHAR(10) NOT NULL PRIMARY KEY,
	ctgName VARCHAR(20)
);
DROP TABLE product;



-- 연습 문제
CREATE TABLE department(
	dptId VARCHAR(10) PRIMARY KEY,
	dptName VARCHAR(20) NOT NULL,
	dptPhone VARCHAR(10)
);
CREATE TABLE student(
	stdId VARCHAR(10) NOT NULL PRIMARY KEY,
	stdName VARCHAR(10) NOT NULL,
	stdYear INT DEFAULT 4 CHECK(stdYear >= 1 AND stdYear <= 4),
	stdPhone VARCHAR(10),
	stdAddress VARCHAR(20),
	dptId VARCHAR(10),
	FOREIGN KEY (dptId) REFERENCES department (dptId)
);

CREATE TABLE professor(
	profId VARCHAR(10) NOT NULL PRIMARY KEY,
	profName VARCHAR(10) NOT NULL,
	profPhone VARCHAR(10),
	dptId VARCHAR(10),
	FOREIGN KEY (dptId) REFERENCES department (dptId)
);

CREATE TABLE course(
	courseId VARCHAR(10) NOT NULL PRIMARY KEY,
	courseTitle VARCHAR(20) NOT NULL,
	courseCredit INT NOT NULL,
	profId VARCHAR(10) NOT NULL,
	FOREIGN KEY (profId) REFERENCES professor (profId)
);
CREATE TABLE scores(
	score INT,
	grade VARCHAR(10) NOT NULL,
	stdId VARCHAR(10) NOT NULL,
	courseId VARCHAR(10),
	CONSTRAINT PK_scores_stdNo_courseId PRIMARY KEY(stdId, courseId),
	CONSTRAINT FK_score_course FOREIGN KEY (courseId) REFERENCES course (courseId),
    CONSTRAINT FK_score_student FOREIGN KEY (stdId) REFERENCES student (stdId)
);
DROP TABLE scores;