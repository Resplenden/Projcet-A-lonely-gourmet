package edu.study.vo;

public class EventVo {

	private int eidx;
	private int origineidx;
	private String title;
	private String contents;
	private int rec; 
	private String wdate;
	private String delyn;
	private String writer;
	
	public int getEidx() {
		return eidx;
	}
	public void setEidx(int eidx) {
		this.eidx = eidx;
	}
	public int getOrigineidx() {
		return origineidx;
	}
	public void setOrigineidx(int origineidx) {
		this.origineidx = origineidx;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public int getRec() {
		return rec;
	}
	public void setRec(int rec) {
		this.rec = rec;
	}
	public String getWdate() {
		return wdate;
	}
	public void setWdate(String wdate) {
		this.wdate = wdate;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	
	@Override
	public String toString() {
		return "EventVo [eidx=" + eidx + ", origineidx=" + origineidx + ", title=" + title + ", contents=" + contents
				+ ", rec=" + rec + ", wdate=" + wdate + ", delyn=" + delyn + ", writer=" + writer + "]";
	}
	
	
	
	
	
}