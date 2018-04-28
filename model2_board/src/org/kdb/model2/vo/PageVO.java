package org.kdb.model2.vo;
public class PageVO {
	private int no, start,end; //no : article의 no
	
	public PageVO(int now, int numPage) {
		
		this.end = now*numPage;
		this.start = end-(numPage-1);
	}

	public PageVO(int no, int now, int numPage) {
		super();
		this.no = no;
		this.start = end-(numPage-1);
		this.end = now*numPage;
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public PageVO(){}
	
	public int getStart() {
		return start;
	}

	public void setStart(int start) {
		this.start = start;
	}

	public int getEnd() {
		return end;
	}

	public void setEnd(int end) {
		this.end = end;
	}
	

}
