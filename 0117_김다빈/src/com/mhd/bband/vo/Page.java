package com.mhd.bband.vo;

public class Page {
 
	private int start, end; // start: 뷰단에서 보이는 시작 게시물 // end: 뷰단에서 보이는 마지막 게시물
	
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
	public Page() {}
	public Page(int now, int numPage) { //now: 현재 페이지 //numPage: 한 페이지당 보여질 게시물 수
		this.end = now*numPage;
		this.start= end-(numPage-1);
	}
 
 
 
}
