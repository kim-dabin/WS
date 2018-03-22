<%@page import="com.mhd.exam.dao.PhonebookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	//삭제할 주키
	int no = Integer.parseInt(request.getParameter("no"));
	//DAO에 연결 및 삭제
	int result=PhonebookDAO.deletePhone(no);
	if(result>0){
		response.sendRedirect("phonebook.jsp");//폰북 페이지로 돌아감
	}

%>