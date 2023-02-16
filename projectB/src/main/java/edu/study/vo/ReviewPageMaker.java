package edu.study.vo;

public class ReviewPageMaker{
	
	private int reviewTotalCount; //���� �� ����
	private int reviewTotalPageCount; //���� ������ ��
	private int reviewStartPage; //����������
	private int reviewEndPage; //��������
	private boolean prev,next; //����������,���������� ���� ����
	private SearchVo searchVo;

	
	
	public ReviewPageMaker(int reviewTotalCount,SearchVo searchVo) {
		
		if(reviewTotalCount>0) {
			this.reviewTotalCount = reviewTotalCount;
			searchVo.setDisplayPageNum(5);
			this.calc(searchVo);
		}
	}

	public void calc(SearchVo searchVo) {
		//��ü �������� ���
		reviewTotalPageCount = ((reviewTotalCount-1)/searchVo.getReviewPerPageNum()) + 1;

		//���� ������ ���� ��ü ������������ Ŭ ��� ���� ������ = ��ü ������ ��
		if(searchVo.getReviewPage()>reviewTotalPageCount) {
			searchVo.setReviewPage(reviewTotalPageCount);
		}
		//���� ������
		reviewStartPage = ((searchVo.getReviewPage()-1)/searchVo.getDisplayPageNum())*searchVo.getDisplayPageNum()+ 1;
		
		//�� ������
		reviewEndPage = reviewStartPage + searchVo.getDisplayPageNum() - 1 ;
		
		if(reviewEndPage > reviewTotalPageCount) {
			reviewEndPage = reviewTotalPageCount;
		}
			
		//���������� ���� ���� Ȯ��
		prev = reviewStartPage != 1;
		//���������� ���� ���� Ȯ��
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


