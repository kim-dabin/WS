package com.mhd.bband.vo;

import java.sql.Timestamp;

public class Post {
	private int no, writerNo, rownum;//주키, 글쓴이 주키
	private String contents, writer, profile; //글 내용, 글쓴이, 프로필
	private Timestamp regdate;
	public Post() {}
	
	

	public int getRownum() {
		return rownum;
	}

	public void setRownum(int rownum) {
		this.rownum = rownum;
	}
	
	
	public int getNo() {
		return no;
	}
	public void setNo(int no) {
		this.no = no;
	}
	public int getwriterNo() {
		return writerNo;
	}
	public void setwriterNo(int writerNo) {
		this.writerNo = writerNo;
	}
	public String getContents() {
		return contents;
	}
	public void setContents(String contents) {
		this.contents = contents;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getProfile() {
		return profile;
	}
	public void setProfile(String profile) {
		this.profile = profile;
	}
	public Timestamp getRegdate() {
		return regdate;
	}
	public void setRegdate(Timestamp regdate) {
		this.regdate = regdate;
	}
	
}
