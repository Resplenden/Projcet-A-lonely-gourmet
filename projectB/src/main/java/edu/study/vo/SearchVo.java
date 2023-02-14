package edu.study.vo;

public class SearchVo{
	
	private String searchType; //검색 조건
	private String searchVal; //검색어
	private String category; //카테고리
	private String order; //순서
	
	private int page; //현재 페이지 번호
	private int perPageNum; //페이지당 출력할 데이터 개수
    private int displayPageNum; //화면 하단에 출력할 페이지 사이즈
    private int start; //페이지 시작 위치
	private int end; //페이지 끝 위치
	private int bidx; //게시물 번호(댓글 기능에서 사용)
	
	private int replyPage; //현재 댓글페이지 번호
	private int replyPerPageNum; //페이지당 댓글의 갯수
	private int replyStart; //페이지의 댓글 시작 위치
	private int replyEnd; //페이지의 댓글 끝 위치
	
    public SearchVo(){
    	this.page = 1;
    	this.perPageNum = 15;
    	this.displayPageNum = 10;
    	
    	this.replyPage = 1;
    	this.replyPerPageNum = 10;
    }

    
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getSearchVal() {
		return searchVal;
	}
	public void setSearchVal(String searchVal) {
		this.searchVal = searchVal;
	}
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getPerPageNum() {
		return perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		this.perPageNum = perPageNum;
	}
	public int getDisplayPageNum() {
		return displayPageNum;
	}
	public void setDisplayPageNum(int displayPageNum) {
		this.displayPageNum = displayPageNum;
	}
	public int getStart() {
		//페이지의 시작 게시글 번호
		start = ((getPage()-1)*getPerPageNum());
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		//페이지의 끝 게시글 번호
		end = getPage()*getPerPageNum();
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	
	@Override
	public String toString() {
		return "SearchVo [searchType=" + searchType + ", searchVal=" + searchVal + ", bidx=" + bidx + "]";
	}


	public int getBidx() {
		return bidx;
	}


	public void setBidx(int bidx) {
		this.bidx = bidx;
	}


	public int getReplyPage() {
		return replyPage;
	}


	public void setReplyPage(int replyPage) {
		this.replyPage = replyPage;
	}


	public int getReplyPerPageNum() {
		return replyPerPageNum;
	}


	public void setReplyPerPageNum(int replyPerPageNum) {
		this.replyPerPageNum = replyPerPageNum;
	}


	public int getReplyStart() {
		//페이지 댓글의 시작 번호
		replyStart = ((getReplyPage()-1)*getReplyPerPageNum());
		return replyStart;
	}


	public void setReplyStart(int replyStart) {
		this.replyStart = replyStart;
	}


	public int getReplyEnd() {
		//페이지 댓글의 끝 번호
		replyEnd = getReplyPage() * getReplyPerPageNum();
		return replyEnd;
	}


	public void setReplyEnd(int replyEnd) {
		this.replyEnd = replyEnd;
	}


	public String getCategory() {
		return category;
	}


	public void setCategory(String category) {
		this.category = category;
	}


	public String getOrder() {
		return order;
	}


	public void setOrder(String order) {
		this.order = order;
	}




}