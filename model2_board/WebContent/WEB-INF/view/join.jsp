<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>회원가입</title>
	<c:import url="template/link.jsp"></c:import>
</head>
<style>
		#header h1 {
			position: relative;
			margin:auto;
			width:250px;
		}

		#content h2  {
			text-align: center;
			font-size:32px;
			font-weight:bold;
			margin:20px;
		}

		#joinBox {
			width:600px;
			margin:auto;
		}

		#joinBox div {
			margin:20px 0;
		}

		#joinBox label {
			width:160px;
			display: inline-block;
			font-size:21px;
			text-align: right;
			margin-right:10px;
			color:#666;
			height: 20px;
			line-height:20px;
		}

		#joinBox input {
			border: 1px solid #E1E1E1;
			width: 333px;
			height: 28px;
			font-size: 21px;
			font-family: 'bon', sans-serif;
			font-weight: 500;
			padding:6px;
			color:#606060;
			transition: .2s ease;
		}

		#joinBox #profile {
			font-size:15px;
			cursor: pointer;
			height:30px;
		}

		#birthDate {
			display: inline-block;
			text-align: right;
		}

		#birthDate input {
			width:70px;
		}

		#birthDate label {
			width:auto;
		}

	</style>
<body>
<div id="header">
	<h1><a href="index"><img src="img/spring-boot-logo.png" width="60"/> <strong>Spring</strong> Board</a></h1>
</div>
<div id="content">
	<div class="aux">
		<h2>회원가입폼</h2>
		<div id="joinBox">
			<form method="post" action="join" enctype="multipart/form-data">
				<fieldset>
					<legend class="screen_out">회원가입폼</legend>
					<div>
						<label for="id">아이디</label>
						<input id="id" name="id"
						placeholder="영어,숫자로 4~20자 입력"
						title="영어,숫자로 4~20자 입력"
						pattern="[\w]{4,20}"
						required/>
						<c:if test="${idMsg!=null }">
						<span>
						${idMsg } 
						</span>
						</c:if>
					</div>
					<div>
						<label for="nickname">별 명</label>
						<input id="nickname"
						required pattern="[ㄱ-힣|0-9]{1,10}"
						placeholder="10자 내로 한글,숫자 입력"
						title="10자 내로 한글,숫자 입력"
						 name="nickname"/>
						<c:if test="${nicknameMsg!=null }">
						<span>
						${nicknameMsg } 
						</span>
						</c:if>
					</div>
					<div>
						<label for="pwd">비밀번호</label>
						<input type="password" id="pwd"
						required pattern="[\w]{4,32}"
						placeholder="4~32자로 입력"
						title="4~32자로 입력"
						 name="password" />
					</div>
					<div>
						<label for="confirm">비밀번호 확인</label>
						<input type="password" id="confirm" name ="confirm"
						pattern="[\w]{4,32}"
						required placeholder="위와 동일하게 입력"
						title="위와 동일하게 입력" />
					</div>
					<div>
						<label for="birthDate">생년월일</label>
						<p id="birthDate">
							<label>
								<input type="text" id="year" name="year"
							required pattern="[1-9]{1}[0-9]{3}"
							title="태어난 년도를 입력"
							 placeholder="년"/>년</label>
							 
							<label>
								<input type="text" id="month" name="month"
								required pattern="[0-9]{1,2}"
							title="태어난 월을 입력"
							 placeholder="월"/>월
							</label>
							<label>
								<input type="text" id="date" name="date"
								required pattern="[0-9]{1,2}"
							title="태어난 일을 입력"
							 placeholder="일"/>일
							</label>
						</p>
					</div>
					<div>
						<label for="profile"><span>프로필사진</span></label>
						<input type="file" name="upload" id="profile" />
					</div>
					<div class="btn_box">
						<button class="btn" type="submit">회원가입</button>
						<button class="btn" type="reset">초기화</button>
						<a class="btn" href="index">index으로</a>
					</div>
				</fieldset>
			</form>
		</div><!--// joinBox -->
		</div>
		</div>
<c:import url="template/footer.jsp"></c:import>
</body>
</html>
