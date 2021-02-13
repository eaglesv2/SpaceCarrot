<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>        
	$(document).ready(function(){    
		$("#header").load("../BaseFrame/header.html");
		$("#footer").load("../BaseFrame/footer.html");
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
            margin-left : 203px;
          } 			  
	#msg { margin-top: 50px; 
		   font-weight: bold;
		   font-size: 15pt; }
	#btn { margin-left: 140px; }
	#btn ul li { list-style: none; }
	.home_btn_wrap { text-align: center; 
			   	     margin: 20px 30px 30px;
			   		 float: left;
			  	   }
	.home_btn_wrap a { color: #fff; 
				  	   background-color: #fc585e;
				  	   border: 3px solid #fc585e; 
				 	   font-weight: bold; 
				  	   padding: 10px;  
				 	   height: 20px; 
				 	   line-height: 20px; 
				 	   width: 70px; 
				  	   display: block; 
				 	   text-align: center; 
				 	   margin: 0 auto;
					 }
	.home_btn_wrap a.wide { width:587px;
					   		margin: 0 0 0 20px;
				 		  }
					 
	.login_btn_wrap { text-align: center; 
			   		  margin: 20px 0 30px;
			   		  float: left;
			   		  
			  		 }
	.login_btn_wrap a { color: #fc585e; 
				  		 background-color: #fff; 
				  		 border: 3px solid #fc585e; 
				 		 font-weight: bold; 
				  	  	 padding: 10px;  
				 	     height: 20px; 
				  		 line-height: 20px; 
				 		 width: 140px; 
				  		 display: block; 
				 		 text-align: center; 
				 		 margin: 0 auto;
				 	}
 	.login_btn_wrap a.wide { width:587px;
					  	 	  margin: 0 0 0 20px;
					 		}	
</style>
<title>회원가입 완료</title>
</head>
<body>
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
       			<%-- <%= id %> --%>아이디 님 회원가입을 축하드립니다
       		</div>
       		<div id = "btn">
        		<ul>
					<li class = "home_btn_wrap">
						<a href = "#">홈으로</a>
					</li>
					<li class = "login_btn_wrap">
						<a href = "#">로그인 하러 가기</a>
					</li>
				</ul>
       		</div>
      	 </div>
      	 
       	<div id = "footer">
       	
       	</div>
	</div>
</body>
</html>