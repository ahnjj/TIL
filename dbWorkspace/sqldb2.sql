-- MySQL dump 10.13  Distrib 8.0.33, for Win64 (x86_64)
--
-- Host: localhost    Database: sqldb2
-- ------------------------------------------------------
-- Server version	8.0.33

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `boardNo` int NOT NULL AUTO_INCREMENT,
  `boardTitle` varchar(30) NOT NULL,
  `boardWriter` varchar(20) DEFAULT NULL,
  `boardContent` varchar(200) DEFAULT NULL,
  `boardDate` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`boardNo`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
INSERT INTO `board` VALUES (1,'사용후기','홍길동','좋아요','2023-09-22 10:10:31');
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `book`
--

DROP TABLE IF EXISTS `book`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `book` (
  `bookNo` varchar(10) NOT NULL,
  `bookName` varchar(30) NOT NULL,
  `bookPrice` int DEFAULT '10000',
  `bookDate` date DEFAULT NULL,
  `pubNo` varchar(10) NOT NULL,
  PRIMARY KEY (`bookNo`),
  KEY `FK_book_publisher` (`pubNo`),
  CONSTRAINT `FK_book_publisher` FOREIGN KEY (`pubNo`) REFERENCES `publisher` (`pubNo`),
  CONSTRAINT `book_chk_1` CHECK ((`bookPrice` > 1000))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `book`
--

LOCK TABLES `book` WRITE;
/*!40000 ALTER TABLE `book` DISABLE KEYS */;
INSERT INTO `book` VALUES ('1','데이터베이스',20000,'2022-11-11','1'),('10','파이썬 데이터 과학',24000,'2023-09-05','1'),('2','파이썬',23000,'2023-08-10','1'),('3','알고리즘',35000,'2023-03-11','2'),('4','자바스크립트',22000,'2022-09-11','3'),('5','HTML',18000,'2023-06-20','2'),('6','CSS',20000,'2023-08-10','2'),('7','자바',25000,'2023-09-11','3'),('9','JAVA 프로그래밍',30000,'2022-03-10','1');
/*!40000 ALTER TABLE `book` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `ctmNo` int NOT NULL,
  `ctmName` varchar(30) DEFAULT NULL,
  `ctmPhone` varchar(13) NOT NULL,
  `ctmGender` varchar(5) DEFAULT NULL,
  `ctmYear` int DEFAULT NULL,
  PRIMARY KEY (`ctmNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (1,'홍길동','010-1122-1235','남자',20),(2,'이몽룡','010-2222-5678','남자',24);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `dptNo` varchar(30) NOT NULL,
  `dptName` varchar(30) NOT NULL,
  `dptTel` varchar(13) DEFAULT NULL,
  PRIMARY KEY (`dptNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('1','컴퓨터학과','02-1111-1111'),('2','경영학과','02-2222-2222'),('3','수학과','02-3333-3333');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `product` (
  `prdNo` varchar(10) NOT NULL,
  `prdName` varchar(20) DEFAULT NULL,
  `prdPrice` int DEFAULT NULL,
  `prdMaker` varchar(30) DEFAULT NULL,
  `prdColor` varchar(10) DEFAULT NULL,
  `ctgNo` int DEFAULT NULL,
  PRIMARY KEY (`prdNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES ('1','삼성 냉장고 비스포크',1620000,'삼성전자','새틴 코럴',1),('10','HP 게이밍 노트북',1200000,'HP','흰색',2),('11','32인치 LED 모니터',299000,'LG전자','검정',2),('12','광시야각 LED 모니터',195000,'삼성전자','흰색',2),('13','등산배낭 옵티마',68000,'밀레','자주',4),('14','35L 등산배낭',49000,'(주)셀파','노랑',4),('15','원터치 자동 텐트',58000,'이지트래블러','그린',4),('2','LG 디오스 와인셀러',1367000,'LG전자','검정',1),('3','QLED 8K TV',2175000,'삼성전자','블랙',1),('4','올레드 TV 55',799000,'LG전자','검정',1),('5','UHD TV',2250000,'삼성전자','은색',1),('6','유아용 세발 자전거',76000,'삼천리 자전거','빨강',3),('7','로드 사이클 자전거',150000,'알톤','검정',3),('8','여성용 클래식 자전거',100000,'알톤','핑크',3),('9','노트북9 metal',1390000,'도시바','은색',2);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publisher` (
  `pubNo` varchar(10) NOT NULL,
  `pubName` varchar(30) NOT NULL,
  PRIMARY KEY (`pubNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publisher`
--

LOCK TABLES `publisher` WRITE;
/*!40000 ALTER TABLE `publisher` DISABLE KEYS */;
INSERT INTO `publisher` VALUES ('1','서울 출판사'),('2','강남 출판사'),('3','종로 출판사');
/*!40000 ALTER TABLE `publisher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `student` (
  `stdNo` varchar(30) NOT NULL,
  `stdName` varchar(30) NOT NULL,
  `stdYear` int DEFAULT NULL,
  `stdAddress` varchar(30) DEFAULT NULL,
  `stdBirthDay` varchar(10) DEFAULT NULL,
  `dptNo` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`stdNo`),
  KEY `FK_student_department` (`dptNo`),
  CONSTRAINT `FK_student_department` FOREIGN KEY (`dptNo`) REFERENCES `department` (`dptNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('2018002','이몽룡',4,'서울시 강남구','1998-05-07','1'),('2021004','변학도',1,'서울시 종로구','2000-11-11','2'),('2022003','홍길동',2,'경기도 안양시','1999-11-11','2'),('2023003','성춘향',1,'전라북도 남원시','2002-01-02','3');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-09-26 12:10:36
