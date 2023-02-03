package edu.study.vo;

public class MemberFileVo {
	private int midx;
	private int mfidx;
	private String orgfilename;
	private String storedname;
	
	public int getMidx() {
		return midx;
	}
	public void setMidx(int midx) {
		this.midx = midx;
	}
	public int getMfidx() {
		return mfidx;
	}
	public void setMfidx(int mfidx) {
		this.mfidx = mfidx;
	}
	
	public String getOrgfilename() {
		return orgfilename;
	}
	public void setOrgfilename(String orgfilename) {
		this.orgfilename = orgfilename;
	}
	public String getStoredname() {
		return storedname;
	}
	public void setStoredname(String storedname) {
		this.storedname = storedname;
	}
	
	@Override
	public String toString() {
		return "MemberFileVo [midx=" + midx + ", mfidx=" + mfidx + ", orgfilename=" + orgfilename + ", storedname="
				+ storedname + "]";
	}
	
	
	
	
	
	

	
	
	
	
}
