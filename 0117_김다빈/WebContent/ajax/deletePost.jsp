<%@page import="com.mhd.bband.dao.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	 int no = Integer.parseInt(request.getParameter("no"));//삭제할 주키 
	 boolean flag = false; //삭제 성공 유무 
	 int result = PostDAO.deletePost(no);//dao와 연결해서 삭제
	 //삭제가 성공했을 시,
	 if(result>0){
		 flag=true;
	 }
%>
{"result":<%=flag %>}