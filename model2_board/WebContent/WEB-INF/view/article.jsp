<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="utf-8">
	<title>게시글 보기</title>
	<c:import url="template/link.jsp"></c:import>
	<style>
		#contentsBox {
			width:1100px;
			border:1px solid #9E9E9E;
			margin:auto;
			font-size:22px;
			border-bottom:none;
		}
		#infoBox {
			width:1100px;
			height:160px;
			position: relative;
			border-bottom:1px solid #9E9E9E;
		}
		#no {
			font-size:26px;
			position: absolute;
			top:15px;
			left:-15px;
			background:#14BAB6;
			width:48px;
			height:40px;
			z-index:1;
			text-align: center;
			font-weight:bold;
			color:#fff;
			line-height:40px;
			box-shadow: 0 8px 17px 0 rgba(0, 0, 0, 0.2), 0 6px 20px 0 rgba(0, 0, 0, 0.19);
		}
		#no::after {
			content:"";
			display: block;
			position: absolute;
			border-top:15px solid #0e8783;
			border-left:15px solid transparent;
		}
		#title {
			width:900px;
			position: absolute;
			font-size:28px;
			color:#676767;
			font-weight:bold;
			left:160px;
			top:60px;
			text-overflow: ellipsis;
			white-space: nowrap;
			overflow:hidden;
		}
		.card_user {
			left:30px;
			top:20px;
		}
		#regdate {
			position: absolute;
			bottom:12px;
			right:20px;
			font-size:17px;
		}
		#hit {
			position: absolute;
			top:15px;
			right:15px;
		}

		#contents {
			min-height: 500px;
			padding: 30px;
			white-space: pre-line;
			word-break: break-all;
		}
		.box_btn {
			height: 50px;
			border-top:1px solid #9E9E9E;
			padding:20px;
			position: relative;
		}

		#replyBox {
			width:1100px;
			margin:0 auto 20px auto;
			border:1px solid #9E9E9E;

		}
		#replyBox h3 {
			text-align: center;
			font-size:26px;
			margin:16px;
			font-weight:bold;
		}

		#formBox {
			width: 900px;
			height: 110px;
			margin:20px auto;
			position: relative;
		}
		#contentsField {
			width: 760px;
			min-height: 90px;
			padding: 10px;
			border: none;
			color: #333;
			resize: none;
			border:1px solid #9E9E9E;
			font: 19px "Noto Sans KR", "나눔고딕", nanumGothic, "맑은 고딕", malgunGothic, "돋움", dotum, sans-serif;
		}

		#contentsField:focus {
			border-color:#14BAB6;
			outline: 3px solid #14BAB6;
		}

		#formBox #writeBtn {
			position: absolute;
			right: 0px;
			width: 110px;
			height: 110px;
			padding: 0;
		}


		#replyListBox {
			width: 900px;
			margin: 20px auto;
		}

		#replyListBox ul {
			border-top: 1px solid #9E9E9E;
		}

		#replyListBox li {
			padding: 10px;
			min-height: 140px;
			border-bottom: 2px dotted #bbb;
			overflow: hidden;
			position: relative;
			padding-bottom: 20px;
		}

		#replyListBox .box_reply {
			width: 730px;
			min-height: 100px;
			/* 포지셔닝 컨텍스트 지정 */
			position: relative;
			padding-left: 20px;
			padding-top: 50px;
			left:130px;
			top:0;
		}

		#replyListBox .delete {
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
			line-height:36px;
		}

		#replyListBox .delete:hover {
			background: #14BAB6;
		}

		#replyListBox .comments {
			width: 680px;
			min-height: 70px;
			background: #b5f4f2;
			border-radius: 0 12px 12px 12px;
			padding: 10px;
			position: relative;
			color: #424242;
			white-space: pre-wrap;
			/* 단어를 브레이크 */
			word-wrap: break-word;
		}

		#replyListBox .box_reply .time {
			top: 26px;
			left: 20px;
			position: absolute;
			font-size: 15px;
		}

		#replyListBox .comments::before {
			content: "";
			display: block;
			position: absolute;
			left: -10px;
			top: 0;
			width: 0;
			height: 0;
			border-bottom: 10px solid transparent;
			border-right: 10px solid #b5f4f2;
		}

	.no_reply {
			text-align: center;
			font-size:22px;
			line-height:140px;
		}
		#boxBtn {
			width: 254px;
			height: 37px;
			position: absolute;
			right: 20px;
			top: 27px;
		}

		div.like_box{
			width:100px;
			height: 50px;
			position: absolute;
			left: 20px;
			top: 20.5px;
		}
		.like_num{
			display: block;
			width: 50px;
			font-size: 20px;
			position: absolute;
			right: 0;
			top:15px;

		}
		.unlike_btn{
			display: block;
			width: 47px;
			height: 50px;
			text-indent: -99999999px;
			overflow: hidden;
			background-image: url("/img/like.png");
			background-position:457px 100px;
			position: absolute;
			left: 0;
			cursor: pointer;
		}
		.like_btn{
			background-position: 407px 100px;
			position: absolute;

		}
		#replyListBox li div.like_box{
			position: absolute;
			left: 730px;
			top:0px;
		}

	</style>
</head>
<body>
<c:import url="template/header.jsp"></c:import>
<div id="content">
<div class="aux">
		<h2>게시물 보기</h2>
		<div id="contentsBox">
			<div id="infoBox">
				<dl>
					<dt class="screen_out">번호</dt>
					<dd id="no">${article.no }</dd>
					<dt class="screen_out">글쓴이정보</dt>
					<dd class="card_user">
						<img src="/profile/${article.profile }" width="100" />
						<strong>${article.writer }</strong>
					</dd>
					<dt class="screen_out">글쓴시간</dt>
					<dd>
						<time id="regdate">${article.regdate }</time>
					</dd>
					<dt class="screen_out">조회수</dt>
					<dd id="hit">
						<i class="fa fa-eye"></i> ${article.hit }
					</dd>
				</dl>
				<h3 id="title">${article.title }</h3>
			</div>
			<p id="contents">${article.contents }</p>

			<div class="box_btn">
				<div class="like_box" >
					<span class="unlike_btn" data-type="A" data-typeNo="${article.no }" data-userNo="${logUser.no }">좋아요</span>
					<span class="like_num">${article.likes }</span>
				</div><!--//.like_btn -->
				<div id="boxBtn">
				<form action="/article/${article.no }" method="post">
				<c:if test="${ logUser != null && article.writerNo eq logUser.no }">
					<input type="hidden" name="_method" value="DELETE"/>
					<button class="btn" id="deleteBtn">삭 제</button>
					<a href="/article/update/${article.no }" class="btn" id="modifyBtn">수 정</a>
					</c:if>
					<a href="/index" class="btn">게시판으로</a>
				</form>
				</div>
			</div>
		</div>

		<div id="replyBox">
		
			<h3><i class="fa fa-comment"></i> 댓글${totalReplies }개</h3>
			<c:if test="${logUser!=null }">
			<div id="formBox">
			<form action="/article/${article.no }/comment" method="post" >
				<textarea name="contents" maxlength="140" id="contentsField" placeholder="새 글을 입력합니다."></textarea>
				<input type="hidden" name="writer" value="${logUser.nickname }" />
				<input type="hidden" name="writerNo" value="${logUser.no }"/>
				<input type="hidden" name="articleNo" value="${article.no }"/>
				<input type="hidden" name="profile" value="${logUser.profile }"/>
				<button type="submit" id="writeBtn" class="btn">올리기</button>
			</form>
			</div><!--//formBox-->
			</c:if>
		
			
			
			<c:choose>
				<c:when test="${replies== null}">
					<p class="no_reply">댓글이 아직 없습니다.</p>
				</c:when>
				<c:otherwise>
					<div id="replyListBox">
			<ul>
			<c:forEach items="${replies }" var="reply">
				<li>
				<!-- 
					<div class="like_box" >
						<a href="#" class="unlike_btn">좋아요</a>
						<span class="like_num">100</span>
					</div><!--//.like_btn -->
					<div class="card_user">
						<img src="/profile/${reply.profile }" width="100"/>
						<strong>${reply.writer }</strong>
					</div><!-- //card_user -->
					<div class="box_reply">
						<div class="comments">${reply.contents }</div>
						<c:if test="${logUser != null && logUser.no eq reply.writerNo }">
							<form action="/article/${article.no }/comment/${reply.no}" method="post">
								<button href="/article/${article.no }/comment/${reply.no}" class="btn delete">
									<i class="fas fa-times"></i>
									<span class="screen_out">삭제</span>
								</button>
							</form>			
						</c:if>		
					<time class="time" data-time="">${reply.regdate }</time>
					</div><!--//box_reply-->
				</li>
			</c:forEach>
			</ul>
			${paginate }
		</div><!--//replyListBox -->
				</c:otherwise>
			</c:choose>
			
			
		</div><!--//replyBox-->
	</div><!--//aux-->
	</div><!--//content -->
<c:import url="template/footer.jsp"></c:import>
<script src="/js/jquery.js"></script>
<script src="/js/like.js"></script>
<script>


</script>





</body>
</html>

