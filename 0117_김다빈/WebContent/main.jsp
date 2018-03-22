<%@page import="com.mhd.bband.vo.Page"%>
<%@page import="com.mhd.bband.vo.BBander"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//로그인 객체 갖고 오기
	BBander logMember= (BBander)session.getAttribute("logMember");	
//현재 페이지 
int now =1;
String pageStr = request.getParameter("page");

if(pageStr != null){
	now = Integer.parseInt(pageStr);
	System.out.println("pageStr: "+now);
	//System.out.println(now);
}// if end

//한 페이지에 보여줄 댓글 수
int numPage = 5;

//한 페이지에 보여질 페이지 블록 수
int numBlock = 3;

%>    
    
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="utf-8" />
<title>main</title>
<link rel="stylesheet" href="css/reset.css"/>
<link rel="stylesheet" href="css/font-awesome.min.css"/>
<link rel="stylesheet" href="css/notosanskr.css" />
<link rel="stylesheet" href="css/main.css"/>
<link rel="shortcut icon" href="img/favicon.ico" />
<style>
	#formBox {
		width: 750px;
		height: 90px;
		padding: 20px;
		margin: 5px auto;
		background: #04C49D;
		position: relative;
	}

	#formBox * {
		vertical-align: top;
	}

	#formBox #contentsField {
		width: 650px;
		min-height: 80px;
		padding: 4px;
		border: none;
		color: #333;
		resize: none;
		font: 15px "Noto Sans KR", "나눔고딕", nanumGothic, "맑은 고딕", malgunGothic, "돋움", dotum, sans-serif;
	}

	#formBox #writeBtn {
		position: absolute;
		right: 15px;
		top: 20px;
		width: 90px;
		height: 88px;
		padding: 0;
	}

	#formBox .msg {
		width: 655px;
		height: 100px;
		line-height: 80px;
		padding: 12px;
		border-radius: 10px;
		opacity: .6;
		position: absolute;
		left: 0;
		top: 0;
		text-align: center;
		font-weight: 500;
		font-size: 30px;
		color: crimson;
		background-color: #B4E6FF;
	}

	#formBox .loading {
		width: 657px;
		height: 88px;
		line-height: 77px;
		opacity: .6;
		position: absolute;
		left: 20px;
		top: 20px;
		text-align: center;
		background: url(img/writeLoading.gif) no-repeat center;
		background-color: #B4E6FF;
		display: none;
	}

	#boardList {
		width: 800px;
		margin: 10px auto;
	}

	#boardList ul {
		border-top: 1px solid #666;
	}

	#boardList li {
		padding: 10px;
		min-height: 100px;
		border-bottom: 2px dotted #bbb;
		overflow: hidden;
	}

	#boardList .profileBox {
		width: 100px;
		height: 150px;
		float: left;
		position: relative;
		text-align: center;
	}

	#boardList .profileBox > h3 {
		margin-top: 10px;
		text-align: center;
		font-weight: 500;
		font-size: 21px;
	}

	#boardList .profileBox > img {
		width: 100px;
		height: 100px;
		border-radius: 50px;
	}

	#boardList .contentsBox {
		width: 660px;
		min-height: 100px;
		float: left;
		/* 포지셔닝 컨텍스트 지정 */
		position: relative;
		padding-left: 20px;
		padding-top: 50px;
	}

	#boardList .delete {
		font-size: 19px;
		font-weight: 500;
		position: absolute;
		top: 0;
		right: 0;
		background: #aaa;
		color: #fff;
		text-decoration: none;
		width:32px;
		height:32px;
		border-radius:16px;
		text-align: center;
		padding:0;
	}

	#boardList .delete:hover {
		background: #04C49D;
	}

	#boardList .comments {
		width: 620px;
		min-height: 70px;
		background: #01BC94;
		border-radius: 0 12px 12px 12px;
		padding: 10px;
		position: relative;
		color: #fff;
		white-space: pre-wrap;
		/* 단어를 브레이크 */
		word-wrap: break-word;
	}

	#boardList .comments .time {
		bottom: 10px;
		right: 10px;
		color: #fff;
		position: absolute;
		font-size: 15px;
	}

	#boardList .comments::before {
		content: "";
		display: block;
		position: absolute;
		left: -10px;
		top: 0;
		width: 0;
		height: 0;
		border-bottom: 10px solid #fff;
		border-right: 10px solid #01BC94;
	}
	
	#boardList .loader {
		width:800px;
		height: 100px;
		background-image: url(img/boardLoading.gif);
		background-color:#fff;
		background-repeat: no-repeat;
		background-position: center;
		position: absolute;
		z-index: 2;
	}


	.blind {
		display: none;
	}

	#boardList .paginate {
		clear: both;
		padding: 10px;
		text-align: center;
	}

	.paginate a, .paginate strong {
		font-size: 12px;
		background: url("img/sp_paginate_v2.gif") no-repeat -42px 0;
		color: #666666;
		cursor: pointer;
		display: inline-block;
		font-family: tahoma;
		font-weight: 500;
		height: 32px;
		line-height: 32px;
		margin-right: -1px;
		text-decoration: none;
		vertical-align: top;
		width: 32px;
		transition: font-size .2s ease;
	}

	.paginate strong, .paginate a:hover {
		background-position: -42px -64px;
		color: #3D6ED3;
		margin: -1px -2px -2px -1px;
		padding: 1px 1px 2px 1px;
		position: relative;
		z-index: 1;
		font-size: 16px;
		text-decoration: underline;
	}

	.btnBox {
		text-align: right;
	}

	.paginate strong {
		font-size: 18px;
		cursor: default;
		text-decoration: none;
	}

	.paginate .prev, .paginate .next {
		background: url("img/sp_paginate_v2.gif") no-repeat;
		border: 0 none;
		display: inline-block;
		font-size: 0;
		text-indent: -9999px;
		height: 32px;
		line-height: 0;
		margin: 0;
		overflow: hidden;
		padding: 0;
		vertical-align: top;
		width: 42px;
	}

	.paginate .prev {
		background-position: 0 0;
		margin-right: -1px;
	}

	.paginate a.prev {
		background-position: 0 -32px;
	}

	.paginate a.prev:hover {
		background-position: 0 -65px;
		margin: 0;
		margin-right: -1px;
		padding: 0;
	}

	.paginate .next {
		background-position: -74px 0;
	}

	.paginate a.next {
		background-position: -74px -32px;
	}

	.paginate a.next:hover {
		background-position: -76px -65px;
		margin: 0;
		padding: 0;
	}

	#logoutBox {
		position: absolute;
		text-align: right;
		right:0;
		bottom:12px;
	}
	
	.contentsBox time {
		position: absolute;
		left:22px;
		top:10px;
		font-size:15px;
		color:#aaa;
	}
	
	#logoutBox > * {
		vertical-align: middle;
	}
	#logoutBox img {
		width: 40px;
		height: 40px;
		vertical-align: middle;
		margin-right:10px;
	}
	
	#logoutBox .logout {
		width:21px;
		height:21px;
		display:inline-block;
		vertical-align: middle;
		background:url(img/top_logout.png);
		text-indent: -9999px;
		overflow: hidden;
	}
	#logoutBox .logout:hover {
		background:url(img/top_logout_on.png);
	}
	
	#noComment {
		font-size:24px;
		text-align: center;
		line-height: 100px;
		font-weight:500;
		color:#424242;
	}
	
</style>
</head>
<body>
	<div id="header">
		<div class="aux">
		<h1><a href="main.jsp"><img src="img/logo.png" ></a></h1>
			<div id="logoutBox">
				<img title="<%=logMember.getNickname() %>" src="profile/<%=logMember.getProfile() %>" />
				<a href="logout.jsp" class="logout" title="로그아웃"><span class="screen_out">로그아웃</span></a>
			</div><!--// logoutBox -->
		</div><!--// .aux -->
	</div><!--// header -->
	<div id="content">
		<div class="aux">
		<div id="formBox">
			<textarea maxlength="140" id="contentsField" placeholder="새 글을 입력합니다."></textarea>
			<button id="writeBtn" class="btn">
				 올리기
			</button>
			
		</div>
		<div id="boardList">
			<h2>댓글 목록</h2>
			<div class="btnBox">
				<button id="refreshBtn" class="btn" ><i class="fa fa-refresh"></i> 댓글 새로고침
				</button>
			</div>
			<ul></ul>
				
			</div>
		</div><!--// commentsList -->
		</div><!--// .aux -->
	</div><!--// content -->
	<div id="footer">
		&copy;2017 mhd.com
	</div><!--// footer -->
<script type="text/template" id="contentsTmpl">
<@if(!posts.isEmpty){ @>
<@ $(posts).each(function(){ @>
<li>
	<div class="profileBox">
		<img src="profile/<@=this.profile @>"/>
		<h3><@=this.nickname @></h3>
	</div>
	<div class="contentsBox">
		<div class="comments"><@=this.contents @></div>
		<@if(logMemberNo==this.writerNo){ @>
		<button class="btn delete" data-no="<@=this.no @>">
			<i class="fa fa-times"></i>
			<span class="screen_out">삭제</span>
		</button>
		<@} @>
		<time class="time" data-time=" ">2017-3-7 12:23:12</time>
	</div>
</li>
<@ })@>
<@}else{ @>
	<li id="noComment">
		댓글이 없습니다.
	</li>	
<@ } @>
</script>
<script src="js/jquery.js"></script>
<script src="js/underscore.js"></script>
<script type="text/javascript">

//템플릿 다른 기호로 변경
	_.templateSettings = {
		interpolate: /\<\@\=(.+?)\@\>/gim,
		evaluate: /\<\@(.+?)\@\>/gim,
		escape: /\<\@\-(.+?)\@\>/gim
		};
	var $writeBtn=$("#writeBtn");//댓글 입력 버튼
	var $contentsField = $("#contentsField");//댓글 입력 폼"contentsField"
	var $contentsTmp = _.template($("#contentsTmpl").html());//댓글 템플릿
	var $ul = $("ul");//ul jquery 객체
	var $delete = $(".delete");//댓글 삭제
	
	callPosts();//댓글 불러오기
	
	//댓글 삭제
	$ul.on("click",".delete",function(e){
		var no = $(this).attr("data-no");//댓글 주키
		var that = this;//클릭한 .delete 요소 전체 갖고 옴
		//console.log(that); //test 20180119 김다빈
		//alert(no);  //test 20180119 김다빈
		$.ajax("ajax/deletePost.jsp",{
			dataType:"json",
			type:"GET",
			data:{"no": no},
			error:function(xhr,error){alert("시스템점검중"+error);},
			success:function(json){
				if(json.result){
					//삭제버튼 클릭한 댓글 지우기
					$(that).parents("li").remove();
				}
			}
		});//ajax end
	});//delete end

	//글쓰기 버튼 클릭 이벤트 발생
	$writeBtn.click(function() {
	 var contents= $contentsField.val();//댓글 입력 내용
	// alert(contents); //test 김다빈 20180118

	if(contents.length>0){//입력한게 있을 시에
		$.ajax("ajax/insertPost.jsp",{
			dataType:"json",
			type:"GET",
			data:{"contents":contents},
			error:function(xhr,error){
				alert("에러입니다"+error);},
			success:function(json){
				//alert("입력되었습니다.");//test 20180118김다빈
				console.log(json);
				if(json.result){
					$contentsField.empty();//댓글 입력 폼 내용 지우기 placeholder 왜 사라지지?
					callPosts();//댓글 불러오기
				}else{
					$contentsField.empty();//댓글 입력 폼 내용 지우기
				}
			}
		});//ajax end
	}//if end
	});//click end
	
	//댓글 리스트 불러오기
	function callPosts() {
		$.ajax("ajax/callPosts.jsp",{
			dataType:"json",
			type:"POST",
			data:{"now":<%=now %>, "numPage":<%=numPage %>, "numBlock":<%=numBlock %>} ,
			error:function(xhr,error,code){alert(code)},
			success:function(json){
				$ul.html($contentsTmp({posts:json,logMemberNo:<%=logMember.getNo() %>}));//#contentsTmpl 템플릿에 json객체를 보내고 ul안에 넣음
				$("#content").append(paging);
			}
		});//ajax end
	}

</script>

</body>
</html>


