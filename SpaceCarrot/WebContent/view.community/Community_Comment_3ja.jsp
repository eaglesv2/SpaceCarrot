<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="u" tagdir="/WEB-INF/tags" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../Base/reset.css" />
<script>        
	$(document).ready(function(){    
		$("#header").load("../Base/header.jsp");
		$("#footer").load("../Base/footer.html");
	})
</script>
<style>
#container {
	margin: 0 auto;
	width: 1080px;
	/* border: 2px solid black; */
}
/* 중고거래 타이틀 */
#title ul li {
	list-style: none;
}

.title_wrap {
	text-align: center;
}

.title_wrap p {
	color: #fff;
	background-color: #fc585e;
	padding: 25px 0px;
	font-size: 16pt;
	font-weight: bold;
	display: block;
	margin: 0 auto;
	margin-bottom:35px;
}

/* 게시글 */
#board_wrap { width: 710px; height: 350px; 
       		  margin: 0 auto;
			  right:500px;
			  margin-bottom:150px;
}

a { text-decoration: none;
    color: #404040;
}

li {
    list-style: none;
}

#board_wrap ul li {
    padding-left: 20px;
}

#board_wrap ul li:first-child {
	border-top: 3px solid #6a6a6a;
    border-bottom: 1px solid #000;
    font-weight: bold;
    font-size: 14pt;
    line-height: 50px; /*li 세로 간격*/
}
		
#board_wrap ul li:nth-child(2) {
	border-bottom: 1px solid #000;
	line-height: 50px; /*li 세로 간격*/
	margin-bottom:20px;
}

#board_wrap ul li span:first-child {
	display: inline-block;
    float: left;
    padding-right:20px;
    font-weight:bold;
}

#board_wrap ul li span:nth-child(2) {
	display: inline-block;
    padding-right:200px;
}

#board_wrap ul li span:nth-child(3) {
	display: inline-block;
    padding-right:20px;
    font-weight:bold;
}

#board_wrap ul li span:nth-child(4) {
	display: inline-block;
    padding-right:140px;
}

#board_wrap ul li span:nth-child(5) {
	display: inline-block;
    padding-right:20px;
    font-weight:bold;
}

#board_wrap ul li span:last-child {
    display: inline-block;
    float: right;
    padding-right:10px;
}

#board_wrap ul li:last-child {
	line-height: 30px;
	font-size:12pt;
}

/* 댓글 */
#gprice {
	margin-left: 203px;
	margin-top: 20px;
	margin-bottom: 20px;
	font-size: 18px;
	font-weight: 700;
	color: #000000;
}

.my-hr1 {
	margin-top: 20px;
	margin-bottom: 20px;
	width: 715px;
}

.my-hr2 {
	/* margin-bottom: 20px; */
	width: 715px;
	height: 1px;
	background: #000000;
}

#nick {
	margin-left: 223px;
	margin-top: 20px;
	margin-bottom: 10px;
	font-size: 16px;
	font-weight: 700;
	color: #000000;
}

#content-daet1 {
margin-top:20px;
margin-bottom:10px;

}

#content-daet2 {
margin-top:20px;
margin-bottom:10px;
margin-left:20px;
}

#content-daet3 {
margin-top:20px;
margin-bottom:20px;

}

#daet {
	margin-left: 243px;
	margin-bottom: 10px;
	font-size: 16px;
	color: #434343;
}

#daet2 {
	margin-left: 243px;
	margin-bottom: 10px;
	font-size: 16px;
	color: #434343;
}



#dap {
	margin-left: 220px;
	margin-top: 42px;
	margin-bottom: 10px;
	font-size: 16px;
	color: #434343;
	margin-right: 5px;
	font-weight: 700;
	float: left;
}


#text {
	margin-left: 20px;
	margin-top: 20px;
	margin-bottom: 5px;
	width: 415px;
	height: 60px;
	border: 1;
}


#checkbox1 {
font-size : 14px;
}

#dapwrap {
margin-top: 7px;
}

#dapbutton {
	float: right;
	width: 100px;
	margin-right: 200px;
	margin-top: 23px;
	
}

#button2 {
	margin-left: 223px;
	margin-top: 12px;
	margin-bottom: 20px;
}

.button {
	width: 80px;
	height: 35px;
	background-color: #f8585b;
	border: none;
	color: #fff;
	padding: 6px 0;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 16px;
	margin: 4px;
	cursor: pointer;
	
}

</style>
</head>
<meta charset="UTF-8">
<title>커뮤니티_댓글_제3자</title>
</head>
<body>

	<div id="container">
		<div id="header"></div>

		<div id="title">
			<ul>
				<li class="title_wrap"><a href="Community_List.jsp"><p>게시글</p></a></li>
			</ul>
		</div>

		<div id="board_wrap">
			    <ul>
        			<li><c:out value="${article_VO.subject}"/></li> 
        			<li><span>작성자</span><span><a href="Community_Writer_Writting.jsp">${article_VO.userNickName}</a></span><span>작성일</span><span>${articleData.regDate }</span><span>조회수</span><span>${articleData.views}</span></li>
			        <li><u:pre value="${article_VO.content}" /></li>			   
    			</ul>
			</div>

		<hr class="my-hr2">
		
		<div id="gprice">댓글(3)</div>


		<hr class="my-hr1">

<div id = "content-daet1">
		<div id="nick">닉네임</div>
		<div id="daet">혹시 △△아파트 근처이신가요?</div>
</div>		
		
<div id = "content-daet2">		
		<div id="nick">└ 닉네임</div>
		<div id="daet2">아니요ㅜㅜ</div>
</div>



		<hr class="my-hr1">
		
		
		

<div id = "content-daet3">
		<div id="nick">비밀댓글입니다</div>
		<div id="daet">└비밀댓글입니다</div>
</div>		



		<hr class="my-hr2">
		
		

		<div id="dapwrap">
			<span id="dap"> 댓글 남기기 </span>
			<textarea id="text" rows=30></textarea>
			<div id="dapbutton">
				<label id="checkbox1"><input type="checkbox" name="secret"
					value="secret1"> 비밀 답글 </label> <input class="button" type="button"
					value="등록">
			</div>
		</div>

		<div id="footer"></div>
	</div>
</body>
</html>