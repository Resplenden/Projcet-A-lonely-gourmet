package edu.study.vo;

public class ReplyVo {
	private int ridx;	
	private int bidx;
	private int uidx;
	private String contents;
	private String delyn;
	private String rdate;
	private UserVo userVo;
	private String writer;
	
	public String getWriter() {
		
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getRidx() {
		return ridx;
	}
	public void setRidx(int ridx) {
		this.ridx = ridx;
	}
	public int getBidx() {
		return bidx;
	}
	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
	public int getUidx() {
		return uidx;
	}
	public void setUidx(int uidx) {
		this.uidx = uidx;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public String getRdate() {
		return rdate;
	}
	public void setRdate(String rdate) {
		this.rdate = rdate;
	}	
	public UserVo getUserVo() {
		return userVo;
	}
	public void setUserVo(UserVo userVo) {
		this.userVo = userVo;
	}
	
	@Override
	public String toString() {
		return "ReplyVo [ridx=" + ridx + ", bidx=" + bidx + ", uidx=" + uidx + ", contents=" + contents + ", delyn="
				+ delyn + ", rdate=" + rdate + ", userVo=" + userVo + ", writer=" + writer + "]";
	}
	

	
	
	
}
