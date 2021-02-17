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

	/* 수정할 메뉴 */
    #modify_menu { margin : 0 auto;
              	 width : 715px;
              	 text-align : center;
              	 margin-top : 150px;
             	 margin-left : 180px;
             	 margin-bottom: 350px;
    		   }
    		   
    #modify_menu ul li { margin-bottom: 100px;
    
    }
   	
    #modify_menu ul li:first-child { font-size: 14pt; 
    								 font-weight:bold;    
    }
    
   	button { color: #fff; 
		   background-color: #fc585e;
		   border: 3px solid #fc585e; 
		   font-size: 12pt;
		   font-weight: bold; 
		   padding: 10px;  
		   height: 56px; 
		   vertical-align: middle;
		   width: 250px; 
		   display: inline-block; 
		   text-align: center; 
		   margin: 0 auto;
		   cursor: pointer; }
    
</style>
<title>마이페이지_수정메뉴</title>
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
       	
       	<div id = "modify_menu">
       		<ul>
				<li>수정할 메뉴를 선택해주세요.</li>
				<li>
					<button class="btn_my_info" onclick = "location='Mypage_Modify_My_Info.jsp'">내 정보 수정</button>
				</li>
				<li>
					<button class="btn_community" onclick = "location='Mypage_List_Community.jsp'">내가 올린 커뮤니티 글 수정</button>
				</li>
				<li>
					<button class="btn_board_commerce" onclick = "location='Mypage_List_Board_Commerce.jsp'">내가 올린 중고거래 글 수정</button>
				</li>
			</ul>
       	</div>
       	
       	<div id = "footer">
       	
       	</div>
	</div>
</body>
</html>