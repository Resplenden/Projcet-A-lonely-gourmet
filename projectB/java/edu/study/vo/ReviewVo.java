package edu.study.vo;

public class ReviewVo {
	
	private int vidx;
	private String title;
	private String content;
	private String writer;
	private int hit;
	private int likecnt;
	private String filename;
	private String wdate;
	private String delyn;
	private int midx;
	private String name;
	private String category;
	private String addr;
	private String phone;
	private String stname;
	
	public int getVidx() {
		return vidx;
	}
	public void setVidx(int vidx) {
		this.vidx = vidx;
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
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public int getLikecnt() {
		return likecnt;
	}
	public void setLikecnt(int likecnt) {
		this.likecnt = likecnt;
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
	public String getDelyn() {
		return delyn;
	}
	public void setDelyn(String delyn) {
		this.delyn = delyn;
	}
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getCategory() {
		return category;
	}
	public void setCategory(String category) {
		this.category = category;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getStname() {
		return stname;
	}
	public void setStname(String stname) {
		this.stname = stname;
	}
	
	@Override
	public String toString() {
		return "ReviewVo [vidx=" + vidx + ", title=" + title + ", content=" + content + ", writer=" + writer + ", hit="
				+ hit + ", likecnt=" + likecnt + ", filename=" + filename + ", wdate=" + wdate + ", delyn=" + delyn
				+ ", midx=" + midx + ", name=" + name + ", category=" + category + ", addr=" + addr + ", phone=" + phone
				+ ", stname=" + stname + "]";
	}
	

	
	
	
	
	
	
	
	

}
