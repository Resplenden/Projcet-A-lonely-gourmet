package edu.study.vo;

public class ReplyPageMaker{
	
	private int replyTotalCount; //게시물의 댓글 총 갯수
	private int replyTotalPageCount; //게시물의 댓글 페이지 수
	private int replyStartPage; //시작페이지
	private int replyEndPage; //끝페이지
	private boolean prev,next; //이전페이지,다음페이지 존재 유무
	private SearchVo searchVo;
	private int bidx;
	

	public ReplyPageMaker(int replyTotalCount,SearchVo searchVo) {
		
		if(replyTotalCount>0) {
			this.replyTotalCount = replyTotalCount;
			searchVo.setDisplayPageNum(5);
			this.calc(searchVo);
		}
	}

	public void calc(SearchVo searchVo) {
		//전체 페이지수 계산
		replyTotalPageCount = ((replyTotalCount-1)/searchVo.getReplyPerPageNum()) + 1;

		//현재 페이지 수가 전체 페이지수보다 클 경우 현재 페이지 = 전체 페이지 수
		if(searchVo.getReplyPage()>replyTotalPageCount) {
			searchVo.setReplyPage(replyTotalPageCount);
		}
		//시작 페이지
		replyStartPage = ((searchVo.getReplyPage()-1)/searchVo.getDisplayPageNum())*searchVo.getDisplayPageNum()+ 1;
		
		//끝 페이지
		replyEndPage = replyStartPage + searchVo.getDisplayPageNum() - 1 ;
		
		if(replyEndPage > replyTotalPageCount) {
			replyEndPage = replyTotalPageCount;
		}
			
		//이전페이지 존재 여부 확인
		prev = replyStartPage != 1;
		//다음페이지 존재 여부 확인
		next = (replyEndPage * searchVo.getReplyPerPageNum()) < replyTotalCount;
	}
	
	public int getReplyTotalCount() {
		return replyTotalCount;
	}

	public void setReplyTotalCount(int replyTotalCount) {
		this.replyTotalCount = replyTotalCount;
	}

	public int getReplyTotalPageCount() {
		return replyTotalPageCount;
	}

	public void setReplyTotalPageCount(int replyTotalPageCount) {
		this.replyTotalPageCount = replyTotalPageCount;
	}

	public int getReplyStartPage() {
		return replyStartPage;
	}

	public void setReplyStartPage(int replyStartPage) {
		this.replyStartPage = replyStartPage;
	}

	public int getReplyEndPage() {
		return replyEndPage;
	}

	public void setReplyEndPage(int replyEndPage) {
		this.replyEndPage = replyEndPage;
	}

	public boolean isPrev() {
		return prev;
	}

	public void setPrev(boolean prev) {
		this.prev = prev;
	}

	public boolean isNext() {
		return next;
	}

	public void setNext(boolean next) {
		this.next = next;
	}
	
	public SearchVo getSearchVo() {
		return searchVo;
	}

	public void setSearchVo(SearchVo searchVo) {
		this.searchVo = searchVo;
	}

	public int getBidx() {
		return bidx;
	}

	public void setBidx(int bidx) {
		this.bidx = bidx;
	}
}


