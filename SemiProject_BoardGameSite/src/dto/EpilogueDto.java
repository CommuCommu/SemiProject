package dto;

import java.io.Serializable;

public class EpilogueDto implements Serializable {




	private int seq;
	private String id;	// 작성자
	
	private int ref;	// 그룹번호
	private int step;	// 행(row) 번호
	private int depth;	// 깊이
	
	private String thumbnail;	//�����.
	
	private String title;

	private String content;
	private String wdate;	// 작성일
	
	private int del; //
	private int readcount;
	
	
	public EpilogueDto() {
		// TODO Auto-generated constructor stub
	}

	public EpilogueDto(int seq, String id, int ref, int step, int depth, String thumbnail, String title,
			String pcontent, String tcontent, String filename, String wdate, int del, int readcount) {
		super();
		this.seq = seq;
		this.id = id;
		this.ref = ref;
		this.step = step;
		this.depth = depth;
		this.thumbnail = thumbnail;
		this.title = title;
		this.pcontent = pcontent;
		this.tcontent = tcontent;
		this.filename = filename;
		this.wdate = wdate;
		this.del = del;
		this.readcount = readcount;
	}
	
	@Override
	public String toString() {
		return "EpilogueDto [seq=" + seq + ", id=" + id + ", ref=" + ref + ", step=" + step + ", depth=" + depth
				+ ", thumbnail=" + thumbnail + ", title=" + title + ", content=" + content + ", wdate=" + wdate
				+ ", del=" + del + ", readcount=" + readcount + "]";
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

	public int getRef() {
		return ref;
	}

	public void setRef(int ref) {
		this.ref = ref;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public String getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(String thumbnail) {
		this.thumbnail = thumbnail;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getPcontent() {
		return pcontent;
	}

	public void setPcontent(String pcontent) {
		this.pcontent = pcontent;
	}

	public String getTcontent() {
		return tcontent;
	}

	public void setTcontent(String tcontent) {
		this.tcontent = tcontent;
	}

	public String getFilename() {
		return filename;
	}

	public void setFilename(String filename) {
		this.filename = filename;
	}

	public String getWdate() {
		return wdate;
	}

	public void setWdate(String wdate) {
		this.wdate = wdate;
	}

	public int getDel() {
		return del;
	}

	public void setDel(int del) {
		this.del = del;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}
	
	
}

	