package edu.study.vo;

public class PageMaker{
	
	private int totalCount; //��ü �Խù� ��
	private int totalPageCount; //��ü ������ ��
	private int startPage; //����������
	private int endPage; //��������
	private boolean prev,next; //����������,���������� ���� ����
	private SearchVo searchVo;
	
	public PageMaker(int totalCount,SearchVo searchVo){
		
		if(totalCount>0) {
			this.totalCount = totalCount;
			this.calc(searchVo);
		}
	}

	public void calc(SearchVo searchVo) {
		//��ü �������� ���
		totalPageCount = ((totalCount-1)/searchVo.getPerPageNum()) + 1;
		//���� ������ ���� ��ü ������������ Ŭ ��� ���� ������ = ��ü ������ ��
		if(searchVo.getPage()>totalPageCount) {
			searchVo.setPage(totalPageCount);
		}
		//���� ������
		startPage = ((searchVo.getPage()-1)/searchVo.getDisplayPageNum())*searchVo.getDisplayPageNum() + 1;
		//�� ������
		endPage = startPage + searchVo.getDisplayPageNum() - 1 ;
		
		if(endPage > totalPageCount) {
			endPage = totalPageCount;
		}
	
		//���������� ���� ���� Ȯ��
		prev = startPage != 1;
		//���������� ���� ���� Ȯ��
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