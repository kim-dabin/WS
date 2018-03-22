<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="javax.xml.crypto.dsig.Transform"%>
<%@page import="java.sql.Date"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.mhd.exam.vo.Phone"%>
<%@page import="java.util.List"%>
<%@page import="com.mhd.exam.dao.PhonebookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//디비에 있는 폰북 리스트
List<Phone> phonebook= PhonebookDAO.selectList();	
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>전화번호부</title>
<%@include file="/WEB-INF/templates/link.jsp" %>
<style>
#phoneBox {
	width:1000px;
	margin: auto;
}

#phoneBox table {
	border-collapse: collapse;
	border:1px solid #03A9F4;
	width:1000px;
	font-size:23px;
	font-weight:300;
}
#phoneBox thead tr {
	background:#03A9F4;
	font-size:25px;
	color:#fff;
	font-weight:600;
	text-shadow:1px 1px 1px #333;
}

#phoneBox th, #phoneBox td {
	padding:10px 16px;
	border:1px solid #03A9F4;
	text-align: center;
	vertical-align: middle;
}

#phoneBox tbody tr:nth-child(even) {
	background:#B3E5FC;
}

#phoneBox #btnBox {
	text-align: right;
	padding:20px;
}

#profile {
	width:180px;
}
#name {
	width:150px;
}
#phone {
	width:200px;
}
#gender {
	width:110px;
}
#age {
	width:100px;
}
#delete {
	width:130px;
}
#update {
	width:130px;
}
#phoneBox .no_data {
	padding-top:20px;
	padding-bottom:20px;
}

</style>
</head>
<body>
<%@include file="/WEB-INF/templates/header.jsp" %>
<div id="content">
<h2>전화번호 목록</h2>
<div id="phoneBox">
<table border="1">
<caption class="screen_out">전화번호표</caption>
<colgroup>
<col id="profile"/>
<col id="name"/>
<col id="phone"/>
<col id="gender"/>
<col id="age"/>
<col id="update"/>
<col id="delete"/>
</colgroup>
<thead>
	<tr>
		<th>사 진</th>
		<th>이 름</th>
		<th>전화번호</th>
		<th>성 별</th>
		<th>나 이</th>
		<th>수 정</th>
		<th>삭 제</th>
	</tr>
</thead>
<tfoot>
	<tr>
		<td id="btnBox" colspan="7">
			<a href="insertForm.jsp" class="btn"><i class="fa fa-pencil"></i> 전화번호 작성</a>
		</td>
	</tr>
</tfoot>
<tbody>
<%if(phonebook.isEmpty()){%>
<tr>
		<td colspan=7>아직 전화번호가 없습니다.</td>
</tr>
<%}else{%>
	<%for(Phone phone: phonebook){ %>

	<tr>
		<td>
		<img src="profile/<%=phone.getProfile() %>" width="100" height="100"/>
		</td> 
		<td><%=phone.getName() %></td>
		<th><%=phone.getPhoneFormat() %></th>
		<td>
		<i class="fa fa-<%if(phone.getGender().equals("M")){ %>male<%}else{ %>female<%} %>"></i>
		<%if(phone.getGender().equals("M")){%><%="남자" %><%}else{ %><%="여자" %><%} %>
		</td>
		<%
		//calendar 클래스 생성
		Calendar cal = Calendar.getInstance(); //현재 날짜 갖고 오기		
		SimpleDateFormat fmt=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss"); //SimpleDateFormat 클래스 생성
		String birthDateStr= fmt.format(phone.getBirthDate()); //Date -> String으로 생일 형변환
		int year = Integer.parseInt(birthDateStr.split("-")[0]); //생일 "-" 기준으로 년도 자르기
		int nowYear= cal.get(Calendar.YEAR); // 현재 년도 구하기		
		%>
		<td title="<%=phone.getBirthDate() %>"><%=nowYear-year+1%>살</td>
		<td>
			<a href="updateForm.jsp?no=<%=phone.getNo() %>" class="btn update"><i class="fa fa-wrench"></i> 수정</a>
		</td>
		<td>
			<a href="delete.jsp?no=<%=phone.getNo() %>" class="btn delete"><i class="fa fa-times"></i> 삭제</a>
		</td>
	</tr>
	<%} }%>
</tbody>
</table>
</div><!-- //phoneBox -->
</div><!-- //content  -->    
<%@include file="/WEB-INF/templates/footer.jsp" %> 
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript">
	//삭제버튼 클릭시, confirm 창
	$(".delete").click(function () {
			var result = confirm("정말로 삭제하시겠습니까?");
			return result;
	});
	
	
	
	
</script>
</body>
</html>