--게시판
CREATE TABLE board_cafe2(
num NUMBER PRIMARY KEY,
writer VARCHAR2(100) NOT NULL,
title VARCHAR2(100) NOT NULL,
content CLOB,
viewCount NUMBER,
regdate DATE
);
ALTER TABLE board_cafe2 ADD(likeCnt NUMBER);

CREATE SEQUENCE board_cafe_seq2;

--댓글 정보를 저장할 테이블
CREATE TABLE board_cafe_comment2(
	num NUMBER PRIMARY KEY,
	writer VARCHAR2(100),
	content VARCHAR2(500),
	target_id VARCHAR2(100),
	ref_group NUMBER,	--그룹번호
	comment_group NUMBER,
	deleted CHAR(3) DEFAULT 'no',	--댓글이 삭제되었는지 여부
	regdate DATE
);

--좋아요 기능을 넣을 테이블
CREATE TABLE board_cafe_like(
    num	NUMBER PRIMARY KEY, 
    boardNum NUMBER NOT NULL,    
    name VARCHAR2(100) NOT NULL,
    like_check NUMBER DEFAULT 0 NULL 
);
FOREIGN KEY (usersName) REFERENCES users2 (name),
FOREIGN KEY (boardNum) REFERENCES board_cafe2 (num)

-- 회원 저장 저장할 테이블
CREATE TABLE users2(
email VARCHAR2(100) NOT NULL,
name VARCHAR2(100) PRIMARY KEY,
pwd VARCHAR2(100) NOT NULL,
regdate DATE
);
-- users2 테이블의 primary key 값을 생성할 시퀀스
CREATE SEQUENCE users2_seq;
