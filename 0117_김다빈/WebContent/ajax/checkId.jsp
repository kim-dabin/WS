<%@page import="com.mhd.bband.dao.BBanderDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
  String id = request.getParameter("joinId");//ajax를 통해 넘어온 유저가 입력한 아이디
  System.out.println(id);
  int result = BBanderDAO.selectCheckId(id); //dao와 연결
  //System.out.println(result);
  boolean flag = false; //아이디가 있는지 없는지 확인
  
  if(result>0){//아이디가 있음
	   flag= true;
  }
  /*json 형태 아이디가 있으면 result의 값은 true, 아이디가 없으면 값은 false*/
%>

{"result":<%=flag %>}
