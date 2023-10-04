use sqldb4;

--  데이터 임포트 : publisher / book / client / bookSale

-- (1) publisher 테이블 
alter table publisher modify pubNo varchar(10) not null primary key,
                      modify pubName varchar(20) not null;

describe publisher;

-- (2) book 테이블
alter table book modify bookNo varchar(10) not null primary key,
				 modify bookName varchar(30) not null,
				 modify bookAuthor varchar(20) not null,
                 modify bookDate Date,
				 modify pubNo varchar(10) not null;
                 
alter table book add foreign key(pubNo) references publisher(pubNo);

describe book;

-- (3) client 테이블
alter table client modify clientNo varchar(10) not null primary key,
					modify clientName varchar(20) not null,
					modify clientPhone varchar(13),
					modify clientAddress varchar(50) not null,
					modify clientHobby varchar(20) not null,
					modify clientGender varchar(5) not null,
					modify clientBirth Date;

describe client;

-- (4) bookSale 테이블
alter table bookSale modify bsNo varchar(10) not null primary key,
					 modify bookNo varchar(10) not null,
					 modify clientNo varchar(10) not null,
					 modify bsDate Date;

-- alter table booksale add foreign key(bookNo) references book(bookNo);
-- alter table booksale add foreign key(clientNo) references client(clientNo);

ALTER TABLE bookSale
	ADD CONSTRAINT FK_booksale_client
	FOREIGN KEY (clientNo) REFERENCES client (clientNo);
    
ALTER TABLE bookSale
	ADD CONSTRAINT FK_booksale_book 
	FOREIGN KEY (bookNo) REFERENCES book (bookNo);

describe bookSale;

-- -----------------------------------------------------------------
-- book 테이블에서 모든 행 / 모든 열 검색
-- 모든 (*) 열 출력
SELECT * FROM book;

-- 도서명과 가격만 검색
SELECT bookName, bookPrice FROM book;

-- 저자만 검색
SELECT bookAuthor FROM book;

-- 저자만 검색 (중복된 행은 한 번 만 출력 : DISTINCT)
SELECT DISTINCT bookAuthor FROM book;


-- -----------------------------------------------------
-- 비교 (= , <, >, <=, >=, !=)

-- 저자가 '홍길동'인 도서의 도서명, 저자 출력
SELECT bookName, bookAuthor FROM book
WHERE bookAuthor= '홍길동';

-- 도서가격이 30000 이상인 행의 도서명, 가격, 재고 출력
SELECT bookName, bookPrice, bookStock 
FROM book
WHERE bookPrice >= 30000;

-- 재고가 3~5 사이인 도서의 도서명, 재고 출력
SELECT bookName, bookStock FROM book
WHERE bookStock >= 3 AND bookStock <= 5;

-- 범위 (BETWEEN) : BETWEEN a AND b (a, b 양쪽 다 포함)
-- 재고가 3~5 사이인 도서의 도서명, 재고 출력
SELECT bookName, bookStock FROM book
WHERE bookStock BETWEEN 3 AND 5;

-- 리스트에 포함 (IN, NOT IN)
-- 출판사명이 '서울 출판사'(pubNo='1')와 '도서출판 강남'(pubNo='2')인 도서의 
-- 도서명, 출판사번호 출력
SELECT bookName, pubNo FROM book
WHERE pubNo IN ('1', '2');
-- 또는
SELECT bookName, pubNo FROM book
WHERE pubNo = '1' OR pubNo = '2';

-- '도서출판 강남'에서 출간하지 않은 도서의
-- 도서명, 출판사번호 출력
select bookname, pubno from book where pubNo not in ('2');

-- NULL (IS NULL, IS NOT NULL)

-- 먼저 client 테이블 확인
SELECT * FROM client;

-- 취미에 null 값이 들어 있는 행 검색
--  고객명, 취미 출력  (현재 NULL 값 없음)
SELECT clientName, clientHobby FROM client
WHERE clientHobby IS NULL;  

alter table client modify clientName varchar(20) null,
                   modify clientHobby varchar(20) null;

-- NULL로 설정
UPDATE client SET clientHobby=null WHERE clientName='호날두';
UPDATE client SET clientHobby=null WHERE clientName='샤라포바';

-- 취미에 null 값이 들어 있는 행 검색
--  고객명, 취미 출력 
SELECT clientName, clientHobby FROM client
WHERE clientHobby IS NULL;  

-- 취미에 NULL 값이 아닌 행 검색
SELECT clientName, clientHobby FROM client
WHERE clientHobby IS NOT NULL;  

-- 취미에 공백이 들어 있는 행 검색
SELECT clientName, clientHobby FROM client
WHERE clientHobby = '';

SELECT clientName, clientHobby FROM client
WHERE clientHobby = '    ';  -- 스페이스 개수 상관없음

-- 논리 (AND, OR)

-- 저자가 '홍길동'이면서 재고가 3권 이상인 모든 도서 출력
SELECT * FROM book
WHERE bookAuthor = '홍길동' AND bookstock >= 3;

-- 저자가 '홍길동'이거나 '성춘향'인 모든 도서 출력
select * from book
where bookAuthor='홍길동' or bookAuthor='성춘향';
-- 또는
SELECT bookName, bookAuthor FROM book
 WHERE bookAuthor IN ('홍길동', '성춘향');

-- 패턴 매칭 (LIKE / NOT LIKE)

-- 출판사 테이블에서 출판사명에 '출판사'가 포함된 모든 행 검색
SELECT * FROM publisher
WHERE pubName LIKE '%출판사%';

-- 고객 테이블에서 출생연도가 1990년대인 모든 행 검색
SELECT * FROM client
WHERE clientBirth LIKE '199%';

-- 고객 테이블에서 이름이 4글자인 모든 행 검색
-- 4글자 : 언더바 4개 (____)
select * from client where clientname like '____'; 

-- 4글자 이상인 행 검색 : 내장함수 char_length() 사용
select * from client where char_length(clientname) >= 4;

-- 도서 테이블에서 도서명에 '안드로이드'가 들어 있지 않는 도서의 도서명 출력
SELECT * FROM book WHERE bookName NOT LIKE '%안드로이드%';
-- 또는
SELECT * FROM book
 WHERE NOT bookName LIKE '%안드로이드%';
-- 또는
SELECT * FROM book
WHERE !(bookName LIKE '안드로이드%');

