<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Calendar"%>
<%@page import="com.mhd.exam.vo.Phone"%>
<%@page import="com.mhd.exam.dao.PhonebookDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% 
	int no = Integer.parseInt(request.getParameter("no"));
	Phone phone = PhonebookDAO.selectPhone(no);
	Calendar cal= Calendar.getInstance();
%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8">
<title>전화번호 수정페이지</title>
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
	width:60px;
}
#formBox #phone input:focus, #formBox #name:focus, #formBox #age select:focus,
	#formBox #phone select:focus, #profile:focus {
	border-color: #00E5FF;
	outline: 2px solid #00E5FF;
}
.profile {
	text-align: center;
}
</style>
</head>
<body>
<%@include file="/WEB-INF/templates/header.jsp" %>
<div id="content">
	<h2><%=phone.getName() %> 전화번호 수정</h2>
	<div id="formBox">
		<form  method="post" action="update.jsp">
		<!-- no 값 넘겨줌 -->
		<input type="hidden" name="no" value="<%=phone.getNo() %>"/>
			<fieldset>
				<legend class="screen_out">전화번호 수정폼</legend>
				<div class="row profile">
					<img src="profile/<%=phone.getProfile() %>" width="200" height="200" />
				</div>
				<div class="row">
					<label for="name">이 름</label>
					<input id="name" title="2~6글자 한글과 숫자로만 입력해주세요."
					 placeholder="이름입력"
					 disabled="disabled"
					 value="<%=phone.getName() %>"
					  />
				</div>
				<div class="row">
					<label for="phone">전화번호</label>
					<span id="phone">
					<select name="phoneFirstNum" title="반드시 선택해주세요.">
					<%
						//전화번호 첫 글자
						String first=phone.getPhoneFormat().split("-")[0];
						String second=phone.getPhoneFormat().split("-")[1];
						String third = phone.getPhoneFormat().split("-")[2];
							
						String phoneNum[]={"010","011","016","017","019"};
					%>
					<%for(int i=0; i<phoneNum.length;i++){%>
						<option <%if(phoneNum[i].equals(first)){%>selected<%} %>><%=phoneNum[i] %></option>
					<%} %>
					</select>
					- 
					<input name="phoneSecondNum" title="3~4글자 숫자만 입력해주세요." class="digit4"
						placeholder="숫자입력" size="4" maxlength="4" 
						value="<%=second %>"/>
					- 
					<input name="phonethirdNum" title="4글자 숫자만 입력해주세요." class="digit4"
					placeholder="숫자입력" size="4"	maxlength="4"
					value="<%=third %>" />
					</span>
				</div>
				<div class="row">
					<label for="age">생년월일</label><span id="age">
					<% 
						//Date -> String 형변환
						SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
						String birthDate= sdf.format(phone.getBirthDate());
						//태어난 년,월,일을 나눔
						String year = birthDate.split("-")[0];
						String month = birthDate.split("-")[1];
						String date = birthDate.split("-")[2];
					%>
					<select name="year" id="year">
						<%for(int i=cal.get(Calendar.YEAR); i>1900; i--){ %>
						<option <% if(i==Integer.parseInt(year)){ %> selected <%} %> value="<%=i %>"><%=i %></option>
						<%} %>
					</select><em>년</em>
					<select name="month" id="month">
					<%for(int i=1;i<=12;i++){ %>
						<option <% if(i==Integer.parseInt(month)){ %> selected <%} %>  value="<%=i%>"><%=i %></option>
						<%} %>
					</select><em>월</em>
					<select id="date" name="date">
						<option value=<%=date %>><%=date %> </option>
					</select><em>일</em>
					</span>
				</div>
				<div class="row">
					<label for="gender">성 별</label>
					<span id="gender">
					<input type="radio" value="F" <%if(phone.getGender().equals("F")){ %> checked="checked" <%} %> id="female" name="gender"/>
					<label for="female"><i class="fa fa-female"></i> 여 자</label>
					<input type="radio" value="M" id="male" <%if(phone.getGender().equals("M")){ %> checked="checked" <%}%> name="gender"/> 
					<label for="male"><i class="fa fa-male"></i> 남 자</label>
					</span>
				</div>
				<div id="btnBox">
					<button type="submit" class="btn">
						<i class="fa fa-floppy-o"></i> 전화번호 수정
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
<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/moment-with-locales.js"></script>
<script type="text/javascript" >
//alert(lastDate);//test 김다빈
//해당하는 월의 date 생성 

function changeDate() {
	var $date = $("#date");
	var year= $("#year").val();//유저가 선택한 생일 년
	var month=$("#month").val();//유저가 선택한 생일 월 
	var date = $date.val();//입력된 date
	var lastDate = moment(new Date(year,month,0)).date();//선택한 년,월일의 마지막 날짜
	var txt="<option value="+i+">"+i+"</option>";
	//마지막 날짜에 맞춰서 date 생성
	//alert(date);
	$date.empty();//date 지우기
	for(var i=1; i<=lastDate; i++){
		//if(date==i){
		//	 txt="<option selected value="+i+">"+i+"</option>";
		//}
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
