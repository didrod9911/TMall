
CREATE TABLE tUSER(
	flag		NUMBER(1),
	id			VARCHAR2(20)		PRIMARY KEY,
	pw			VARCHAR2(20),
	nickname	VARCHAR2(20)		UNIQUE NOT NULL,
	name		VARCHAR2(20),
	tel			VARCHAR2(13),
	address		VARCHAR2(50),
	language	VARCHAR2(20),
	gender		NUMBER(1),
	age			NUMBER(3),
	introduce	VARCHAR2(200)
);
INSERT INTO tUSER VALUES(1, 'buyer12', 'pw1122', 'imbuyer', '구매자1', '010-1111-2222', '주소1', null, 2, 18, '소개1');
INSERT INTO tUSER VALUES(2, 'seller12', 'pw3344', 'imseller', '판매자1', '010-4444-2222', '주소2', 'english', 1, 25, '소개2');
COMMIT;