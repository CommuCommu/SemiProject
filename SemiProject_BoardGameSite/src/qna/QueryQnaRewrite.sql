--Q&A 게시판 테이블 -> BG_QNA
DROP TABLE BG_QNA
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BG_QNA;

CREATE TABLE BG_QNA(
    SEQ NUMBER(8) PRIMARY KEY,                --시퀀스
    ID VARCHAR2(50) NOT NULL,                  --아이디. 외래키
    TITLE VARCHAR2(200) NOT NULL,             --제목
    CONTENT VARCHAR2(4000) NOT NULL,      --내용
    WDATE DATE NOT NULL,                        --작성일
    READCOUNT NUMBER(8) NOT NULL,          --조회수
    IS_SECRET NUMBER(1) NOT NULL,             --비밀글 여부 (0 : 아님 / 1 : 비밀글)
    IS_ANSWER NUMBER(1) NOT NULL,			-- 관리자의 답변 여부(0 : 답변하지 않음 / 1 : 답변함)
    DEL NUMBER(1) NOT NULL,                     --삭제여부 (0 : X / 1 : 계정 탈퇴)
    BESTQNA NUMBER(1) NOT NULL				-- 관리자가 지정한 베스트 질문 여부 (0 : X / 1 : 베스트 지정)
);

CREATE SEQUENCE SEQ_BG_QNA
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_QNA
ADD CONSTRAINT FK_BG_QNA_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);

SELECT * FROM BG_QNA
DELETE FROM BG_QNA
delete from BG_QNA where seq=1;


SELECT * FROM BG_QNA



SELECT * FROM BG_MEMBER

CREATE TABLE BG_MEMBER(
	SEQ NUMBER(8) UNIQUE NOT NULL,                     --시퀀스. 정렬용.
	ID VARCHAR2(50) PRIMARY KEY,                        --아이디
    PW VARCHAR2(50) NOT NULL,                           --패스워드
    CALL_NUMBER VARCHAR2(50) UNIQUE NOT NULL,  		--전화번호.
    NAME VARCHAR2(50) NOT NULL,                       --이름
    EMAIL VARCHAR2(100) NOT NULL,                      --이메일
    BONUSCREDIT NUMBER(8) NOT NULL,                  --마일리지
    REGDATE DATE NOT NULL,                                --가입날짜
    AUTH NUMBER(2) NOT NULL,                             --권한 (0 : 사용자 / 1 : 관리자)
    DEL NUMBER(1) NOT NULL                               --삭제 여부 (0 : X / 1 : 계정 탈퇴)
);
    
CREATE SEQUENCE SEQ_BG_MEMBER
START WITH 1
INCREMENT BY 1;

INSERT INTO BG_MEMBER (SEQ, ID, PW, CALL_NUMBER, NAME, EMAIL, BONUSCREDIT, REGDATE, AUTH, DEL)
VALUES (SEQ_BG_MEMBER.NEXTVAL, 'cc', 'cc', '01112345678', 'Usercc', 'cc@gmail.com', 500, SYSDATE, 0, 0);


SELECT SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, IS_SECRET, IS_ANSWER, DEL, BESTQNA
FROM (SELECT ROW_NUMBER()OVER(ORDER BY WDATE) AS RNUM, SEQ, ID, TITLE, CONTENT, WDATE, READCOUNT, IS_SECRET, IS_ANSWER, DEL, BESTQNA
				FROM BG_QNA 
				ORDER BY WDATE) 
WHERE RNUM>=1;



SELECT * FROM BG_QNA_COMMENTS