<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../Base/reset.css" />
<c:if test="${empty articlePage}">
	<% String category = (String)request.getParameter("category");
	   RequestDispatcher rd = request.getRequestDispatcher("Commerce_Reset.do");
	   rd.forward(request, response);
	   System.out.println("After Dispatcher category = " + category);
	 %>
</c:if>

<script>        
	$(document).ready(function(){    
		$("#header").load("../Base/Header.jsp");
		$("#footer").load("../Base/footer.html");
		
		
		var category = $(".category").val();
		if (category == null) {
			$("#category1").css("display", "none");
			$("#category2").css("display", "none");
			$("#category3").css("display", "none");
			$("#category4").css("display", "none");
			$("#category5").css("display", "none");
			$("#category6").css("display", "none");
			$("#category7").css("display", "block");
		} else if (category == "의류/패션") {
			$("#category1").css("display", "block");
			$("#category2").css("display", "none");
			$("#category3").css("display", "none");
			$("#category4").css("display", "none");
			$("#category5").css("display", "none");
			$("#category6").css("display", "none");
			$("#category7").css("display", "none");
		} else if (category == "디지털/가전") {
			$("#category1").css("display", "none");
			$("#category2").css("display", "block");
			$("#category3").css("display", "none");
			$("#category4").css("display", "none");
			$("#category5").css("display", "none");
			$("#category6").css("display", "none");
			$("#category7").css("display", "none");
		} else if (category == "도서/티켓/취미/애완") {
			$("#category1").css("display", "none");
			$("#category2").css("display", "none");
			$("#category3").css("display", "block");
			$("#category4").css("display", "none");
			$("#category5").css("display", "none");
			$("#category6").css("display", "none");
			$("#category7").css("display", "none");
		} else if (category == "생활/문구/가구") {
			$("#category1").css("display", "none");
			$("#category2").css("display", "none");
			$("#category3").css("display", "none");
			$("#category4").css("display", "block");
			$("#category5").css("display", "none");
			$("#category6").css("display", "none");
			$("#category7").css("display", "none");
		} else if (category == "스포츠/레져") {
			$("#category1").css("display", "none");
			$("#category2").css("display", "none");
			$("#category3").css("display", "none");
			$("#category4").css("display", "none");
			$("#category5").css("display", "block");
			$("#category6").css("display", "none");
			$("#category7").css("display", "none");
		} else if (category == "기타") {
			$("#category1").css("display", "none");
			$("#category2").css("display", "none");
			$("#category3").css("display", "none");
			$("#category4").css("display", "none");
			$("#category5").css("display", "none");
			$("#category6").css("display", "block");
			$("#category7").css("display", "none");
		}
	})
</script>
<style>
#container {
	margin: 0 auto;
	width: 1080px;
	/* border : 2px solid black; */
}
/* 중고거래 타이틀 */
#title ul li {
	list-style: none;
}

.title_wrap {
	text-align: center;
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
	width: 730px;
	text-align: center;
	margin-left: 183px;
}
/* 카테고리 메뉴 */
#category {
	height: 16px;
	margin-top: 20px;
	margin-bottom: 8px;
}

#category ul {
	height: 16px;
}

#category ul li {
	list-style: none;
	color: #000000;
	float: left;
	text-align: center;
	vertical-align: middle;
	padding-right: 35px;
}

#category ul li:last-child {
	padding: 0;
}

#category .menuLink {
	text-decoration: none;
	color: #000000;
	display: block;
	font-size: 12pt;
	font-weight: bold;
	cursor: pointer;
}

/*카테고리 하단 바*/

#bottomLine #category1 {
	display: none;
	margin-left: 0px;
	margin-bottom: 14px;
	width: 72px;
	height: 2px;
	background: black;
}

#bottomLine #category2 {
	display: none;
	margin-left: 106px;
	margin-bottom: 14px;
	width: 87px;
	height: 2px;
	background: black;
}

#bottomLine #category3 {
	display: none;
	margin-left: 228px;
	margin-bottom: 14px;
	width: 149px;
	height: 2px;
	background: black;
}

#bottomLine #category4 {
	display: none;
	margin-left: 412px;
	margin-bottom: 14px;
	width: 110px;
	height: 2px;
	background: black;
}

#bottomLine #category5 {
	display: none;
	margin-left: 557px;
	margin-bottom: 14px;
	width: 87px;
	height: 2px;
	background: black;
}

#bottomLine #category6 {
	display: none;
	margin-left: 679px;
	margin-bottom: 14px;
	width: 32px;
	height: 2px;
	background: black;
}

#bottomLine #category7 {
	display: none;
	margin-left: 0px;
	margin-bottom: 14px;
	width: 100%;
	height: 2px;
	background: #fff;
}

/* 판매버튼 + 검색창 */
#sell_btn {
	float: left;
	margin-bottom: 40px;
	margin-right: 30px;
	height: 56px;
	width: 113px;
	vertical-align: center;
}

#sell_btn button {
	color: #fff;
	background-color: #fc585e;
	outline: none;
	border: 3px solid #fc585e;
	width: 100%;
	height: 100%;
	padding: 10px;
	font-size: 18px;
	font-weight: bold;
	cursor: pointer;
}

#search {
	width: 565px;
	height: 50px;
	border: 3px solid #fc585e;
	float: left;
	margin-bottom: 40px;
}

#search input {
	border: 0;
	padding: 10px 0px 0px 10px;
	outline: none;
	width: 480px;
	height: 30px;
	float: left;
	font-size: 16pt;
	text-align: left;
	margin-right: 0px;
}

#search button {
	margin-left: 0px;
	background-color: #fc585e;
	width: 75px;
	height: 50px;
	padding: 6px 7px 10px 7px;
	float: left;
	outline: none;
	border: 0;
	cursor: pointer;
}

/* 중고물품 목록 */
#items {
	width: 730px;
	height: 950px;
}

.row li:last-child {
	margin-right: 0px;
}

.goods {
	float: left;
	width: 227px;
	height: 280px;
	border: 1px solid #eeeeee;
	margin-right: 14px;
	margin-bottom: 12px;
	list-style: none;
	margin-left: 0px;
}

.goods img {
	width: 227px;
	height: 210px;
	border-bottom: 1px solid #eeeeee;
	cursor: pointer;
}

.goods p {
	margin-top: 10px;
	margin-left: 10px;
	margin-bottom: 12px;
	font-size: 12pt;
	float: left;
	cursor: pointer;
}

.price {
	margin-left: 10px;
	margin-bottom: 15px;
	font-size: 11pt;
	clear: left;
	float: left;
}

.time {
	margin-right: 10px;
	margin-bottom: 15px;
	font-size: 10pt;
	float: right;
}

/* 페이지번호 */
#page_number {
	margin-top: 40px;
}

#page_number ul li {
	list-style: none;
	display: inline;
}

#page_number ul li a {
	padding: 4px;
	margin-right: 10px;
	/* height: 50px; */
	width: 15px;
	color: #000;
	font-size: 12pt;
	text-align: center;
	text-decoration: none;
}

#page_number ul li a:hover, #page_number ul li a:focus {
	color: #fff;
	border: 1px solid #000;
	border-radius: 50%;
	background-color: #000;
}
</style>
</head>
<meta charset="UTF-8">
<title>중고거래_목록</title>
</head>
<body>
	
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p><a href = "Board_Commerce_List.jsp">중고거래</a></p></li>
			</ul>
       	</div>
       	
       	<div id = "wrap">
       		<form action="Commerce_Search.do" method="post">
       		<div id = "category">
       			<input type = "hidden" class = "category" value = <%= (String)request.getAttribute("category") %>>
       			<ul>
       				<li><a class="menuLink" href="Board_Commerce_List_Fashion.jsp">의류/패션</a></li>
       				<li><a class="menuLink" href="Board_Commerce_List_Digital.jsp">디지털/가전</a></li>
       				<li><a class="menuLink" href="Board_Commerce_List_Book.jsp">도서/티켓/취미/애완</a></li>
       				<li><a class="menuLink" href="Board_Commerce_List_Life.jsp">생활/문구/가구</a></li>
       				<li><a class="menuLink" href="Board_Commerce_List_Sports.jsp">스포츠/레저</a></li>
       				<li><a class="menuLink" href="Board_Commerce_List_Other.jsp">기타</a></li>			
       			</ul>
       		</div>
       		</form>
       		<div id="bottomLine">
            	<span id="category1"></span>
            	<span id="category2"></span>
            	<span id="category3"></span>
            	<span id="category4"></span>
            	<span id="category5"></span>
            	<span id="category6"></span>
            	<span id="category7"></span>
        	 </div>
       		
       		<div>
       			<div id = "sell_btn">
       				<%
       					if (session.getAttribute("sessionID") == null) {
       				%>
       						<button style="cursor:pointer;" onclick="location='../view.login/Login.jsp'">판매하기</button>
       				 <%
       				 	} else {
       				 %> 
							<button style="cursor:pointer;" onclick="location='Board_Commerce_List_Sell.jsp'">판매하기</button>
					 <% } %>
       			</div>
       			<div id = "search">
       					<input type = "text" name = "searchArea" value = <%= (String)request.getAttribute("search") %>>
       					<button><img src = "../img/SearchButton.png"></button>
       			</div>
       		</div>
       		<c:if test="${not empty articlePage}">

       			<div id = "items">

					<c:forEach var="article" items="${articlePage.content}">
       					<li class = "goods">

       						<img src = "data:x-image/jpg;base64,${article.repImage}" >
        					
       						<p><c:out value="${article.subject}"></c:out></p>
       						<span class = "price"><%-- <% price %>원 --%>${article.price}</span>
       						<span class = "time"><%-- <% time %> 분전 --%>${article.regDate}</span>
       					</li>
       				</c:forEach>
       			</div>
       		
       		</c:if>
       		<div id = "page_number">
       		<!-- 게시판 이동 항목 -->
			<c:if test="${articlePage.hasArticles()}">
				<ul>
					<li>
					<!-- 현재페이지가 5 이상일 시 이전 링크-->
					<c:if test="${articlePage.startPage > 5}">
						<a href="Commerce_Reset.do?pageNo=${articlePage.startPage - 5}">[이전]</a>
					</c:if> 
					<!-- startPage to endPage --> 
					<c:forEach var="pNo" begin="${articlePage.startPage}" end="${articlePage.endPage}">
						<a href="Commerce_Reset.do?pageNo=${pNo}">${pNo}</a>
					</c:forEach> 
					<!-- endPage가 총페이지보다 작을 시에 다음 링크 -->
					<c:if test="${articlePage.endPage < articlePage.totalPages}">
						<a href="Commerce_Reset.do?pageNo=${articlePage.startPage + 5 }">[다음]</a>
					</c:if>
					</li>
				</ul>
			</c:if>
       		</div>
		</div>
		<div id = "footer">
		</div>
	</div>
</body>
</html>