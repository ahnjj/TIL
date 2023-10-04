CREATE TABLE flower(
	flowerNo VARCHAR(10) NOT NULL PRIMARY KEY,
	flowerName VARCHAR(30),
	flowerInfo LONGTEXT,
	flowerImage LONGBLOB
);

INSERT INTO flower VALUES('f001', '장미',
LOAD_FILE('/Users/jeong_ahn/TIL/dbWorkspace/rose.txt'),
LOAD_FILE('/Users/jeong_ahn/TIL/dbWorkspace/rose.jpg'));

-- file upload /download 경로 변수 확인
SHOW variables LIKE 'secure_file_priv';