--사용자 테이블 -> BG_MEMBER

SELECT * 
FROM BG_MEMBER;

DELETE FROM BG_MEMBER
WHERE SEQ=102;


DROP TABLE BG_MEMBER
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BG_MEMBER;

CREATE TABLE BG_MEMBER(
	SEQ NUMBER(8) UNIQUE NOT NULL,                     --시퀀스. 정렬용.
	ID VARCHAR2(50) PRIMARY KEY,                        --아이디
    PW VARCHAR2(50) NOT NULL,                           --패스워드
    CALL_NUMBER VARCHAR2(50) UNIQUE NOT NULL,  --전화번호.
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


--Q&A 게시판 테이블 -> BG_QNA
DROP TABLE BG_QNA
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BG_QNA;

CREATE TABLE BG_QNA(
    SEQ NUMBER(8) PRIMARY KEY,                --시퀀스
    ID VARCHAR2(50) NOT NULL,                  --아이디. 외래키
    WDATE DATE NOT NULL,                        --작성일
    TITLE VARCHAR2(200) NOT NULL,             --제목
    CONTENT VARCHAR2(4000) NOT NULL,      --내용
    READCOUNT NUMBER(8) NOT NULL,          --조회수
    IS_SECRET NUMBER(1) NOT NULL,             --비밀글 여부 (0 : 아님 / 1 : 비밀글)
    THIS_PASSWORD VARCHAR2(50),               --비밀글일때 패스워드
    DEL NUMBER(1) NOT NULL                     --삭제여부 (0 : X / 1 : 계정 탈퇴)
);

CREATE SEQUENCE SEQ_BG_QNA
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_QNA
ADD CONSTRAINT FK_BG_QNA_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);


--공지사항 게시판 테이블 -> BG_NOTICE
DROP TABLE BG_NOTICE
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BG_NOTICE;

CREATE TABLE BG_NOTICE(
    SEQ NUMBER(8) PRIMARY KEY,                --시퀀스
    ID VARCHAR2(50) NOT NULL,                  --아이디. 외래키
    WDATE DATE NOT NULL,                        --작성일
    TITLE VARCHAR2(200) NOT NULL,             --제목
    CONTENT VARCHAR2(4000) NOT NULL,      --내용
    READCOUNT NUMBER(8) NOT NULL,          --조회수
    DEL NUMBER(1) NOT NULL                     --삭제여부 (0 : X / 1 : 계정 탈퇴)
);

CREATE SEQUENCE SEQ_BG_NOTICE
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_NOTICE
ADD CONSTRAINT FK_BG_NOTICE_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);



--결제 기록 테이블 -> BG_Payment_record
DROP TABLE BG_PAYMENT_RECORD
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BG_PAYMENT_RECORD;

CREATE TABLE  BG_PAYMENT_RECORD(
    SEQ NUMBER(8) PRIMARY KEY,                --시퀀스
    ID VARCHAR2(50) NOT NULL,                  --아이디. 외래키
    USETIME NUMBER(4) NOT NULL,              --사용시간 (분단위로 측정)
    USEDATE DATE NOT NULL,                      --이용날자
    PRICE NUMBER(8) NOT NULL,                  --총 가격
    BONUSCREDIT NUMBER(8) NOT NULL      -- 이 결제로 마일리지가 얼마나 적용되는지.
);

CREATE SEQUENCE SEQ_BG_PAYMENT_RECORD
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_PAYMENT_RECORD
ADD CONSTRAINT FK_BG_PAYMENT_RECORD_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);



--매장 테이블 -> BG_Table
DROP TABLE BG_TABLE
CASCADE CONSTRAINTS;

CREATE TABLE  BG_TABLE(
    TABLENUMBER NUMBER(4) PRIMARY KEY,     --테이블 번호
    NUMBERPEOPLE NUMBER(4) NOT NULL,        --최대 이용 가능 인원수
    ISRESERVAITONTABLE NUMBER(1) NOT NULL  --예약전용 테이블인가? (0 : 아님 / 1 : 맞음)
);




--Q&A 댓글 테이블 -> BG_QNA_COMMENTS
DROP TABLE BG_QNA_COMMENTS
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BG_QNA_COMMENTS;

CREATE TABLE BG_QNA_COMMENTS(
    SEQ NUMBER(8) PRIMARY KEY,                --시퀀스
    ID VARCHAR2(50) NOT NULL,                  --아이디. 외래키 해당 유저가 관리자인지 유저인지 찾아낼 것.
    WDATE DATE NOT NULL,                        --작성 날짜   
    QNANUMBER NUMBER(8) NOT NULL,         --QNA 테이블의 어떤 글에 댓글인지. 외래키
    CONTENT VARCHAR2(500) NOT NULL,        --댓글 내용.
    DEL NUMBER(1) NOT NULL                     --삭제여부 (0 : X / 1 : 삭제)
);

CREATE SEQUENCE SEQ_BG_QNA_COMMENTS
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_QNA_COMMENTS
ADD CONSTRAINT FK_BG_QNA_COMMENTS_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);

ALTER TABLE BG_QNA_COMMENTS
ADD CONSTRAINT FK_BG_QNA_COMMENTS_QNANUMBER FOREIGN KEY(QNANUMBER)
REFERENCES BG_QNA(SEQ);



--후기 게시판 테이블 -> BG_epilogue
DROP TABLE BG_EPILOGUE
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BG_EPILOGUE;

CREATE TABLE BG_EPILOGUE(
    SEQ NUMBER(8) PRIMARY KEY,               
    ID VARCHAR2(50) NOT NULL, 
    REF NUMBER(8) NOT NULL,
	STEP NUMBER(8) NOT NULL,
	DEPTH NUMBER(8) NOT NULL,
    THUMBNAIL VARCHAR2(200) NOT NULL,     
    TITLE VARCHAR2(200) NOT NULL,  
    CONTENT VARCHAR2(4000) NOT NULL, 
    WDATE DATE NOT NULL, 
    DEL NUMBER(1) NOT NULL,
    READCOUNT NUMBER(8) NOT NULL                     
);

CREATE SEQUENCE SEQ_BG_EPILOGUE
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_EPILOGUE
ADD CONSTRAINT FK_BG_EPILOGUE_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);



--예약기록 테이블 -> BG_Reservation
DROP TABLE BG_RESERVATION
CASCADE CONSTRAINTS;

DROP SEQUENCE SEQ_BG_RESERVATION;

CREATE TABLE BG_RESERVATION(
    SEQ NUMBER(8) PRIMARY KEY,                --시퀀스
    ID VARCHAR2(50) NOT NULL,                  --아이디. 외래키
    WDATE DATE NOT NULL,                        --예약을 작성한 날짜   
    RDATE DATE NOT NULL,                         --예약날짜 년도, 월, 일까지만 꺼내올 수 있으면 된다.
    STARTTIME NUMBER(2) NOT NULL,            --해당 날짜의 예약 시작 시간.
    ENDTIME NUMBER(2) NOT NULL,               --해당 날짜 예약 종료 시간
    TABLENUMBER NUMBER(4),                      --예약한 테이블 번호. 외래키.
    MEMO VARCHAR2(500) NOT NULL,            --짤막하게 요청하는 메모
    NUMBERPEOPLE NUMBER(4) NOT NULL,      --예약한 인원수.
    DEL NUMBER(1) NOT NULL                     --삭제여부 (0 : X / 1 : 계정 탈퇴 (예약 취소 or 기간 초과)
);

CREATE SEQUENCE SEQ_BG_RESERVATION
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_RESERVATION
ADD CONSTRAINT FK_BG_RESERVATION_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);

ALTER TABLE BG_RESERVATION
ADD CONSTRAINT FK_BG_RESERVATION_TABLENUMBER FOREIGN KEY(TABLENUMBER)
REFERENCES BG_TABLE(TABLENUMBER);









--작업과 무관한 임시 테스트 용 테이블 -> SmartEditor 테스트용
DROP TABLE TTTTT
CASCADE CONSTRAINTS;

CREATE TABLE TTTTT(  
    TITLE VARCHAR2(200) NOT NULL,
    CONTENT VARCHAR2(4000) NOT NULL
);















