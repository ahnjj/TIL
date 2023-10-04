
-- 1. 모든 도서에 대하여 도서의 도서번호, 도서명, 출판사명 출력
SELECT B.bookNo, B.bookName, P.pubName
FROM book AS B
	INNER JOIN publisher AS P ON B.pubNo = P.pubNo

-- 2. '서울 출판사'에서 출간한 도서의 도서명, 저자명, 출판사명 출력 (조건에 출판사명 사용)
SELECT B.bookName AS 도서명, B.bookAuthor AS 저자명, P.pubName AS 출판사명 
FROM book AS B
	INNER JOIN publisher AS P ON B.pubNo = P.pubNo
WHERE P.pubName = '서울 출판사'

-- 3. '정보출판사'에서 출간한 도서 중 판매된 도서의 도서명 출력 (중복된 경우 한 번만 출력) (조건에 출판사명 사용)
SELECT DISTINCT B.bookName AS 도서명
FROM book AS B
	INNER JOIN publisher AS P ON B.pubNo = P.pubNo
    LEFT JOIN booksale AS BS ON B.bookNo = BS.bookNo
WHERE P.pubName = '정보출판사' AND BS.bsNo IS NOT NULL


-- 4. 도서가격이 30,000원 이상인 도서를 주문한 고객의 고객명, 도서명, 도서가격, 주문수량 출력
SELECT C.clientName AS 고객명, B.bookName AS 도서명, B.bookPrice AS 도서가격, BS.bsQty AS 주문수량
FROM booksale AS BS
	 INNER JOIN client AS C ON BS.clientNo = C.clientNo
     INNER JOIN book AS B ON BS.bookNo = B.bookNo
WHERE B.bookPrice >= 30000


-- 5. '안드로이드 프로그래밍' 도서를 구매한 고객에 대하여 도서명, 고객명, 성별, 주소 출력 (고객명으로 오름차순 정렬)
SELECT B.bookName AS 도서명, C.clientName AS 고객명, C.clientGender AS 성별, C.clientAddress AS 주소
FROM booksale AS BS
	 INNER JOIN client AS C ON BS.clientNo = C.clientNo
     INNER JOIN book AS B ON BS.bookNo = B.bookNo
WHERE B.bookName = '안드로이드 프로그래밍'
ORDER BY C.clientName