<%@page import="com.mhd.bband.vo.BBander"%>
<%@page import="com.mhd.bband.dao.BBanderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//아이디와 비밀번호 데이터 얻어옴
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	//BBander 객체 생성
	BBander logInfo = new BBander();
	//vo에 로그인 정보 넣기
	logInfo.setId(id);
	logInfo.setPassword(password);
	
	//dao와 연결 
	BBander logMember = BBanderDAO.selectLogMember(logInfo);
%>
<%
	//로그인이 되면 메인 페이지로 보냄
	if(logMember!=null){
		System.out.println("test");
		//로그인 정보를 세션에 넣기
		session.setAttribute("logMember", logMember);
		response.sendRedirect("main.jsp");
	}else{//로그인이 안됐다는 메시지 보냄
		session.setAttribute("msg", "아이디나 비밀번호가 틀렸습니다.");
		//index 페이지로 돌려보냄
		response.sendRedirect("index.jsp");
	}

%>