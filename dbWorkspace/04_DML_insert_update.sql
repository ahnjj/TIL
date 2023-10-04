
use sqldb2;

-- publisher 테이블 생성
CREATE TABLE publisher (
	pubNo VARCHAR(10) NOT NULL PRIMARY KEY,
    pubName VARCHAR(30) NOT NULL
);

-- book 테이블 생성
/*
	도서 테이블 생성 (도서번호, 도서명, 가격, 발행일, 출판사번호)
    제약조건 설정
    - 기본키 : bookNo, NOT NULL
    - 외래키 : pubNo (참조하는 테이블과 기본키 지정)
    - bookPrice : 기본값 10000, 1000 보다 크게 설정
*/

CREATE TABLE book (
	bookNo VARCHAR(10) NOT NULL PRIMARY KEY,
    bookName VARCHAR(30) NOT NULL,
    bookPrice INT DEFAULT 10000 CHECK(bookPrice > 1000),
    bookDate DATE,
    pubNo VARCHAR(10) NOT NULL, -- 외래키로 사용하는 열이름 (필수)
    CONSTRAINT FK_book_publisher FOREIGN KEY (pubNo) REFERENCES publisher (pubNo)  -- 외래키 제약조건 설정
    -- FOREIGN KEY (현재 테이블의 열이름) REFERENCES 참조하는 테이블명 (참조테이블의 기본키)
);

-- -----------------------------------------------------------

-- 데이터 입력

-- publisher 테이블에 데이터 입력
INSERT INTO publisher (pubNo, pubName) VALUES ('1', '서울 출판사');
INSERT INTO publisher (pubNo, pubName) VALUES ('2', '강남 출판사');
INSERT INTO publisher (pubNo, pubName) VALUES ('3', '종로 출판사');

-- publisher 테이블 내용 조회
SELECT * FROM publisher;


-- book 테이블에 데이터 입력
INSERT INTO book (bookNo, bookName, bookPrice, bookDate, pubNo)
	VALUES ('1', '데이터베이스', 20000, '2022-11-11', '1');

-- 모든 열에 데이터를 입력할 경우 열이름 생략 가능
INSERT INTO book 
	VALUES ('2', '파이썬', 23000, '2023-08-10', '1');

-- 여러 개의 데이터를 한 번에 INSERT
INSERT INTO book (bookNo, bookName, bookPrice, bookDate, pubNo)
	VALUES ('3', '알고리즘', 35000, '2023-03-11', '2'),
		   ('4', '자바스크립트', 22000, '2022-09-11', '3'),
           ('5', 'HTML', 18000, '2023-06-20', '2');

-- 또는 (모든 열에 데이터를 입력할 경우 열이름 생략 가능)
INSERT INTO book 
	VALUES ('6', 'CSS', 20000, '2023-08-10', '2'), 
           ('7', '자바', 22000, '2023-09-11', '3'),
           ('8', 'Django', 18000, '2021-06-20', '2');

SELECT * FROM book;

-- -------------------------------------------------------------
-- INSERT 문 연습문제

CREATE TABLE department(
	dptNo VARCHAR(30) PRIMARY KEY,
    dptName VARCHAR(30) NOT NULL,
    dptTel VARCHAR(13)
);

CREATE TABLE student(
	stdNo VARCHAR(30) PRIMARY KEY,
	stdName VARCHAR(30) NOT NULL,
	stdYear INT,
    stdAddress VARCHAR(30),
    stdBirthDay VARCHAR(10),
    dptNo VARCHAR(30),
    CONSTRAINT FK_student_department 
		FOREIGN KEY (dptNo) REFERENCES department(dptNo)
);

INSERT INTO department (dptNo, dptName, dptTel)
	VALUES ('1', '컴퓨터학과', '02-1111-1111'),
		   ('2', '경영학과', '02-2222-2222'),
           ('3', '수학과', '02-3333-3333');

INSERT INTO student (stdNo, stdName, stdYear, stdAddress, stdBirthDay, 	dptNo)
	VALUES ('2018002', '이몽룡', '4', '서울시 강남구', '1998-05-07', '1'),
		   ('2022003', '홍길동', '2', '경기도 안양시', '1999-11-11', '2'),
           ('2023003', '성춘향', '1', '전라북도 남원시', '2002-01-02', '3'),
           ('2021004', '변학도', '1', '서울시 종로구', '2000-11-11', '2');

SELECT * FROM department;
SELECT * FROM student;

-- ----------------------------------------------------------------

-- 자동증가 / 디폴트 값 있는 경우
CREATE TABLE board(
	boardNo INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
	boardTitle VARCHAR(30) NOT NULL,
    boardWriter VARCHAR(20),
    boardContent VARCHAR(200),
    boardDate DATETIME DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO board(boardTitle, boardWriter, boardContent)
	VALUES ('사용후기', '홍길동', '좋아요');

SELECT * FROM board;

-- -----------------------------------------------------------
-- 데이터 임포트 : product 테이블 생성 
-- 제약조건 설정되어 있지 않음 ---> 제약조건 변경해야 함
-- (1) 데이터 타입 변경
-- (2) 기본키 제약조건 설정

describe product;

-- 데이터 타입 변경 
-- prdNo - VARCHAR(10) NOT NULL
-- prdName - VARCHAR(20)
-- prdMakeer - VARCHAR(30)
-- prdColor - VARCHAR(10)

ALTER TABLE product MODIFY prdNo VARCHAR(10) NOT NULL,
                    MODIFY prdName VARCHAR(20),
                    MODIFY prdMaker VARCHAR(30),
                    MODIFY prdColor VARCHAR(10);
                    
-- prdNo에 기본키 제약조건 추가
ALTER TABLE product ADD PRIMARY KEY (prdNo);

-- --------------------------------------------------------

-- UPDATE 문

-- 상품 테이블 조회
SELECT * FROM product;

-- 상품번호가 '5'인 prdName을 'UHD TV'로 수정
UPDATE product SET prdName='UHD TV' WHERE prdNo='5';

-- -----------------------------------------------------

-- DELETE 문

-- 상품명이 '그늘막 텐트'인 행 삭제
DELETE FROM product WHERE prdName = '그늘막 텐트';

-- ----------------------------------------------------
/* 
	INSERT / UPDATE / DELETE 연습문제
		(1) book 테이블에 그림과 같이 행 삽입 
			(출판사 데이터는 테이블 구조에 맞게 입력)
		(2) book 테이블에서 도서명이 ‘자바’인 행의 가격을 25000으로 변경
		(3) book 테이블에서 발행일이 2021년도인 행 삭제

*/

-- (1) book 테이블에 그림과 같이 행 삽입 
INSERT INTO book (bookNo, bookName, bookPrice, bookDate, pubNo)
		VALUES ('9', 'JAVA 프로그래밍', '30000', '2022-03-10', '1'),
			   ('10', '파이썬 데이터 과학', '24000', '2023-09-05', '1');

-- (2) book 테이블에서 도서명이 ‘자바’인 행의 가격을 25000으로 변경
UPDATE book SET bookPrice= '25000'  WHERE bookName='자바';

-- (3) book 테이블에서 발행일이 2021년도인 행 삭제
DELETE FROM book WHERE bookDate >= '2021-01-01' AND bookDate <= '2021-12-31';

SELECT * FROM book;

-- -------------------------------------------------------------

/*
	종합 연습문제
	다음과 같이 SQL 문 작성
		1. 고객 테이블 (customer) 생성 
		2. 고객 테이블의 전화번호 열을 NOT NULL로 변경
		3. 고객 테이블에 ‘성별’, ‘나이’ 열 추가
		4. 고객 테이블에 데이터 삽입 (3개)
		5. 고객명이 ‘홍길동’인 고객의 전화번호 값 수정 (값은 임의로)
		6. 나이가 20살 미만인 고객 삭제
*/

-- 1. 고객 테이블 (customer) 생성 
CREATE TABLE customer (
	ctmNo INT NOT NULL PRIMARY KEY,
    ctmName VARCHAR(30),
    ctmPhone VARCHAR(13)
);

describe customer;

-- 2. 고객 테이블의 전화번호 열을 NOT NULL로 변경
ALTER TABLE customer MODIFY ctmPhone VARCHAR(13) NOT NULL;

-- 3. 고객 테이블에 ‘성별’, ‘나이’ 열 추가
ALTER TABLE customer ADD (ctmGender VARCHAR(5), ctmYear INT);

-- 4. 고객 테이블에 데이터 삽입 (3개)
INSERT INTO customer VALUES (1, '홍길동', '010-1111-1234', '남자', 20),
							(2, '이몽룡', '010-2222-5678', '남자', 24),
                            (3, '성춘향', '010-3333-1357', '여자', 19);

-- 5. 고객명이 ‘홍길동’인 고객의 전화번호 값 수정 (값은 임의로)
UPDATE customer SET ctmPhone='010-1122-1235' WHERE ctmName='홍길동';

-- 6. 나이가 20살 미만인 고객 삭제
DELETE FROM customer WHERE ctmYear < 20;

SELECT * FROM customer;





