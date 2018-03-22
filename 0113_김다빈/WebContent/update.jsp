<%@page import="com.mhd.exam.dao.PhonebookDAO"%>
<%@page import="java.sql.Date"%>
<%@page import="com.mhd.exam.vo.Phone"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	Phone phoneInfo = new Phone();
	//주키 
	int no = Integer.parseInt(request.getParameter("no"));
	phoneInfo.setNo(no);
	//폰넘버
	String first = request.getParameter("phoneFirstNum");
	String second= request.getParameter("phoneSecondNum");
	String third= request.getParameter("phonethirdNum");
	String phone = first+second+third;
	phoneInfo.setPhone(phone);
	//생년월일 
	String year = request.getParameter("year");
	String month= request.getParameter("month");
	String date = request.getParameter("date");
	System.out.println("생일"+year+"-"+month+"-"+date);
	Date birthDate = Date.valueOf(year+"-"+month+"-"+date);
	phoneInfo.setBirthDate(birthDate);
	//성별 
	String gender = request.getParameter("gender");
	phoneInfo.setGender(gender);
	
	//dao에 받은 데이터 넣어서 업데이트 쿼리 날림
	PhonebookDAO.updatePhone(phoneInfo);
	
	response.sendRedirect("phonebook.jsp");



%>