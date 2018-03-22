<%@page import="java.util.Calendar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <% Calendar cal= Calendar.getInstance();  %>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>전화번호 입력페이지</title>
<%@include file="/WEB-INF/templates/link.jsp" %>
<style>
#formBox {
	width: 600px;
	margin: auto;
}

#name {
	width: 160px;
}

#formBox .row {
	margin: 20px 0;
}

#formBox .row>label {
	display: inline-block;
	width: 100px;
	font-size: 25px;
	text-align: right;
}

#formBox span>label {
	font-size: 25px;
}

#formBox #gender, #formBox #name, #formBox #phone, #formBox #age, #profile{
	margin-left: 13px;
}

#formBox #age em {
	margin: 5px;
	font-size: 25px;
}

#formBox #name, #formBox #age select, #formBox #phone input,
	#formBox #phone select, #profile {
	padding: 6px 10px;
	font-size: 21px;
	border: 2px solid #80DEEA;
	font-family: 'Noto Sans KR', sans-serif;
	color: #333333;
}
#formBox #phone input.digit4 {
	width:80px;
}
#formBox #phone input:focus, #formBox #name:focus, #formBox #age select:focus,
	#formBox #phone select:focus, #profile:focus {
	border-color: #00E5FF;
	outline: 2px solid #00E5FF;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/templates/header.jsp" %>
<div id="content">
	<h2>전화번호 입력</h2>
	<div id="formBox">
		<form method="post" enctype="multipart/form-data" action="insert.jsp"> 
			<fieldset>
				<legend class="screen_out">전화번호 입력폼</legend>
				<div class="row">
					<label for="name">이 름</label>
					<input name="name" id="name" title="2~6글자 한글과 숫자로만 입력해주세요."
					 placeholder="이름입력" />
				</div>
				<div class="row">
					<label for="phone">전화번호</label>
					<span id="phone">
					<select name="firstPhoneNum" title="반드시 선택해주세요.">
							<option>010</option>
							<option>011</option>
							<option>016</option>
							<option>017</option>
							<option>019</option>
					</select>
					- 
					<input name="secondPhoneNum" title="3~4글자 숫자만 입력해주세요." class="digit4"
						placeholder="숫자입력" size="4" maxlength="4" />
					- 
					<input name="thirdPhoneNum" title="4글자 숫자만 입력해주세요." class="digit4"
					placeholder="숫자입력" size="4"	maxlength="4" />
					</span>
				</div>
				<div class="row">
					<label for="age">생년월일</label><span id="age">
					<select name="year" id="year">
					<%for(int i=cal.get(Calendar.YEAR); i>1900; i--){ %>
						<option value="<%=i%>"><%=i %></option>
						<%} %>
					</select><em>년</em>
					<select name="month" id="month">
					<%for(int i=1;i<=12;i++){ %>
						<option value="<%=i%>"><%=i %></option>
						<%} %>
					</select><em>월</em>
					<select name="date" id="date">
					</select><em>일</em>
					</span>
				</div>
				<div class="row">
					<label for="gender">성 별</label>
					<span id="gender">
					<input name="gender" type="radio" value="F" checked="checked" id="female" />
					<label for="female"><i class="fa fa-female"></i> 여 자</label>
					<input name="gender" type="radio" value="M" id="male" /> 
					<label for="male"><i class="fa fa-male"></i> 남 자</label>
					</span>
				</div>
				<div class="row">
					<label for="profile">프로필</label>
					<input name="profile" type="file" id="profile" accept="image/*"
					title="프로필 사진 선택" />
				</div>
				<div id="btnBox">
					<button type="submit" class="btn">
						<i class="fa fa-floppy-o"></i> 전화번호 등록
					</button>
					<button type="reset" class="btn">
						<i class="fa fa-undo"></i> 리 셋
					</button>
					<a href="phonebook.jsp" class="btn"><i class="fa fa-arrow-left"></i> 전화번호부로</a>
				</div>
			</fieldset>
		</form>
	</div><!-- //formBox  -->    
</div><!-- //content  -->    
<%@include file="/WEB-INF/templates/footer.jsp" %> 
<script src="js/jquery.js"></script>
<script src="js/moment-with-locales.js"></script>
<script>
	
	
	//alert(lastDate);//test 김다빈
	//해당하는 월의 date 생성 
	
	function changeDate() {
		var $date = $("#date");
		var year= $("#year").val();//유저가 선택한 생일 년
		var month=$("#month").val();//유저가 선택한 생일 월 
		var lastDate = moment(new Date(year,month,0)).date();//선택한 년,월일의 마지막 날짜
		//마지막 날짜에 맞춰서 date 생성
		for(var i=1; i<=lastDate; i++){
			$date.append("<option value="+i+">"+i+"</option>");//date 
			console.log(lastDate);
		}	
	}
	
	//년,월 이벤트 발생
	$("#year,#month").change(function() {
		changeDate();//date 생성
		$date.empty();//date 지우기
	});
</script>
</body>
</html>
