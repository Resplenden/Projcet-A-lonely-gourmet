package edu.study.vo;

public class SearchVo{
	
	private String searchType; //�˻� ����
	private String searchVal; //�˻���
	private String category; //ī�װ�
	private String order; //����
	
	private int page; //���� ������ ��ȣ
	private int perPageNum; //�������� ����� ������ ����
    private int displayPageNum; //ȭ�� �ϴܿ� ����� ������ ������
    private int start; //������ ���� ��ġ
	private int end; //������ �� ��ġ
	private int bidx; //�Խù� ��ȣ(��� ��ɿ��� ���)
	
	private int replyPage; //���� ��������� ��ȣ
	private int replyPerPageNum; //�������� ����� ����
	private int replyStart; //�������� ��� ���� ��ġ
	private int replyEnd; //�������� ��� �� ��ġ
	
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
		//�������� ���� �Խñ� ��ȣ
		start = ((getPage()-1)*getPerPageNum());
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		//�������� �� �Խñ� ��ȣ
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
		//������ ����� ���� ��ȣ
		replyStart = ((getReplyPage()-1)*getReplyPerPageNum());
		return replyStart;
	}


	public void setReplyStart(int replyStart) {
		this.replyStart = replyStart;
	}


	public int getReplyEnd() {
		//������ ����� �� ��ȣ
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