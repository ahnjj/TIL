
/*
	ORDER BY 
	- 특정 열의 값을 기준으로 쿼리 결과 정렬
	- ASC : 오름차순 (디폴트 : 생략 가능)
	- DESC : 내림차순 
*/

-- 도서명 순으로 도서 검색 (기본 : 오름차순 (일반적으로 ASC 생략))
SELECT * FROM book
ORDER BY bookName ASC; 

SELECT * FROM book
ORDER BY bookName;

-- -- 도서명 순으로 내림차순 검색 (내림차순 : DESC)
SELECT * FROM book
ORDER BY bookName DESC;

-- 참고 
SELECT * FROM book
ORDER BY 
(CASE WHEN ASCII(SUBSTRING(bookName, 1)) BETWEEN 48 AND 57 THEN 3
      WHEN ASCII(SUBSTRING(bookName, 1)) < 122 THEN 2 ELSE 1 END), bookName;

-- 대문자 A ~ Z : 65 ~ 90
-- 소문자 a ~ z : 97 ~ 122
-- 숫자 0 ~ 9 : 48 ~ 57

SELECT * FROM book
ORDER BY 
(CASE WHEN ASCII(SUBSTRING(bookName, 1)) BETWEEN 48 AND 57 THEN 3
      WHEN ASCII(SUBSTRING(bookName, 1)) < 122 THEN 2 ELSE 1 END), bookName DESC;

-- -----------------------------------------------------------------

-- 상위 N개만 출력 : LIMIT N
SELECT * FROM book
ORDER BY bookName
LIMIT 5;

-- 또는 OFFSET 사용 (OFFSET 시작 치 ) : 0 첫 번째 시작
SELECT * FROM book
ORDER BY bookName
LIMIT 5 OFFSET 6; -- 6에서 시작해서 5개 행 

-- 또는 LIMIT 시작, 개수
SELECT * FROM book
ORDER BY bookName
LIMIT 0, 5;


-- 도서 테이블에서 재고 수량을 기준으로 내림차순 정렬하여
-- 도서명, 저자, 재고 출력
SELECT bookName, bookAuthor, bookStock FROM book
 ORDER BY bookStock DESC;

-- 2차 정렬
-- 도서 테이블에서 재고 수량을 기준으로 내림차순 정렬하여
-- 도서명, 저자, 재고 출력
-- 재고 수량이 동일한 경우, 다시 저자명으로 오름차순 2차 정렬
SELECT bookName, bookAuthor, bookStock FROM book
 ORDER BY bookStock DESC, bookAuthor ASC;
 
SELECT bookName, bookAuthor, bookStock FROM book
 ORDER BY bookStock DESC, bookAuthor; -- ASC 생략 가능
 
 
 -- --------------------------------------------------------------------
 
 -- 집계 함수
 
 -- SUM() : 합계
 
 -- 도서 테이블에서 총 재고 수량 계산하여 출력
 -- 열 이름 없이 총합만 출력
 SELECT SUM(bookStock) FROM book;
 
 -- 열 이름 지정 : sum of bookStock 
 -- 큰따옴표/작은 따옴표 다 사용 가능
 -- 한글/영문 다 사용 가능
  SELECT SUM(bookStock) AS 'sum of bookStock'
  FROM book;
  
  -- 열이름으로 한글 사용
  SELECT SUM(bookStock) AS '총 재고량'
  FROM book;
  
  -- 큰따옴표 사용
  SELECT SUM(bookStock) AS "총 재고량"
  FROM book;
  
  -- 공백(띄어쓰기) 없으면 따옴표 생략 가능
 SELECT SUM(bookStock) AS 총재고량
  FROM book;
 
 -- AS 생략 가능
  SELECT SUM(bookStock) 총재고량
  FROM book;
 
 -- 도서판매(도서주문) 테이블에서 
 -- 고객번호 2인 호날두가 주문한 도서의 총주문 수량 계산하여 출력
 SELECT SUM(bsQty) AS '호날두의 주문수량' 
 FROM bookSale
 WHERE clientNo='2';
 
 SELECT clientNo, bsQty FROM booksale;
 
 -- 도서판매 테이블에서 최대/최소 주문수량 확인 (출력)
 select max(bsqty) as '최대 주문수량', min(bsqty) as '최소 주문수량' 
 from booksale;
 
 -- 도서 테이블에서 도서의 가격 총액, 평균 가격, 최고가, 최저가 출력 
 select sum(bookPrice) '가격총액', 
		avg(bookPrice) '평균가격', 
        max(bookPrice) '최고가',
        min(bookPrice) '최저가' 
 from book;
 
 -- 평균가격을 정수로 표현 (반올림) : ROUND(숫자, 소수이하 자리수)
select sum(bookPrice) '가격총액', 
		ROUND(avg(bookPrice)) '평균가격', 
        max(bookPrice) '최고가',
        min(bookPrice) '최저가' 
 from book;
 
 -- COUNT() : 행의 수 반환
 -- 뫃든 행의 수를 계산할 때 COUNT(*) 또는 COUNT(bookNo) 
 -- COUNT(기본키) : 기본키는 NULL 값, 빈 값 들어갈 수 없기 때문에 모든 행 포함
 
 -- 도서판매 테이블에서 도서 판매 건수 출력 : "총 판매 건수" (모든 행의 수)
 -- 총 판매 건수 (1개 행이 판매 1건)
 -- 총 판매수량 다름 : 주문수량 다 더한 값
 -- 판매 한 건에서 여러 개 주문 가능
 -- 총 판매 건수 출력
 select count(*) as "판매 건수" from booksale;
 
 -- 총 판매 수량 출력 
 select sum(bsqty) as "총 판매 수량" from booksale;
 
 -- 도서 테이블에서 총 도서 수 출력 (도서 종류 수)
 SELECT COUNT(*) AS '총 도서 수' FROM book; 
 
 -- 고객 테이블에서 총 고객 수 출력 
 SELECT COUNT(*) AS '총 고객 수' FROM client;
 
-- 고객 테이블에서 취미 개수 
-- COUNT(clientHobby) : NULL 값만 제외 (공백 포함)
SELECT COUNT(clientHobby) AS '취미' FROM client;  -- 7

-- 취미 열에서 값이 들어 있는 행의 수
-- NOT IN('') : NULL과 공백 제외
SELECT COUNT(clientHobby) AS '취미' 
FROM client
WHERE clientHobby NOT IN('');  -- 5 
-- 또는
SELECT COUNT(clientHobby) AS '취미' 
FROM client
WHERE clientHobby !=''; 

SELECT clientNo, clientHobby FROM client;

-- ---------------------------------------------------------
-- GROUP BY 절

-- 도서판매 테이블에서 도서번호별로 주문수량 합계 출력 
SELECT bookNo, SUM(bsQty) AS "주문수량 합계"
FROM booksale
GROUP BY bookNo; -- 기본키로 그룹화

-- GROUP BY 다음에 없은 열이름도, SELECT 절에 나올 수 있다 (MySQL)
SELECT bookNo, bookName, SUM(bookStock) AS "총재고수량"
FROM book
GROUP BY bookNo; 

SELECT bookNo, bsQty FROM booksale; 

-- GROUB BY 절에서 정렬
SELECT bookNo, SUM(bsQty) AS "주문수량 합계"
FROM booksale
GROUP BY bookNo
ORDER BY bookNo;

-- 새로 생성된 열 "주문수량 합계"로 정렬
SELECT bookNo, SUM(bsQty) AS "주문수량 합계"
FROM booksale
GROUP BY bookNo
ORDER BY "주문수량 합계"; -- 오류는 없는데 정렬 안 됨

-- ORDER BY 다음에 정렬하는 열이름에 따옴표 사용하면 정렬 안 됨
SELECT bookNo, SUM(bsQty) AS 주문수량합계
FROM booksale
GROUP BY bookNo
ORDER BY 주문수량합계; -- 오름차순 정렬됨

-- 열의 순서값으로 정려하면 가능
SELECT bookNo, SUM(bsQty) AS "주문수량 합계"
FROM booksale
GROUP BY bookNo
ORDER BY 2; -- 두 번째 열로 정렬 


-- ----------------------------------------------------------------------

/*
	HAVING 절
	- HAVING 검색조건
	- GROUP BY 절에 의해 구성된 그룹들에 대해 적용할 조건 기술 
	- SUM, AVG, MAX, MIN, COUNT 등의 집계함수와 함계 사용
	- 주의!
		반드시 GROUP BY 절과 같이 사용
		WHERE 절보다 뒤에 
		검색조건에는 집계함수가 와야 한다
*/

-- 도서 테이블에서 가격이 25000원 이상인 도서에 대하여
-- 출판사별로 출간한 '도서 수 합계' 출력(그룹화). 단, '도서 수 합계'가 2이상 것만 출력  
SELECT pubNo, COUNT(*) AS "도서 수 합계"
FROM book
WHERE bookPrice >= 25000
GROUP BY pubNo
HAVING COUNT(*) >= 2; -- 그룹화 한 것에 대한 조건 (집계함수만 와야 함)

-- HAVING 조건이 없는 경우
SELECT pubNo, COUNT(*) AS "도서 수 합계"
FROM book
WHERE bookPrice >= 25000
GROUP BY pubNo;

-- 연습문제
-- 1. 도서 테이블에서 가격 순으로 내림차순 정렬하여,  도서명, 저자, 가격 출력 (가격이 같으면 저자 순으로 오름차순 정렬)
SELECT bookName, bookAuthor, bookPrice
FROM book 
ORDER BY bookPrice DESC, bookAuthor ASC; -- ASC 생략 가능

-- 2. 도서 테이블에서 저자에 '길동'이 들어가는 도서의 총 재고 수량 계산하여 출력
SELECT SUM(bookStock) AS "총 재고 수량"
FROM book
WHERE bookAuthor LIKE '%길동%';

-- 3. 도서 테이블에서 ‘서울 출판사' 도서 중 최고가와 최저가 출력 
SELECT MAX(bookPrice) AS '최고가', MIN(bookPrice) AS '최저가'
FROM book
WHERE pubNo = '1';

-- 4. 도서 테이블에서 출판사별로 총재고수량과 평균 재고 수량 계산하여 출력 (‘총 재고 수량’으로 내림차순 정렬)
SELECT pubNo, SUM(bookStock) AS 총재고수량, AVG(bookStock) AS 평균재고수량
FROM book
GROUP BY pubNo
ORDER BY 총재고수량 DESC;

-- 평균재고수량을 소수점 이하 두 자리로 표현 : ROUND(숫자, 소수점 이하 자리수)
SELECT pubNo, SUM(bookStock) AS 총재고수량, 
			  ROUND(AVG(bookStock), 2) AS 평균재고수량
FROM book
GROUP BY pubNo
ORDER BY 총재고수량 DESC;

-- 5. 도서판매 테이블에서 고객별로 ‘총 주문 수량’과 ‘총 주문 건수’ 출력. 단 주문 건수가 2이상인 고객만 해당
SELECT clientNo, SUM(bsQty) AS 총주문수량, COUNT(*) AS 총주문건수
FROM booksale
GROUP BY clientNo
HAVING COUNT(*) >= 2;

select clientno, sum(bsQty) as '총주문수량', count(*) as '총주문건량' from booksale
	group by clientNo having count(*) >=2 ;
    
    