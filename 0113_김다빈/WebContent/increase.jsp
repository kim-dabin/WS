<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%! int check=0; //방문자 체크 %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<title>방문페이지</title>
<%@include file="/WEB-INF/templates/link.jsp" %>
<style>
	#content h2 {
		font-size:40px;
		text-align: center;
		line-height:400px;
	}
</style>
</head>
<body>
<%@include file="/WEB-INF/templates/header.jsp" %>
<div id="content">
	<h2><%=++check %> 번째 방문입니다.</h2>
</div><!-- //content  -->   
<%@include file="/WEB-INF/templates/footer.jsp" %> 
</body>
</html>