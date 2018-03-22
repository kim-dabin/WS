<%@page import="com.mhd.bband.util.PaginateUtil"%>
<%@page import="com.mhd.bband.vo.Page"%>
<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.mhd.bband.vo.Post"%>
<%@page import="java.util.List"%>
<%@page import="com.mhd.bband.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//UTF-8로
	request.setCharacterEncoding("UTF-8");
	int now = Integer.parseInt(request.getParameter("now"));
	int numPage = Integer.parseInt(request.getParameter("numPage"));
	int numBlock = Integer.parseInt(request.getParameter("numBlock"));
	System.out.println(now+","+numPage+","+numBlock);

	//vo에 현재 페이지, 한 페이지에 보여줄 댓글 수 넣어 줌
	Page pageVO = new Page(now, numPage);
	
	//포스팅한 리스트 불러옴
	List<Post> posts =PostDAO.selectPosts(pageVO);
	
	//접속한 유저의 아이피 
	String ip = request.getRemoteAddr();
	//전체 게시물 수
	int total = PostDAO.selectTotal();
	//페이징
	String pagingStr = PaginateUtil.paginate(now, total, numPage, numBlock, "main.jsp", "page=");
	
	
	//json형태로 바꿈
	ObjectMapper om = new ObjectMapper();
	String json = om.writeValueAsString(posts);
	String paging= om.writeValueAsString(pagingStr);
%>
<%=json %>
<%=paging%>