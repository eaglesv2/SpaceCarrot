<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../Base/reset.css" />
<script>        
	$(document).ready(function(){    
		$("#header").load("../Base/header.html");
		$("#footer").load("../Base/footer.html");
	})
</script>
<style>
	#container { margin: 0 auto;
                 width: 1080px;
               }
               
	  /* 회원가입 완료 타이틀 */

    #title ul li { list-style: none; }
    .title_wrap { text-align: center; }
	.title_wrap p { color: #fff; 
				  	background-color: #fc585e; 
				  	padding : 25px 0px;
				  	font-size : 16pt;
				  	font-weight: bold; 
				  	display: block; 
				 	margin: 0 auto;
				  }
	#wrap { margin : 0 auto;
            width : 715px;
            height : 500px;
            text-align : center;
            margin-left : 200px;
          } 			  
	#msg { margin-top: 50px; 
		   font-weight: bold;
		   font-size: 15pt; }
	#btn { margin-left: 185px; }
	#btn ul li { list-style: none; }
	.home_btn_wrap { text-align: center; 
			   	     margin: 20px 30px 30px;
			   		 float: left;
			  	   }
	.home_btn_wrap button { color: #fff; 
				  	  		background-color: #fc585e;
				  	   		border: 3px solid #fc585e;
				  	   		font-size: 12pt;
				 	   		font-weight: bold; 
				  	   		padding: 10px;  
				 	   		height: 50px; 
				 	   		vertical-align: middle;
				 	   		width: 100px; 
				  	   		display: block; 
				 	   		text-align: center; 
				 	   		margin: 0 auto;
					 	  }
					 
	.login_btn_wrap { text-align: center; 
			   		  margin: 20px 0 30px;
			   		  float: left;
			   		  
			  		 }
	.login_btn_wrap button { color: #fc585e; 
				  		 	 background-color: #fff; 
				  		 	 border: 3px solid #fc585e; 
				  		 	 font-size: 12pt;
				 		 	 font-weight: bold; 
				  	  	 	 padding: 10px;  
				 	     	 height: 50px; 
				  		 	 vertical-align: middle;
				 		 	 width: 150px; 
				  		 	 display: block; 
				 		 	 text-align: center; 
				 		 	 margin: 0 auto;
				 		   }	

</style>
<title>회원가입 완료</title>
</head>
<body>
	    <%
        //넘어오는 값 한글 인코딩 처리하기
        request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
       
        //nickname에 해당하는 value가져오기
        String nickname = request.getParameter("nickname");   
   		%>
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>회원가입 완료</p></li>
			</ul>
       	</div>
       	
       	<div id = "wrap">
       		<div id = "msg">
       			<%= nickname %> 님 회원가입을 축하드립니다
       		</div>
       		<div id = "btn">
        		<ul>
					<li class = "home_btn_wrap">
						<button onclick = "main.html">홈으로</button>
					</li>
					<li class = "login_btn_wrap">
						<button onclick = "Login.jsp">로그인 하러 가기</button>
					</li>
				</ul>
       		</div>
      	 </div>
      	 
       	<div id = "footer">
       	
       	</div>
	</div>
</body>
</html>