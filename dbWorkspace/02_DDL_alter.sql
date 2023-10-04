-- ALTER 문alter

-- 열 추가 : student table에 stdTel 열 추가
ALTER TABLE student ADD stdTel VARCHAR(13);
describe student;

-- multiple column 추가 : stdAge, stdAddress2
ALTER TABLE student ADD (stdAge VARCHAR(2), stdAddress2 VARCHAR(50));

-- column의 data type변경 : stdAge 열의 데이터타입을 INT로 변경
ALTER TABLE student MODIFY stdAge INT;

-- 열의 제약조건 변경 : stdName NOT NULL로 변경
ALTER TABLE student MODIFY stdName VARCHAR(20) NOT NULL;

-- 열 이름 변경 : stdTel을 stdHP로 변경(data type 적으면 안됨)
ALTER TABLE student RENAME COLUMN stdTel TO stdHP;

-- 열 이름과 타입 변경 : stdAddress -> stdAddress1로 변경
ALTER TABLE student CHANGE stdAddress stdAddress1 VARCHAR(30);

-- 열 삭제 : stdHP 열 삭제
ALTER TABLE student DROP COLUMN stdHP;

-- 여러개 열 삭제: drop 열 이름
ALTER TABLE student DROP stdAge,
					DROP stdAddress1,
                    DROP stdAddress2;
                    
-- 연습 문제-- 
-- 1
ALTER TABLE product ADD (prdStock INT, prdDate DATE);
-- 2
ALTER TABLE product MODIFY prdCompany NOT NULL;
-- 3
ALTER TABLE publisher ADD (pubPhone INT, pubAddress VARCHAR(20));
-- 4
ALTER TABLE publisher DROP COLUMN pubPhone; 

-- pk 삭제
ALTER TABLE student DROP PRIMARY KEY;

-- fk 삭제
ALTER TABLE student DROP FOREIGN KEY dptId;

-- pk 추가
ALTER TABLE student ADD PRIMARY KEY (stdId);
-- fk 추가
ALTER TABLE student ADD FOREIGN KEY (dptId) REFERENCES department (dptId);
ALTER TABLE student 
		ADD CONSTRAINT FK_student_department 
		FOREIGN KEY (dptId) REFERENCES department (dptId);

-- (1) scores 테이블에서  pk 삭제
-- 외래키 2개 먼저 삭제하고 기본키 삭제
ALTER TABLE scores DROP FOREIGN KEY  FK_score_course;
ALTER TABLE scores DROP FOREIGN KEY  FK_score_student;
ALTER TABLE scores DROP PRIMARY KEY;

-- (2) 기본키 추가
-- fk 2개 추가하고, 기본키 추가
alter table scores add CONSTRAINT FK_score_student 
	FOREIGN KEY (stdId) REFERENCES student(stdId);
alter table scores add CONSTRAINT FK_score_course 
	FOREIGN KEY (courseId) REFERENCES course(courseId);

ALTER TABLE scores ADD PRIMARY KEY (stdId, courseId); -- 복합키

-- 또는
ALTER TABLE scores ADD foreign KEY (stdId) REFERENCES student (stdId);
ALTER TABLE scores ADD foreign KEY (courseId) REFERENCES course (courseId);
ALTER TABLE scores ADD PRIMARY KEY (stdId, courseId);


-- --------------------
/*
ON DELETE

*/

-- student 테이블에 설정된 fk제거하고 on delete cas

ALTER TABLE student DROP FOREIGN KEY FK_student_department;

ALTER TABLE student
	ADD CONSTRAINT FK_student_department 
	FOREIGN KEY (dptId) REFERENCES department (dptId)
    ON DELETE CASCADE;


-- department 테이블에 데이터 삽입
-- 1 수학과
-- 2 영어과

-- student 테이블에 데이터 삽입
-- 2023001 홍길동 1 deptNo(2)
-- 2023002 이몽룡 1 deptNo(1)

-- dept 1 삭제하면 이몽룡 삭제되는지 확인 

