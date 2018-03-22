<%@page import="com.fasterxml.jackson.databind.ObjectMapper"%>
<%@page import="com.mhd.bband.vo.Post"%>
<%@page import="com.mhd.bband.dao.PostDAO"%>
<%@page import="com.mhd.bband.vo.BBander"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	request.setCharacterEncoding("UTF-8");
	//세션에 저장된 로그멤버 객체 생성
	BBander logMember = (BBander)session.getAttribute("logMember");
	System.out.println(logMember);
	
	//파라미터 받아오기 
	String contents = request.getParameter("contents");
	String writer = logMember.getNickname();
	int writerNo = logMember.getNo();
	String profile = logMember.getProfile();
	System.out.println("writer:"+writer);
	
	//Post 객체 생성
	Post post = new Post();
	
	post.setContents(contents);
	post.setProfile(profile);
	post.setwriterNo(writerNo);
	post.setWriter(writer);
	
	int result = PostDAO.insertPost(post);
	
	//ObjectMapper om = new ObjectMapper();
	//java object를 json data로 변경
	boolean flag = false;
	if(result>0){
		flag=true;
	}
%>
{"result":<%=flag %>,"logMemberNo":<%=logMember.getNo() %>}

