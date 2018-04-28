<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
	<meta charset="UTF-8">
	<title>Spring 게시판</title>
	<c:import url="template/link.jsp"></c:import>
<style>
		#content ul {
			width:1000px;
			margin:10px auto;
		}
		.article {
			border-bottom:1px solid #e6e7e7;
			margin:10px 0;
		}

		.article a {
			display: block;
			height:140px;
			position: relative;
		}
		.article a:hover {
			background: #e6e7e7;
		}

		.article .title {
			position: absolute;
			left:150px;
			line-height: 140px;
			font-size:24px;
			color:#676767;
			width:820px;
			white-space: nowrap;
			word-break: break-all;
			text-overflow: ellipsis;
			overflow: hidden;
		}
		.article a:hover .title {
			color:#14bab6;
			font-size:28px;
			font-weight:bold;
		}
		.article time {
			position: absolute;
			bottom:20px;
			right:20px;
			font-size:20px;
		}
		.hit {
			position: absolute;
			color:#9E9E9E;
			bottom:22px;
			left:150px;
		}
		.comment {
			position: absolute;
			right:20px;
			top:20px;
			font-size:20px;
			color:#14bab6;
		}
		.title span {
			vertical-align: middle;
		}
		.box_btn {
			width:1100px;
		}
		.no_article {
			text-align:center;
			font-size:28px;
			min-height:300px;
		}
		
	
		a div.like_box{
			width: 100px;
			height: 26px;
			position: absolute;
			bottom:20px;
			left:220px;
			/*background-color: yellow;*/
		}
		.like_num{
			display: block;
			width: 70px;
			height: 26px;
			/*background-color: red;*/
			position: absolute;
			right: 0;
			text-align: left;
			line-height: 26px;
		}
		.unlike_btn{
			display: block;
			width: 26px;
			height: 26px;
			text-indent: -99999999px;
			overflow: hidden;
			background-image: url("/img/likeimg.png");
			/*background-position:206px 50px;*/
			background-position:50px 50px;
			position: absolute;
			left:0px;
		}
	</style>
</head>
<body>
<c:import url="template/header.jsp"/>
<div id="content">
	<div class="aux">
	<h2>게시글 목록</h2>
	<c:choose>
		<c:when test="${articles.isEmpty() }">
		<p class="no_article">
		아직 게시글이 없습니다.
		</p>
		</c:when>
		<c:otherwise>
		<ul>
		<c:forEach items="${articles }" var="article">
		<li class="article">
			<a href="/article/${article.no }">
				<div class="card_user">
					<img src="/profile/${article.profile }" width="100" />
					<strong>테스터</strong>
				</div>
				<h3 class="title">
					${article.title }
				</h3>
				<time>${article.regdate }</time>
				<strong class="comment"><i class="fa fa-comment"></i> ${article.replies }</strong>
				<span class="hit"><i class="fa fa-eye"></i> ${article.hit }</span>
				<div class="like_box" >
					<span  class="unlike_btn">좋아요</span>
					<span class="like_num">${article.likes }</span>
				</div><!--//.like_box -->
			</a>
				
		</li>
		
		
		</c:forEach>
		
	</ul>
		${paginate }
		
		</c:otherwise>
	</c:choose>
	

	<div class="box_btn">
		<a href="/article/write" class="btn">글쓰기</a>
	</div>
	</div><!--//aux -->
</div><!--//content-->
<c:import url="template/footer.jsp"></c:import>
</body>
</html>
