<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../Base/reset.css" />
<script>        
	$(document).ready(function(){    
		$("#header").load("../Base/Header.jsp");
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
}

#title2 {
	text-align: center;
	margin-top: 35px;
	margin-bottom: 35px;
	font-size: 18px;
	font-weight: 700;
	text-decoration: underline;
}

.goods img {
	width: 715px;
	height: 400px;
	text-align: center;
	margin-left: 185px;
	margin-right: 185px;
	margin-bottom: 20px;
}

#img1 {
	text-align: center;
}

li {
	list-style: none;
}


#gt {
	margin-left: 878px;
}

#gprice {
	margin-left: 203px;
	margin-top: 20px;
	margin-bottom: 20px;
	font-size: 18px;
	font-weight: 700;
	color: #000000;
}

#con1 {
margin-top:20px;
margin-bottom:15px;
margin-left:203px;
}


#con2 {
margin-bottom:15px;
margin-left:203px;
}

#con3 {
margin-bottom:15px;
margin-left:203px;
}
  
#con-title #con-title1 {
font-size:18px; 
font-weight:700;
color: #000000;   
}

#con-title #con-title2 {
  
    margin-left: 485px;
    font-size: 16px;
	color: #434343;
}   

#con-title #con-title3 {
font-size: 16px;
	color: #434343;

}

#con-title #con-title4 {
font-size: 16px;
	color: #434343;
	margin-right:15px;
}

#con-title #con-title5 {
font-size:18px; 
font-weight:700;
color: #000000;  
}

#naeyong {
	width: 675px;
	margin-left: 203px;
	margin-right: 203px;
	font-size: 16px;
	color: #434343;
	margin-top: 30px;
	margin-bottom: 200px;
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
	margin-top:10px;
	font-size: 16px;
	color: #434343;
}

#daet2 {
	margin-left: 243px;
	margin-bottom: 10px;
	margin-top:10px;
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
	margin-left: 263px;
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

#a1{
margin-top:20px;
margin-bottom:10px;
margin-left:480px;
font-weight:700;

}
</style>
</head>
<meta charset="EUC-KR">
<title>중고거래_구매하기_글쓴이</title>
</head>
<body>
<c:if test="${empty commerce_article_VO}">
	<%
	RequestDispatcher rd10 = request.getRequestDispatcher("Read_Commerce.do");
	rd10.forward(request, response); %>
</c:if>
	<div id="container">
		<div id="header"></div>

		<div id="title">
			<ul>
				<li class="title_wrap"><p>중고거래</p></li>
			</ul>
		</div>

		<div id="title2">구매하기</div>


		<div id="img1">
			<ul>
				<li class="goods"><img src = "data:x-image/jpg;base64,${article_VO1.repImage}"></li>
			</ul>
		</div>


		<div id="con-title">

			<div id="con1">
				<span id="con-title1"><c:out value="${commerce_article_VO.subject}" /></span> <span id="con-title2">${commerce_article_VO.userNickName}</span>
			</div>

			<div id="con2">
				<span id="con-title3">${commerce_article_VO.category}</span> <span id="con-title2">${commerce_article_VO.regDate}</span>
			</div>

			<div id="con3">
				<span id="con-title4">${commerce_article_VO.amount}개</span> <span id="con-title5">${commerce_article_VO.price}원</span>
			</div>

		</div>



		<hr class="my-hr1">

		<div id="naeyong">
			${commerce_article_VO.content}
		</div>


		<hr class="my-hr2">

		<div id="gprice">댓글(3)</div>

		<hr class="my-hr1">

		<div id="nick">
			닉네임<br>
		</div>

		<div id="daet">혹시 oo아파트 근처는 안되나요?</div>

		<div id="dapwrap">
			<span id="dap"> └ 답글 남기기 </span>
			<textarea id="text" rows=30></textarea>
			<div id="dapbutton">
				<label id="checkbox1"><input type="checkbox" name="secret"
					value="secret1"> 비밀 답글 </label> <input class="button" type="button"
					value="등록">
			</div>
		</div>

		<hr class="my-hr1">


		<div id="content-daet1">
			<span id="nick">닉네임</span><img id="img1" src="../img/ja1.png"
				alt="자물쇠">
			<div id="daet">9000원에 거래는 어려운가요?</div>
		</div>

		<div id="content-daet2">
			<span id="nick">└ 닉네임</span><img id="img1" src="../img/ja1.png"
				alt="자물쇠">
				<span id = a1><a href="">수정</a>&nbsp<a href="">삭제</a></span>
			<div id="daet2">그건 조금 어려울것 같네요ㅠ</div>
		</div>
		<button id="button2" type="button">답글</button>

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