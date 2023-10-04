-- 서브 쿼-- 단일 행 서브쿼리 (=)
-- 고객명 호날두의 주문 수량 조회
-- (1) sub query : client 테이블에서 고객명으로 검색해서 clientNo찾음
-- (2) main query : bookSale 테이블에서 찾은 clientNo에 해당되는 정보를 출력
-- 주문일, 주문수량 출력
SELECT bsDate, bsQty
FROM bookSale
WHERE clientNo = (SELECT clientNo
				  FROM client
				  WHERE clientName = '호날두');
                  
-- 고객 호날두가 주문한 총 주문수량 출력
-- (1) 서브쿼리 : client 테이블에서 찾은 clientNo에 해당되는
-- (2) 메인쿼리 : bookSale 테이블에서 찾은 clientNo에 해당되는 정보 출력SELECT SUM(bsQty)
FROM bookSale
WHERE clientNo = (SELECT clientNo
				  FROM client
				  WHERE clientName = '호날두');
                  
                  
 -- 가장 비싼 도서의 도서명과 가격 출력
 -- (1) MAX() 도서 찾아서
 -- (2) 해당 도서의 도서명과 가격 출력
 SELECT bookName, bookPrice
 FROM book
 WHERE bookPrice = (SELECT MAX(bookPrice)
					FROM book);
 
 -- 도서의 평균가격 보다 가격이 큰 모든 도서 출력
 -- (1) 평균 가격 구해서
 -- (2) 평균 가격보다 큰 가격의 도서 정보 출력
 -- 도서명, 도서가격
 SELECT bookName, bookPrice
 FROM book
 WHERE bookPrice > (SELECT AVG(bookPrice) FROM book);
 
-- 다중 행 서브쿼리 (IN / NOT IN)
-- 도서를 구매한 적이 있는 고객의 고객명 출력
-- bookSale 에 있는 clientNo는 모두 구매한 고객
-- (1) bookSale에 있는 모든 clientNo선택
-- (2) client 테이블에서 clientNo에 해당되는 고객의 고객번호, 고객명 출력
SELECT clientNo, clientName
FROM client
WHERE clientNo IN (SELECT clientNo FROM bookSale);
                  
-- 한번도 주문한 적이 없는 고객의 고객번호, 고객명 출력
SELECT clientNo, clientName
FROM client
WHERE clientNo NOT IN (SELECT clientNo FROM bookSale);  -- 여러행 반환
                  
-- 도서명이 '안드로이드 프로그래밍'인 도서를 구매한 고객의 고객명을 출력
-- 고객번호와 고객명 출력
SELECT clientNo, clientName
FROM client 
WHERE clientNo IN (SELECT clientNo 
				   FROM bookSale 
                   WHERE bookNo = (SELECT bookNo 
								   FROM book 
								   WHERE bookName = '안드로이드 프로그래밍'));

-- '안드로이드' 관련 도서를 구매한 고객의 고객명, 번호 출력
SELECT clientNo, clientName
FROM client 
WHERE clientNo IN (SELECT clientNo 
				   FROM bookSale 
                   WHERE bookNo IN (SELECT bookNo 
								   FROM book 
								   WHERE bookName LIKE '%안드로이드%'));
                                   
                                   
-- EXIST
-- 서브쿼리 결과가 행을 반환하면 참이 되는 연산자
-- 도서를 구매한 적이 있는 고객
-- 1 도서 구매했는지 여부 (TRUE/ False)
-- 2 고객 정
SELECT clientNo, clientName
FROM client
WHERE EXISTS (SELECT clientNo
			  FROM bookSale
			  WHERE client.clientNo = bookSale.clientNo);

-- 한번도 주문한 적이 없는 고객의 정보 출력
SELECT clientNo, clientName
FROM client
WHERE NOT EXISTS (SELECT clientNo
				  FROM bookSale
				  WHERE client.clientNo = bookSale.clientNo);
                  
SELECT clientHobby
FROM client
WHERE EXISTS (SELECT clientHobby
			  FROM client);

-- IN : 서브쿼리 결과에 NULL값이 포함되지 않음



-- ALL
-- 2번 고객이 주문한 도서의 최고 주문수량 보다 더 많은 도서를 구입한 고객의 고객번호/ 주문번호/주문수량
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ALL (SELECT bsQty
				   FROM bookSale
                   WHERE clientNo = '2');
-- 2번 고객 : 3번 주문 - 5개, 2개, 2개
-- > ALL : 최고 주문수량 5보다 더 많이 주문한 고객
-- 7번 고객이 7개 주문

-- ANY 
-- 2번 고객보다 한 번이라도 더 많은 주문을 한 적있는 고객의 정보
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ANY (SELECT bsQty
				   FROM bookSale
                   WHERE clientNo = '2')
	AND clientNo != '2';   -- 본인 제외하기 

-- 서브쿼리 연습문제
-- 1. 고객 '호날두'가 주문한 도서의 총 구매량 출력 
SELECT SUM(bsQty)
FROM bookSale
WHERE clientNo = ( SELECT clientNo
				   FROM client
				   WHERE clientName = '호날두')


-- 2. '정보출판사'에서 출간한 도서를 구매한 적이 있는 고객명 출력
SELECT clientName
FROM client
WHERE clientNo IN (SELECT clientNo
					FROM bookSale
					WHERE bookNo IN (SELECT bookNo 
								  FROM Book 
								  WHERE pubNo = (SELECT pubNo 
											     FROM publisher
											     WHERE pubName = '정보출판사')))

-- 3. 고객 '베컴'이 주문한 도서의 최고 주문수량보다 더 많은 도서를 구매한 고객명 출력
SELECT clientName
FROM client
WHERE clientNo IN (SELECT clientNo
				FROM bookSale
				WHERE bsQty > ALL (SELECT bsQty
								   FROM bookSale
								   WHERE clientNo = (SELECT clientNo FROM client WHERE clientName='베컴')));


-- 4. 서울에 거주하는 고객에게 판매한 도서의 총판매량 출력
SELECT SUM(bsQty)
FROM bookSale
WHERE clientNo IN (SELECT clientNo 
			FROM client 
			WHERE clientAddress = '서울');


-- 스칼라 서브 쿼리 : 결과 값을 단일 열의 스칼라 값으로 반환
-- 고객별로 총 주문수량 출력
-- 고객번호, 고객명, 총 주문수량
SELECT clientNo, (SELECT clientName FROM client WHERE client.clientNo=bookSale.clientNo) AS 고객, SUM(bsQty)
FROM bookSale
GROUP BY clientNo;

-- 스칼라 서브쿼리 사용
-- 도서별로 총주문수량 출력
-- 도서번호, 도서명, 총 주문수량
-- 대상 : 주문한 도서
SELECT bookNo, (SELECT bookName FROM book WHERE book.bookNo=bookSale.bookNo) AS 도서\
		, sum(bsQty) AS 총주문수량
FROM bookSale
GROUP BY bookNo


-- 인라인 뷰 서브쿼리
-- 도서 가격이 25,000원 이상인 도서에 대하여
-- 도서별로 도서명, 도서가격, 총판매수량, 총판매액 출력
SELECT book.bookName, book.bookPrice, SUM(bsQty) AS 총판매수량,
		SUM(bookPrice * bsQty) AS 총판매액
FROM (
		SELECT bookNo, bookName, bookPrice
		FROM book
		WHERE bookPrice >= 25000
		) book, bookSale
WHERE book.bookNo = bookSale.bookNo
GROUP BY book.bookNo
ORDER BY 총판매액 DESC;

-- 인라인 뷰 서브쿼리 사용 : Book, client 
-- 서울에 거주하는 고객이
-- 도서가격 25000이상 도서에 대해 주문한 도서별로
-- 도서명, 도서가격, 총주문수량, 총주문액
SELECT book.bookName, book.bookPrice, SUM(bookSale.bsQty) AS 총주문수, SUM(bookSale.bsQty)*book.bookPrice AS 총주문액
FROM (SELECT clientNo
	FROM client
    WHERE client.clientAddress = '서울') client, 
    (SELECT bookNo, bookName, bookPrice
	FROM book
    WHERE book.bookPrice>= 25000) book, bookSale
WHERE book.bookNo = bookSale.bookNo
	AND client.clientNo = bookSale.clientNo 
GROUP BY book.bookNo;


SELECT book.bookName, book.bookPrice, SUM(bookSale.bsQty) AS 총주문수, SUM(bookSale.bsQty)*book.bookPrice AS 총주문액
FROM (SELECT bookName, bookPrice
	FROM book
    WHERE bookPrice>= 25000)book, client, bookSale
WHERE b
	AND client.clientNo = bookSale.clientNo 
GROUP BY book.bookNo

	  

