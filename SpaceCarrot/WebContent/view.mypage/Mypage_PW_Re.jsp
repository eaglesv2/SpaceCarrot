<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../Base/reset.css" />
<script>        
	$(document).ready(function(){    
		$("#header").load("../Base/header.html");
		$("#footer").load("../Base/footer.html");
	})
</script>
<style>
	#container { margin : 0 auto;
                 width : 1080px;
               }
               
    /* 마이페이지 title */           
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

	/* 비밀번호 입력 */
    #pw_form { margin : 0 auto;
              	 width : 715px;
              	 text-align : center;
              	 margin-top : 150px;
             	 margin-left : 200px;
             	 margin-bottom:700px;
    		   }
    		   
    #pw_form ul li:first-child { margin-bottom: 30px;
    
    }
    
	#pw_form input { border: 1px solid #ececec;
					 font-size: 12pt;
					 color: #4c4c4c; 
					 height: 40px; 
					 padding: 10px; 
					 width: 250px;
					 margin-right: 20px; 
				   }
   	
   	.btn { color: #fff; 
		   background-color: #fc585e;
		   border: 3px solid #fc585e; 
		   font-size: 12pt;
		   font-weight: bold; 
		   padding: 10px;  
		   height: 56px; 
		   vertical-align: middle;
		   width: 100px; 
		   display: inline-block; 
		   text-align: center; 
		   margin: 0 auto; }
    
</style>
<title>마이페이지</title>
</head>
<body>
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>마이페이지</p></li>
			</ul>
       	</div>
       	
       	<form action = "UserInfoInsert.do" method = "post">
       	<div id = "pw_form">
       		<ul>
				<li>본인확인을 위해 비밀번호를 한 번 더 입력해주세요.</li>
				<li>
					<span><input type="password" placeholder="비밀번호를 입력해주세요." id = "user_pw" name = "pw"></span>
					<span><button class="btn" style="cursor:pointer;" type = "submit" onclick = "location.href='#'">확인</button></span>
				</li>
			</ul>
       	</div>
       	</form>
       	<div id = "footer">
       	
       	</div>
	</div>
</body>
</html>