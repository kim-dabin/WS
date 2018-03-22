<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String prev = request.getHeader("referer");//이전페이지의 url을 알수 있음
	if(prev==null){//이전페이지가 없을 시에
		prev = "index.jsp";//로그인 페이지로 보냄
	}
	//로그아웃을 위해 logMemeber 세션 지움
	session.removeAttribute("logMember");
	response.sendRedirect(prev);//이전 페이지로 보냄

%>