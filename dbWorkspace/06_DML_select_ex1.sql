-- SELECT 문 연습문제

-- (1) 고객 테이블에서 고객명, 생년월일, 성별 출력
select clientname, clientbirth, clientgender from client;

-- (2) 고객 테이블에서 주소만 검색하여 출력 (중복되는 주소는 한번만 출력)
select distinct  clientaddress from client;

-- (3) 고객 테이블에서 취미가 '축구'이거나 '등산'인 고객의 고객명, 취미 출력
select clientname, clienthobby from client where clienthobby in ('축구','등산');

-- (4) 도서 테이블에서 저자의 두 번째 위치에 '길'이 들어 있는 저자명 출력 (중복되는 저자명은 한번만 출력)
select distinct bookauthor from book where bookauthor like '_길%';

-- (5) 도서 테이블에서 발행일이 2022년인 도서의 도서명, 저자, 발행일 출력
select bookname,bookauthor,bookdate from book where bookdate like '2022%';
select bookname,bookauthor,bookdate from book where bookdate like '2020%';

-- (6) 도서판매 테이블에서 고객번호1, 2를 제외한 모든 판매 데이터 출력
select * from booksale where clientno not in ('1','2');

-- (7) 고객 테이블에서 취미가 NULL이 아니면서 주소가 '서울'인 고객의 고객명, 주소, 취미 출력
select clientname,clientaddress,clienthobby from client 
	where clienthobby is not null and clientaddress = '서울';
select clientname,clientaddress,clienthobby from client 
	where clienthobby is not null and clientaddress = '%서울%';
    
-- (8) 도서 테이블에서 가격이 25,000원 이상이면서 저자 이름에 '길동'이 들어가는 도서의 도서명, 저자, 가격, 재고 출력
select bookname, bookauthor, bookprice, bookstock from book 
	where bookprice >= 25000 and bookauthor like '%길동%';
    
-- (9) 도서 테이블에서 가격이 20,000 ~ 25,000원인 모든 도서 출력 
select * from book where bookprice between 20000 and 25000;

-- (10) 도서 테이블에서 저자명에 '길동'이 들어 있지 않는 도서의 도서명, 저자 출력
select bookname, bookauthor from book where bookauthor not like '%길동%';

