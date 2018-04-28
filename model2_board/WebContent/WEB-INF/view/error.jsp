<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>원하는 페이지를 찾을 수 없습니다.</title>
	<c:import url="template/link.jsp"></c:import>
	<style>
		#content {
			text-align: center;
		}

		#content a {
			font-size:22px;
		}

	</style>
</head>
<body>
<c:import url="template/header.jsp"></c:import>
<div id="content">
	<div class="aux">
			<h2>죄송합니다.<br/>
			요청하신 페이지를 찾을 수 없습니다.</h2>
			<a href="index.html">메인 페이지로 이동</a>
		</div>
		</div>
<c:import url="template/footer.jsp"></c:import>

</body>
</html>
