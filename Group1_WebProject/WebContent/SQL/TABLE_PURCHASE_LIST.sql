
CREATE TABLE PURCHASE_LIST(
	id			VARCHAR2(20),		-- 구매자 ID
	sSeq		NUMBER,				-- 물품 시퀀스
	sID			VARCHAR2(20),		-- 판매자 ID
	sNickname	VARCHAR2(20),		-- 판매자 닉네임
	language	VARCHAR2(20),		-- 물품언어
	className	VARCHAR2(100),		-- 물품 글제목
	classPrice	NUMBER(10),			-- 물품가격
	purchaseCnt	NUMBER(10)			-- 구입횟수
);

COMMIT;