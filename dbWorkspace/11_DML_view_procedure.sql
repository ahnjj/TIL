-- 뷰 생성 
CREATE VIEW client_view 
AS
SELECT clientNo, clientName, clientAddress
FROM client;

-- 뷰에서 데이터 조회 (테이블처럼 사용)
SELECT * FROM client_view;

-- 뷰를 통해 데이터 변경 가능
-- (1) 뷰를 통해 INSERT 수행 
-- 열이름 리스트 생략 
INSERT INTO client_view VALUES('10', '케인', '제주');

-- 뷰를 통해 데이터를 insert 하면 원본 테이블의 데이터 변경 
-- 즉, client 테이블에 데이터 추가되는데, 
-- clientNo, clientName, clientAddress 만 값이 저장되고 
-- 나머지 열은 null 값이 저장됨
-- 그런데 NOT NULL 설정되어 있는 열들이 포함되어 있어서 
-- NULL 허용으로 변경 

ALTER TABLE client MODIFY clientAddress varchar(100) NULL;
ALTER TABLE client MODIFY clientGender varchar(2) NULL;

-- 오류 : 뷰에 clientPhone 열은 포함되어 있지 않기 때문에 사용 불가 
INSERT INTO client_view VALUES('10', '케인', '010-1234-1234',  '제주');

describe client;

-- (2) 뷰를 통해 update 수행 
-- 고객번호 '1'의 주소를 '서울시'로 변경 
UPDATE client_view SET clientAddress= '서울시'  WHERE clientNo='1';
SELECT * FROM client_view;
SELECT * FROM client;

-- 뷰에 포함되어 있지 않은 열 수정 시 오류 : 사용 불가  
UPDATE client_view SET clientHobby= '여행'  WHERE clientNo='1';

-- (3) 뷰를 통행 delete 수행 
-- 뷰를 통해 삽입한 데이터 삭제 
DELETE FROM client_view WHERE clientNo='10';

-- 뷰를  통해 삽입하지 않은 원래 있던 데이터도 삭제 가능
DELETE FROM client_view WHERE clientNo='9';


-- 뷰의 구조 변경 : ALTER 문 사용 
ALTER VIEW client_view
AS 
SELECT clientNo, clientName, clientAddress, clientHobby
FROM client;

-- 뷰 연습문제 
-- 자주 사용되는 쿼리문을 뷰로 생성 
-- 뷰 이름 : top5_sales_clients
-- 총주문액 고객 TOP5 출력 
-- 고객번호, 고객명, 총주문수량, 총주문액 출력 
CREATE VIEW top5_sales_clients
AS
SELECT C.clientNo 고객번호, C.clientName 고객명, 
	   SUM(BS.bsQty) 총주문수량, SUM(BS.bsQty * B.bookPrice) 총주문액
FROM booksale BS
	INNER JOIN client C ON C.clientNo = BS.clientNo
    INNER JOIN book B ON B.bookNo = BS.bookNo
GROUP BY BS.clientNo, C.clientName
ORDER BY 총주문액 DESC
LIMIT 5;

SELECT * FROM top5_sales_clients;

-- 또는 
create view top5_sales_client3
as
select bs.clientNo '고객번호', 
	   (select clientName from client where bs.clientNo = clientNo) '고객명', 
       sum(bsqty) '총주문수량',
	   sum((select bookPrice from book where bs.bookNo = bookNo) * bsqty) '총주문액'
from booksale bs
group by bs.clientNo 
ORDER BY 총주문액 DESC
limit 5;

SELECT * FROM top5_sales_client3;

-- 원본 테이블의 데이터 변경 --> 뷰에 바로 반영됨 
-- 고객번호 '4'의 주문수량 5개로 변경 
-- 뷰에 반영되는지 확인 
