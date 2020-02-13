package dto;

/*
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
*/


public class QnaCommentDto {

	int seq;
	String id;
	String wdate;
	int qnamumber;
	String content;
	int del;
	
	public QnaCommentDto() {
		// TODO Auto-generated constructor stub
	}

	// 댓글 저장용
	public QnaCommentDto(String id, String content, int qnamumber) {
		super();
		this.id = id;
		this.content = content;
		this.qnamumber = qnamumber;
	}


	public QnaCommentDto(int seq, String id, String wdate, int qnamumber, String content, int del) {
		super();
		this.seq = seq;
		this.id = id;
		this.wdate = wdate;
		this.qnamumber = qnamumber;
		this.content = content;
		this.del = del;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getQnamumber() {
		return qnamumber;
	}

	public void setQnamumber(int qnamumber) {
		this.qnamumber = qnamumber;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}
}
