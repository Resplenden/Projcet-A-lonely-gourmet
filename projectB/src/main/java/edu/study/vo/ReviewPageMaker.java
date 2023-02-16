package edu.study.vo;

public class ReviewPageMaker{
	
	private int reviewTotalCount; //리뷰 총 갯수
	private int reviewTotalPageCount; //리뷰 페이지 수
	private int reviewStartPage; //시작페이지
	private int reviewEndPage; //끝페이지
	private boolean prev,next; //이전페이지,다음페이지 존재 유무
	private SearchVo searchVo;

	
	
	public ReviewPageMaker(int reviewTotalCount,SearchVo searchVo) {
		
		if(reviewTotalCount>0) {
			this.reviewTotalCount = reviewTotalCount;
			searchVo.setDisplayPageNum(5);
			this.calc(searchVo);
		}
	}

	public void calc(SearchVo searchVo) {
		//전체 페이지수 계산
		reviewTotalPageCount = ((reviewTotalCount-1)/searchVo.getReviewPerPageNum()) + 1;

		//현재 페이지 수가 전체 페이지수보다 클 경우 현재 페이지 = 전체 페이지 수
		if(searchVo.getReviewPage()>reviewTotalPageCount) {
			searchVo.setReviewPage(reviewTotalPageCount);
		}
		//시작 페이지
		reviewStartPage = ((searchVo.getReviewPage()-1)/searchVo.getDisplayPageNum())*searchVo.getDisplayPageNum()+ 1;
		
		//끝 페이지
		reviewEndPage = reviewStartPage + searchVo.getDisplayPageNum() - 1 ;
		
		if(reviewEndPage > reviewTotalPageCount) {
			reviewEndPage = reviewTotalPageCount;
		}
			
		//이전페이지 존재 여부 확인
		prev = reviewStartPage != 1;
		//다음페이지 존재 여부 확인
		next = (reviewEndPage * searchVo.getReviewPerPageNum()) < reviewTotalCount;
	}
	
	public int getReviewTotalCount() {
		return reviewTotalCount;
	}

	public void setReviewTotalCount(int reviewTotalCount) {
		this.reviewTotalCount = reviewTotalCount;
	}

	public int getReviewTotalPageCount() {
		return reviewTotalPageCount;
	}

	public void setReviewTotalPageCount(int reviewTotalPageCount) {
		this.reviewTotalPageCount = reviewTotalPageCount;
	}

	public int getReviewStartPage() {
		return reviewStartPage;
	}

	public void setReviewStartPage(int reviewStartPage) {
		this.reviewStartPage = reviewStartPage;
	}

	public int getReviewEndPage() {
		return reviewEndPage;
	}

	public void setReviewEndPage(int reviewEndPage) {
		this.reviewEndPage = reviewEndPage;
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

	
	
	
}


