-- 모델링 연습문제
/*
		- 스키마 생성 : modeling_db
        - 테이블 생성
			member : 
            catogory : 번호 / 카테고리명
            product
            cart : 장바구니
            order_info : 주문정보 (수령인, 주소, 전화번호)
            order_product : 주문한 상품정보 
*/
drop table order_product;
drop table order_info;
drop table product;
drop table cart;
drop table member;
drop table category;

CREATE TABLE product (
	prdNo INT NOT NULL PRIMARY KEY,
    prdName VARCHAR(30) NOT NULL,
    prdPrice INT,
    ctgNo VARCHAR(10),
    CONSTRAINT FK_ctgNo FOREIGN KEY (ctgNo) REFERENCES category(ctgNo)
);


CREATE TABLE category (
	ctgNo VARCHAR(10) NOT NULL PRIMARY KEY,
    ctgName VARCHAR(30)
);

CREATE TABLE member (
	memNo INT NOT NULL PRIMARY KEY,
    memName VARCHAR(30) NOT NULL,
    memPhone INT,
    memAddress VARCHAR(30)
);

CREATE TABLE cart (
	cartNo INT NOT NULL PRIMARY KEY,
	memNo INT NOT NULL,
    prdNo INT NOT NULL,
    FOREIGN KEY (prdNo) REFERENCES product(prdNo),
    qty INT
);
CREATE TABLE order_info (
	orderNo INT NOT NULL PRIMARY KEY,
    recipient VARCHAR(30),
    orderDate datetime,
    orderAddress VARCHAR(30),
    orderPhone VARCHAR(30)
);

CREATE TABLE order_product (
	memNo INT NOT NULL PRIMARY KEY,
    orderNo INT NOT NULL,
    prdNo INT,
    qty INT,
	FOREIGN KEY (memNo) REFERENCES member(memNo),
	FOREIGN KEY (orderNo) REFERENCES order_info(orderNo),
    FOREIGN KEY (prdNo) REFERENCES product(prdNo)
);

