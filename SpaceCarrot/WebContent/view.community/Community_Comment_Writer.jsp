<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../Base/reset.css" />
<script>        
	$(document).ready(function(){    
		$("#header").load("../Base/header.html");
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
	width: 675px;
	margin-left: 203px;
	margin-right: 203px;
	font-size: 18px;
	font-weight:700;
	margin-top: 20px;
	margin-bottom: 20px;
}
#title3 #user {
width: 675px;
	margin-left: 203px;
	font-size: 16px;
	font-weight:700;
	margin-top: 20px;
	margin-bottom: 20px;
}
#title3 #user_id {
width: 675px;
	margin-left: 20px;
	font-size: 16px;
	margin-top: 20px;
	margin-bottom: 20px;
}
#title3 #user_date1 {
width: 675px;
	margin-left: 240px;
	font-size: 16px;
	font-weight:700;
	margin-top: 20px;
	margin-bottom: 20px;
}
#title3 #user_date2 {
width: 675px;
	margin-left: 20px;
	font-size: 16px;
	margin-top: 20px;
	margin-bottom: 20px;
}
#title3 #user_count1 {
width: 675px;
	margin-left: 80px;
	font-size: 16px;
	font-weight:700;
	margin-top: 20px;
	margin-bottom: 20px;
}
#title3 #user_count2 {
width: 675px;
	margin-left: 10px;
	font-size: 16px;
	margin-top: 20px;
	margin-bottom: 20px;
}
#contents {
width: 675px;
	margin-left: 203px;
	font-size: 16px;
	margin-top: 20px;
	margin-bottom: 360px;
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
	margin-top: 20px;
	margin-bottom: 20px;
}
#gprice {
	margin-left: 203px;
	margin-top: 20px;
	margin-bottom: 20px;
	font-size: 18px;
	font-weight: 700;
	color: #000000;
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
	margin-left: 223px;
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
</style>
</head>
<meta charset="EUC-KR">
<title>커뮤니티_댓글_글쓴이</title>
</head>
<body>

	<div id="container">
		<div id="header"></div>

		<div id="title">
			<ul>
				<li class="title_wrap"><p>게시글</p></li>
			</ul>
		</div>

		<hr class="my-hr2">
		
		<div id="title2">
			오랜만에 xx공원 한바퀴 돌고 주변 둘러보고 왔네요
		</div>

		<hr class="my-hr1">

			<div id="title3">
				<span id="user">작성자</span> 
				<span id="user_id">김단성사</span>
				<span id="user_date1">작성일</span>
				<span id="user_date2">21.02.15</span>
				<span id="user_count1">조회수</span>
				<span id="user_count2">2</span>
			</div>

		<hr class="my-hr1">

		<div id = "contents">
		바람도 선선하고 사람도 적어 산책하기 좋은 날이네요 공원 근처 카페도 분위기 넘넘 좋았어요~ 마스
		크 쓰고 만나실 이웃님 게신가요~
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
			<span id="nick">닉네임</span><img id="img1" src="../img/ja.png"
				alt="자물쇠"> 
			<div id="daet">9000원에 거래는 어려운가요?</div>
		</div>

		<div id="content-daet2">
			<span id="nick">└ 닉네임</span><img id="img1" src="../img/ja.png"
				alt="자물쇠">
			<div id="daet2">그건 조금 어려울것 같네요</div>
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