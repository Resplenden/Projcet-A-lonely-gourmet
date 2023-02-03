package edu.study.vo;

public class PageMaker{
	
	private int totalCount; //전체 게시물 수
	private int totalPageCount; //전체 페이지 수
	private int startPage; //시작페이지
	private int endPage; //끝페이지
	private boolean prev,next; //이전페이지,다음페이지 존재 유무
	private SearchVo searchVo;
	
	public PageMaker(int totalCount,SearchVo searchVo){
		
		if(totalCount>0) {
			this.totalCount = totalCount;
			this.calc(searchVo);
		}
	}

	public void calc(SearchVo searchVo) {
		//전체 페이지수 계산
		totalPageCount = ((totalCount-1)/searchVo.getPerPageNum()) + 1;
		//현재 페이지 수가 전체 페이지수보다 클 경우 현재 페이지 = 전체 페이지 수
		if(searchVo.getPage()>totalPageCount) {
			searchVo.setPage(totalPageCount);
		}
		//시작 페이지
		startPage = ((searchVo.getPage()-1)/searchVo.getDisplayPageNum())*searchVo.getDisplayPageNum() + 1;
		//끝 페이지
		endPage = startPage + searchVo.getDisplayPageNum() - 1 ;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
	
		//이전페이지 존재 여부 확인
		prev = startPage != 1;
		//다음페이지 존재 여부 확인
		next = (endPage * searchVo.getPerPageNum()) < totalCount;
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
	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPageCount() {
		return totalPageCount;
	}

	public void setTotalPageCount(int totalPageCount) {
		this.totalPageCount = totalPageCount;
	}

	public int getStartPage() {
		return startPage;
	}

	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}

	public int getEndPage() {
		return endPage;
	}

	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	public SearchVo getSearchVo() {
		return searchVo;
	}

	public void setSearchVo(SearchVo searchVo) {
		this.searchVo = searchVo;
	}
}