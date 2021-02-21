<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="reset.css" />
<style>
	#skipNavi { position : absolute;
				left : 0;
				top : 0;
				z-index : 5;
				width : 100%;
				z-index : 1000;
			   }

	#skipNavi a { display : block;
				  width : 1px;
				  height : 1px;
				  margin-bottom : -1px;
				  font-size : 0;
				  overflow : hidden; 
				 }

	#skipNavi a:active, #skipNavi a:focus { color : #000;
											width : 100%;
											height : auto;
											padding : 5px 0;
											background : #eee;
											font-size : 12px;
											text-align : center;
										   }
	#header { width : 1080px; 
			  height : 110px;
			}

	#header ul li { display : inline; /* 가로나열 */
					vertical-align : middle; /* 수직높이 가운데 정렬 */
			      }
	.menu { font-size : 15pt; 
		    font-weight : bold;
		    color : #000000; 
		    float : left;
		  }
	.menu img { padding: 17px 0px 7px 17px; }
	.menu ul li { padding-right : 40px; }  /* 메뉴 간격 50px */
	.menu ul li:first-child { padding-right: 55px; }
	.menu ul li:last-child { padding : 0px; }
	.login { vertical-align : top;  /* 회원가입 로그인 마이페이지 */
		     font-size : 10pt;
		     font-weight : normal;
		     padding-top : 10px;
		     padding-right : 7px;
		     float : right;
		   }
	.login ul li:last-child { padding: 0px; }
	a { text-decoration : none; /* a태그 밑줄 + 색 바뀌는거 초기화 */
		color : #000000; 
	  }
</style>
<title>Header</title>
</head>
<body>
	<div id = "skipNavi">
		<a href = "#">메뉴 바로가기</a>
	</div>
	<div id = "header">
		<div class = "menu">
			<ul>
				<li><a href="../MainPage/Main.jsp"><img src = "../img/MainLogo.png" alt = "우주당근"></a></li>
				<li><a href = "../view.community/Community_List_Default.jsp">커뮤니티</a></li>
				<li><a href = "../view.see/SeePlace_List.html">볼거리</a></li>
				<li><a href = "../view.eat/EatPlace_List.html">먹거리</a></li>
				<li><a href = "../view.board/Board_Commerce_List.jsp">중고거래</a></li>
			</ul>
		</div>
		<div class = "login">
			<ul>
				<li><a href = "../view.login/SignUp.jsp">회원가입</a></li>
				<li>·</li>
				<li><% if(session.getAttribute("sessionID") == null) { %><a href = "../view.login/Login.jsp">로그인 </a><% } else { %> 
																		 <a href = "../view.login/LogOut.jsp">로그아웃 </a> <% } %></li>
				<li>·</li>
				<li><% if(session.getAttribute("sessionID") == null) { %><a href = "../view.login/Login.jsp">마이페이지</a> <% } else {%> 
																		 <a href = "../view.mypage/Mypage_PW_Re.jsp">마이페이지</a>  <% } %></li>	
			</ul>
		</div>
	</div>
</body>
</html>