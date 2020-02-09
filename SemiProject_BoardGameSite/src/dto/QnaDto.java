package dto;

/*
CREATE TABLE BG_QNA(
    SEQ NUMBER(8) PRIMARY KEY,            --������
    ID VARCHAR2(50) NOT NULL,             --���̵�. �ܷ�Ű
    WDATE DATE NOT NULL,                  --�ۼ���
    TITLE VARCHAR2(200) NOT NULL,         --����
    CONTENT VARCHAR2(4000) NOT NULL,      --����
    READCOUNT NUMBER(8) NOT NULL,         --��ȸ��
    IS_SECRET NUMBER(1) NOT NULL,         --��б� ���� (0 : �ƴ� / 1 : ��б�)
    THIS_PASSWORD VARCHAR2(50),           --��б��϶� �н�����
    DEL NUMBER(1) NOT NULL                --�������� (0 : X / 1 : ���� Ż��)
);

CREATE SEQUENCE SEQ_BG_QNA
START WITH 1
INCREMENT BY 1;

ALTER TABLE BG_QNA
ADD CONSTRAINT FK_BG_QNA_ID FOREIGN KEY(ID)
REFERENCES BG_MEMBER(ID);
*/


public class QnaDto {

	private int seq;
	private String id;
	private String wdate;
	private String title;
	private String content;
	private int readcount;
	private int is_secret;
	private String this_password;
	private int del;	
	
	public QnaDto() {
		// TODO Auto-generated constructor stub
	}

	public QnaDto(int seq, String id, String wdate, String title, String content, int readcount, int is_secret,
			String this_password, int del) {
		super();
		this.seq = seq;
		this.id = id;
		this.wdate = wdate;
		this.title = title;
		this.content = content;
		this.readcount = readcount;
		this.is_secret = is_secret;
		this.this_password = this_password;
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

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public int getIs_secret() {
		return is_secret;
	}

	public void setIs_secret(int is_secret) {
		this.is_secret = is_secret;
	}

	public String getThis_password() {
		return this_password;
	}

	public void setThis_password(String this_password) {
		this.this_password = this_password;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}
}
