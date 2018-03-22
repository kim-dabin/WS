<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
	<head>
		<meta charset="utf-8" />
		<title>회원가입</title>
		<link rel="stylesheet" href="css/reset.css"/>
		<link rel="stylesheet" href="css/font-awesome.min.css"/>
		<link rel="stylesheet" href="css/notosanskr.css" />
		<link rel="stylesheet" href="css/main.css"/>
		<link rel="shortcut icon" href="img/favicon.ico" />
		<style>
			body {
				background:#F4F5F6;
			}
			
			h1 {
			height:64px;
			background-image:url(img/bg_main_topbar.png);
			background-repeat:repeat-x;
            background-position:0 -132px;
			position: relative;
			}
			h2 {
				font-size:24px;
				font-weight:500;
				text-align: center;
				margin:10px;
				color:#424242;
			}
			#footer {
				width:100%;
				height:64px;
				line-height:64px;
				position: fixed;
				left:0;
				bottom:0;
			}
			#joinBox {
				width: 600px;
				margin: auto;
			}

			#joinBox p {
				margin: 20px;
			}

			#joinBox p > label {
				width: 160px;
				display: inline-block;
				font-size: 19px;
				text-align: right;
				margin-right: 6px;
				color: #666;
				vertical-align: middle;
			}

			#joinBox p > input {
				width: 200px;
				vertical-align: middle;
				padding: 8px;
				border: 1px solid #999;
				font: 100 19px 'Noto Sans KR', sans-serif;
			}

			#joinBox p > input:focus {

				border-color: #333;
				outline: 1px solid #333;
			}

			#joinBox #btnBox {
				text-align: center;
			}

			#joinBox p > label.profile {
				cursor: pointer;
				width: 205px;
			}

			.profile > span {
				vertical-align: middle;
				margin-right: 5px;
			}

			label.profile::after {
				content: "";
				width: 40px;
				height: 40px;
				background: url(img/write_form_function.png);
				background-repeat: no-repeat;
				background-position: -45px -233px;
				display: inline-block;
				vertical-align: middle;
			}

			/*file을 숨기고 label을 클릭하면*/

			#profile {
				/*width:200px;
				 cursor: pointer;
				 opacity: 0;*/
				display: none;
			}

			.msg {
				text-align: center;
				color: deeppink;
			}

			.msg.ok {
				color: #00bfff;
			}

			.id_loading {
				width: 24px;
				height: 24px;
				text-indent: -9999px;
				overflow: hidden;
				background: url(img/ajax-loader.gif);
				vertical-align: middle;
				display: none;
			}

			#logoutBox {
				position: absolute;
				bottom: 5px;
				right: 5px;
				text-align: right;
			}

			#logoutBox > * {
				vertical-align: middle;
			}
			#logoutBox img {
				width: 60px;
				height: 60px;
				border-radius: 30px;
			}
			#logoutBox em {
				font-size: 21px;
				color: #333;
				font-weight: 500;
			}

		</style>
	</head>
	<body>
		<h1><a href="index.jsp"><img src="img/logo.png" ></a></h1>
			<div id="joinBox">
				<h2>회원 가입</h2>
				<form id="joinForm" action="join.jsp" method="post" enctype="multipart/form-data">
					<fieldset>
						<legend class="screen_out">
							회원가입폼
						</legend>
						<p>
							<label for="joinId">아이디</label>
							<input name="id" id="joinId" 
							placeholder="영어,숫자로 4~16자 입력"
							/>
							<!-- autocomplete="off" -->
							<button id="checkBtn" class="btn" type="button">
								id중복확인
							</button>
							<span class="id_loading">로딩중</span>
						</p>
						<div class="id msg">
							id 중복확인을 해주세요.
						</div>
						<p>
							<label for="nickname">별 명</label>
							<input id="nickname" name="nickname"
							placeholder="10자 내로 한글 입력"
							/>
						</p>
						<p>
							<label for="joinPwd">비밀번호</label>
							<input name="password" type="password" id="joinPwd"
							placeholder="4~32자로 입력"
							 />
						</p>
						<p>
							<label for="confirm">비밀번호 확인</label>
							<input type="password" id="confirm"  placeholder="위와 동일하게 입력" />
						</p>
						<p>
							<label title="파일을 선택해주세요." for="profile" class="profile"><span>프로필 사진</span></label>
							<input name="profile" type="file" id="profile" accept="image/*" />
							<span class="profile">파일을 선택해주세요.</span>
						</p>
						<p id="btnBox">
							<button class="btn" type="submit">
								회원가입
							</button>
							<button class="btn" type="reset">
								초기화
							</button>
							<a class="btn" href="index.jsp">index으로</a>
						</p>
					</fieldset>
				</form>
			</div>
		<div id="footer">
			&copy;2017 mhd.com
		</div>
	<script src="js/jquery.js" type="text/javascript"></script>
	<script src="js/underscore.js" type="text/javascript"></script>
	<script type="text/javascript">
		var $joinId = $("#joinId");//입력된 아이디 input
		var $msg = $(".msg");//아이디 확인 메세지
		//영어또는숫자로 4-16자 입력
		var reg=/^[a-z|A-Z][a-z|A-z|0-9]{3,15}$/;
		
		//아이디 중복확인 버튼 클릭
		$("#checkBtn").click(function() {
			//alert("hi"); //test 김다빈 2018.01.17
			var joinId = $joinId.val(); //입력된 아이디	
			if(reg.test(joinId)){//정규식 만족
				//ajax로 아이디 정보가 있는지 확인
				//alert(joinId);//test 김다빈 2018.01.17
				$.ajax("ajax/checkId.jsp",{ 
					dataType:"json",
					type:"GET",
					data:{"joinId":joinId},
					error:function(xhr,error){
						alert(error);
					},
					success:function(json){
						if(json.result){//아이디가 기존에 존재
							$msg.removeClass("id").text("아이디가 존재합니다. 다른 아이디를 입력하세요.");
						}else{//아이디가 기존에 없음
							$msg.removeClass("id").text(joinId+"는 사용할 수 있습니다");
						}
					}
				});//ajax end
			}else{//정규식 만족 안됨
				$msg.removeClass("id").text("올바른 아이디 형식이 아닙니다."); //메세지 띄움
			}
			
		});//click end
		
		
		
	</script>
	</body> 
</html>
    