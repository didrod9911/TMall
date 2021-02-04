
CREATE TABLE PRODUCT(
	sSeq		NUMBER			PRIMARY KEY,
	sID			VARCHAR2(20),
	sNickname	VARCHAR2(20),
	language	VARCHAR2(20),
	sGender		NUMBER(1),
	sAge		NUMBER(3),
	className	VARCHAR2(100),
	classTime	NUMBER(10),
	classNum	NUMBER(10),
	classPlace	VARCHAR2(100),
	classPrice	NUMBER(10),
	classData	LONG
);

CREATE SEQUENCE p_seq				-- 시퀀스 생성
    START WITH 1                    -- 시작값은 1
    INCREMENT BY 1                  -- 1씩 증가
    MAXVALUE 100000                 -- 최대값은 100000
    MINVALUE 1                      -- 최소값은 1(여기선 증가라 의미는없음)
    NOCYCLE;                        -- 반복시키지 않음(10만까지 가면 끝)
    
Drop table product;
DROP SEQUENCE p_seq;
COMMIT;