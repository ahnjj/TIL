-- 서브 쿼리 (Subquery)

-- 단일행 서브쿼리 (=)

-- 고객명 '호날두'의 주문수량 조회
-- (1) 서브 쿼리 : client 테이블에서 고객명으로 검색해서 clientNo 찾음
-- (2) 메인 쿼리 : bookSale 테이블에서 찾은 clientNo에 해당되는 정보를 출력 
-- 주문일, 주문수량 출력
SELECT clientNo, bsDate, bsQty
FROM bookSale
WHERE clientNo = (SELECT clientNo
				  FROM client
				  WHERE clientName = '호날두');
                  
-- 고객 호날두가 주문한 총주문ㄴ수량 출력
-- (1) 서브 쿼리 : client 테이블에서 고객명으로 검색해서 clientNo 찾음
-- (2) 메인 쿼리 : bookSale 테이블에서 찾은 clientNo에 해당되는 총주문수량 계산

select sum(bsqty) as 총주문수량
from booksale 
where clientno = (select clientno 
					from client 
					where clientname= '호날두');

-- 가장 비싼 도서의 도서명과 가격 출력 
-- (1) MAX() 도서 찾아서
-- (2) 해당 도서의 도서명과 가격 출력
SELECT bookName, bookPrice
FROM book
WHERE bookPrice = (SELECT MAX(bookPrice) FROM book);

-- 단일 행 서브쿼리 : 비교연산자 > 사용
-- 도서의 평균가격 보다 가격이 큰 모든 도서 출력 
-- (1) 평균 가격 구해서
-- (2) 평균 가격보다 큰 가격의 도서 정보 출력 
-- 도서명, 도서가격 
SELECT bookName, bookPrice
FROM book
WHERE bookPrice > (SELECT AVG(bookPrice) FROM book);

-- 평균 도서가격
SELECT AVG(bookPrice) 평균도서가격
FROM book;

-- 다중 행 서브쿼리 (IN / NOT IN) : 여러 행 반환 시 사용
-- 단일 행 반환 시에 사용해도 됨 
-- 서브쿼리 결과가 단일행인지 다중행인지 모를 경우 IN 사용하면 됨 

-- 도서를 구매한 적이 있는 고객의 고객명 출력 
-- bookSale에 있는 clientNo는 모두 구매한 고객 
-- (1) bookSale에 있는 모든 clientNo 선택
-- (2) client 테이블에서 clientNo에 해당되는 고객의
-- 고객번호, 고객명 출력 
SELECT clientNo, clientName
FROM client
WHERE clientNo IN (SELECT clientNo  -- 여러 행 반환
				   FROM bookSale);

-- 서브쿼리에서 여러 행을 반환하는데 =로 받으면 오류
SELECT clientNo, clientName
FROM client
WHERE clientNo = (SELECT clientNo  -- 여러 행 반환
				   FROM bookSale);

-- 한 번도 주문한 적이 없는 고객의 고객번호, 고객명 출력 
SELECT clientNo, clientName
FROM client
WHERE clientNo NOT IN(SELECT clientNo -- 여러 행 반환
				      FROM bookSale);

-- 도서명이 '안드로이드 프로그래밍'인 도서를 구매한 고객의 고객명을 출력 
-- 고객번호와 고객명 출력 
-- 현재 '안드로이드 프로그래밍' 도서가 한 권만 있으므로 = 연산자 사용 가능
SELECT clientNo, clientName
FROM client 
WHERE clientNo IN (SELECT clientNo 
				   FROM bookSale 
                   WHERE bookNo = (SELECT bookNo -- 단일 행 반환 (= 사용해도 됨)
								   FROM book 
								   WHERE bookName = '안드로이드 프로그래밍'));

SELECT clientNo, clientName
FROM client 
WHERE clientNo IN (SELECT clientNo 
				   FROM bookSale 
                   WHERE bookNo IN (SELECT bookNo -- 단일 행 반환 (IN 사용해도 됨)
								   FROM book 
								   WHERE bookName = '안드로이드 프로그래밍'));
                                   
                                   
-- '안드로이드' 관련 도서를 구매한 고객의 고객명을 출력 
-- 고객번호와 고객명 출력 
SELECT clientNo, clientName
FROM client
WHERE clientNo IN (SELECT clientNo 
				   FROM booksale
				   WHERE bookNo IN (SELECT bookNo  -- 여러 행 반환
									FROM book
								    WHERE bookName LIKE '%안드로이드%'));

-- 고객명으로 정렬 추가
-- '안드로이드' 관련 도서를 구매한 고객의 고객명을 출력 
-- 고객번호와 고객명 출력 
SELECT clientNo, clientName
FROM client
WHERE clientNo IN (SELECT clientNo 
				   FROM booksale
				   WHERE bookNo IN (SELECT bookNo  -- 여러 행 반환
									FROM book
								    WHERE bookName LIKE '%안드로이드%'))
ORDER BY clientName;

-- 다중 행 서브쿼리 (EXISTS / NOT EXISTS)
-- EXISTS : 서브쿼리 결과가 행을 반환하면 참이 되는 연산자 
-- 도서를 구매한 적이 있는 고객 
-- (1) bookSale 테이블에서 조건에 해당되는 행이 존재하면 참 반환
-- (2) client 테이블에서 이 clientNo에 해당되는 고객의 
-- 고객번호, 고객명 출력 
SELECT clientNo, clientName
FROM client
WHERE EXISTS (SELECT clientNo
			  FROM bookSale
              WHERE client.clientNo = bookSale.clientNo);

-- 한 번도 주문한 적이 없는 고객의 고객번호, 고객명 출력 
-- 서브쿼리에 조건에 해당되는 행이 없으면 TRUE 반환 
SELECT clientNo, clientName
FROM client
WHERE NOT EXISTS (SELECT clientNo
			     FROM bookSale
                 WHERE client.clientNo = bookSale.clientNo);

-- NULL 인 경우 IN과 EXISTS 차이
-- NULL 값을 포함한 clientHobby 확인
SELECT clientHobby FROM client;

-- EXISTS : 서브쿼리 결과에 NULL 값 포함
SELECT clientHobby
FROM client
WHERE EXISTS (SELECT clientHobby
			  FROM client);

-- IN : 서브쿼리 결과에 NULL 값이 포함되지 않음
SELECT clientHobby
FROM client
WHERE clientHobby IN (SELECT clientHobby
					  FROM client);

-- ALL 연산자 
-- 검색 조건이 서브쿼리의 결과의 모든 값에 만족하면 참이 되는 연산자
-- 2번 고객이 주문한 도서의 최고 주문수량 보다 더 많은 도서를 구입한 고객의
-- 고객번호, 주문번호, 주문수량 출력 
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ALL (SELECT bsQty
				   FROM bookSale
                   WHERE clientNo = '2');
-- '2'번 고객 3번 주문 : 5개, 2개, 2개 
-- > ALL : 최고 주문수량 5보다 더 많이 주문한 고객
-- 7번 고객이 7개 주문

-- ANY 연산자
-- 2번 고객보다 한 번이라도 더 많은 주문을 한 적이 있는 고객의 
-- 고객번호, 주문번호, 주문수량 출력 
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ANY (SELECT bsQty
				   FROM bookSale
                   WHERE clientNo = '2');
-- '2'번 고객 3번 주문 : 5개, 2개, 2개
-- ANY : 2개 보다 크면 됨

-- 2번 고객 제외
SELECT clientNo, bsNo, bsQty
FROM bookSale
WHERE bsQty > ANY (SELECT bsQty
				   FROM bookSale
                   WHERE clientNo = '2')
	  AND clientNo != '2';


-- 서브쿼리 연습문제
-- 1. 고객 '호날두'가 주문한 도서의 총 구매량 출력 
select sum(bsqty) 총구매량
from booksale
where clientno in (select clientno  -- '호날두'가 1명인 경우 = 사용해도 됨
				   from client 
                   where clientname = '호날두');

-- 2. '정보출판사'에서 출간한 도서를 구매한 적이 있는 고객명 출력
select clientname 
from  client
where clientno in (select clientno 
                   from booksale 
			       where bookno in (select bookno 
									from book 
								    where pubno in (select pubno 
													from publisher 
													where pubname='정보출판사')));

-- 3. 고객 '베컴'이 주문한 도서의 최고 주문수량보다 더 많은 도서를 구매한 고객명 출력
select clientname 
from client 
where clientno in (select clientno 
				   from booksale
				   where bsqty > all (select bsqty 
									  from booksale 
									  where clientno in (select clientno 
                                                         from client 
                                                         where clientname= '베컴')));
-- 또는 MAX() 사용 
select clientName 
from client
where clientNo in ( select clientNo 
				    from booksale 
					where bsQty > (select max(bsQty) 
								   from booksale 
							       where clientNo = (select clientNo 
													 from client
                                                     where clientName='베컴') ) );

-- 4. 서울에 거주하는 고객에게 판매한 도서의 총판매량 출력 
select sum(bsqty) 
from booksale 
where clientno in (select clientno 
				   from client 
				   where clientaddress like '%서울%');


-- -------------------------------------------------------

-- 스칼라 서브쿼리 : 결과값을 단일 열의 스칼라 값으로 반환
-- 고객별로 총주문수량 출력
-- 고객번호, 고객명, 총주문수량 
SELECT clientNo, (SELECT clientName
				  FROM client
                  WHERE client.clientNo= bookSale.clientNo) AS '고객명', SUM(bsQty)
FROM bookSale
GROUP BY clientNo;

-- 스칼라 서브쿼리 결과값으로 반환되는 열은 1개이어야 함
-- 2개이상인 경우 오류 
SELECT clientNo, (SELECT clientName, clientAddress
				  FROM client
                  WHERE client.clientNo= bookSale.clientNo) AS '고객명', SUM(bsQty)
FROM bookSale
GROUP BY clientNo;

-- 스칼라 서브쿼리 사용 : 도서명 추출에 사용
-- 도서별로 총주문수량 출력
-- 도서번호, 도서명, 총주문수량 
-- 대상 : 주문된 도서
select bookNo 도서번호, 
       (select bookName 
       from book 
       where bookSale.bookNo = book.bookNo) 도서명, 
       sum(bsQty) 총주문수량
from bookSale
group by bookNo;

-- 대상 : 모든 도서
-- 주문한 적이 없는 도서에 대해서는 null 값이 출력 
select bookno, bookname, 
       (select sum(bsqty) 
        from booksale 
        where booksale.bookno = book.bookno group by bookno) 총주문수량
from book
group by bookno;


-- 인라인 뷰 서브쿼리
-- FROM 절에서 사용
-- 테이블명 대신 인라인 뷰 서브쿼리 결과(가상 테이블) 사용
-- (전체 테이블 다 사용하지 않고, 일부분인 가상 테이블 사용)
-- 도서가격이 25,000이상인 도서에 대하여
-- 도서별로 도서명, 도서가격, 총판매수량, 총판매액 출력 
SELECT book.bookNo, bookName, 
	   SUM(bsQty) 총판매수량, 
       SUM(bookPrice * bsQty) 총판매액
FROM (SELECT bookNo, bookName, bookPrice
	  FROM book
      WHERE bookPrice >= 25000) book, bookSale
WHERE book.bookNo = bookSale.bookNo
GROUP BY book.bookNo
ORDER BY 총판매액 DESC;

-- 인라인 뷰 서브쿼리 사용 : book, client 테이블 사용
-- 3개 테이블 사용하므로 외래키 제약조건 2개 지정
-- 서울에 거주하는 고객이 
-- 도서가격이 25,000이상인 도서에 대하여 주문한
-- 도서별로 도서명, 도서가격, 총주문수량, 총주문액 출력 
SELECT booksale.bookNo, bookName, 
       SUM(bsQty) 총판매수량, SUM(bookPrice * bsQty) 총판매액
FROM (SELECT bookNo, bookName, bookPrice
	  FROM book
      WHERE bookPrice >= 25000) book, booksale,
      (SELECT clientNo
       FROM client
       WHERE clientAddress = '서울') client
WHERE book.bookNo = booksale.bookNo AND booksale.clientNo = client.clientNo
GROUP BY book.bookNo
ORDER BY 총판매액 DESC;

-- 또는 
select b.bookno, b.bookname,
       sum(bsqty) 총판매수량, sum(bookprice*bsqty) 총판매액
from (select bookno,bookname,bookprice 
      from book 
	  where bookprice >= 25000) b, 
      booksale,
     (select clientno, clientaddress 
      from client 
      where clientaddress like '%서울%') c
where b.bookno = booksale.bookno and c.clientno = booksale.clientNo
group by b.bookno
order by 총판매액 desc;





