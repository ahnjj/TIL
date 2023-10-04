-- DROP 문

-- 테이블 삭제
-- publisher 테이블 삭제
-- fk constraint 설정되어있기 때문에 삭제 시 오류
DROP TABLE publisher;

-- FK constraint 확인할 필요 없도록 설정
SET FOREIGN_KEY_CHECKS = 0;

-- FK constraint 검사하도록 재설정
SET FOREIGN_KEY_CHECKS = 1;