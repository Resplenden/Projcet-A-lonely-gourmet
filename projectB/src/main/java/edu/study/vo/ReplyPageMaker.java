package edu.study.vo;

public class ReplyPageMaker{
	
	private int replyTotalCount; //�Խù��� ��� �� ����
	private int replyTotalPageCount; //�Խù��� ��� ������ ��
	private int replyStartPage; //����������
	private int replyEndPage; //��������
	private boolean prev,next; //����������,���������� ���� ����
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
		//��ü �������� ���
		replyTotalPageCount = ((replyTotalCount-1)/searchVo.getReplyPerPageNum()) + 1;

		//���� ������ ���� ��ü ������������ Ŭ ��� ���� ������ = ��ü ������ ��
		if(searchVo.getReplyPage()>replyTotalPageCount) {
			searchVo.setReplyPage(replyTotalPageCount);
		}
		//���� ������
		replyStartPage = ((searchVo.getReplyPage()-1)/searchVo.getDisplayPageNum())*searchVo.getDisplayPageNum()+ 1;
		
		//�� ������
		replyEndPage = replyStartPage + searchVo.getDisplayPageNum() - 1 ;
		
		if(replyEndPage > replyTotalPageCount) {
			replyEndPage = replyTotalPageCount;
		}
			
		//���������� ���� ���� Ȯ��
		prev = replyStartPage != 1;
		//���������� ���� ���� Ȯ��
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


