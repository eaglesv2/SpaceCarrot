<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../Base/reset.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<c:if test="${empty articlePage}">
	<%
			RequestDispatcher rd = request.getRequestDispatcher("Writer_Search.do");
			rd.forward(request, response);
			System.out.print("redirect success");
	%>
</c:if>
<script>
	$(document).ready(function() {
		$("#header").load("../Base/Header.jsp");
		$("#footer").load("../Base/footer.html");
	})
</script>
<style>
#container {
	margin: 0 auto;
	width: 1080px;
	/* border : 2px solid black; */
}
/* 커뮤니티 타이틀 */
#title ul li {
	list-style: none;
}

.title_wrap {
	text-align: center;
	margin-bottom: 35px;
}


.title_wrap a {
	color: #fff;
	background-color: #fc585e;
	padding: 25px 0px;
	font-size: 16pt;
	font-weight: bold;
	display: block;
	margin: 0 auto;
}

#wrap {
	margin: 0 auto;
	width: 715px;
	text-align: center;
	margin-left: 183px;
}
/* 카테고리 메뉴 */
#category {
	height: 40px;
	margin-left: 300px;
	margin-bottom: 30px;
}

#category ul {
	height: 40x;
	padding: 0;
}

#category ul li {
	list-style: none;
	color: #000000;
	float: left;
	text-align: center;
	padding-right: 40px;
}

#category ul li:last-child {
	padding: 0;
}

#category .menuLink {
	text-decoration: none;
	color: #000000;
	display: block;
	font-size: 11.5pt;
	font-weight: bold;
}
/* #category .menuLink:hover { text-decoration : underline; 
                           text-underline-position : under;
                          } */
.writting:after {
	content: "";
	display: block;
	width: 48px;
	text-align: center;
	border-bottom: 2px solid #000;
	margin-top: 8px;
}

a {
	text-decoration: none;
	color: #404040;
}

li {
	list-style: none;
}

/* 게시글 목록 */
#board_wrap {
   width: 720px;
   margin-top: 0px;
   vertical-align: center;
   text-align: center;
   margin-left: 0px;
}

table {
   border-top: 2px solid black;
}

th {
   border-top: 2px solid black;
   border-bottom: 2px solid black;
   height: 50px;
   vertical-align: middle;
   color: black;
}

td {
   border-top: 1px solid #a0a0a0;
   height: 50px;
   vertical-align: middle;
}

/* 페이지번호 */
#page_number {
	margin-top: 50px;
}

#page_number ul li {
	list-style: none;
	display: inline;
}

#page_number ul li a {
	padding: 4px;
	margin-right: 20px;
	/* height: 50px; */
	width: 15px;
	color: #000;
	font-size: 12pt;
	text-align: center;
	text-decoration: none;
}

#page_number ul li a:hover, ul li a:focus {
	color: #fff;
	border: 1px solid #000;
	border-radius: 50%;
	background-color: #000;
}
</style>
</head>
<meta charset="UTF-8">
<title>커뮤니티_작성자</title>
</head>
<body>

	<div id="container">
		<div id="header"></div>

		<div id="title">
			<ul>
				<li class = "title_wrap"><p><a href="Community_List_Default.jsp">커뮤니티 - 작성자가 올린 글 보기</a></p></li>
			</ul>
		</div>

		<div id="wrap">
			<div id="category">
				<ul>
					<li class="writting"><a class="menuLink"href="Community_Writer_Writting.jsp">작성글</a></li>
					<li><a class="menuLink" href="Community_Writer_Comment.jsp">작성댓글</a></li>
				</ul>
			</div>

			<div id="board_wrap">
				<table>
					<colgroup>
						<col width="100px">
						<col width="600px">
						<col width="100px">
						<col width="100px">
						<col width="100px">
					</colgroup>
					<tr>
						<th>번호</th>
						<th>제목</th>
						<th>작성자</th>
						<th>조회수</th>
						<th>작성일</th>
					</tr>
					<!-- articlePage 파라미터에 글이 없을 시에 출력 -->
					<c:if test="${articlePage.hasNoArticles()}">
						<tr>
							<td colspan="4">게시글이 없습니다.</td>
						</tr>
					</c:if>
					<!-- articlePage의 content 파라미터를 반복한다 -->
					<c:forEach var="article" items="${articlePage.content}">
						<tr>
							<td>${article.postNum}</td>
							<td><a
								href="Read_Community.do?no=${article.postNum}&pageNo=${articlePage.currentPage}"><c:out
										value="${article.subject}"></c:out></a></td>
							<td>${article.userNickName}</td>
							<td>${article.views}</td>
							<td>${article.regDate}</td>
						</tr>
					</c:forEach>
					<!-- 게시판 이동 항목 -->
					<c:if test="${articlePage.hasArticles()}">
						<tr>
							<td colspan="5">
								<!-- 현재페이지가 5 이상일 시 이전 링크--> 
								<c:if test="${articlePage.startPage > 5}">
									<a href="Writer_Search.do?pageNo=${articlePage.startPage - 5}">[이전]</a>
								</c:if> 
								<!-- startPage to endPage --> 
								<c:forEach var="pNo" begin="${articlePage.startPage}" end="${articlePage.endPage}">
									<a href="Writer_Search.do?pageNo=${pNo}">[${pNo}]</a>
								</c:forEach> 
								<!-- endPage가 총페이지보다 작을 시에 다음 링크 -->
								<c:if test="${articlePage.endPage < articlePage.totalPages}">
									<a href="Writer_Search.do?pageNo=${articlePage.startPage + 5 }">[다음]</a>
								</c:if>
							</td>
						</tr>
					</c:if>
				</table>
			</div>

		</div>
		<div id="footer"></div>
	</div>
</body>
</html>