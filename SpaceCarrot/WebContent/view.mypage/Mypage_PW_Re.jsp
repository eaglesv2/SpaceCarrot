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
		$("#header").load("../Base/Header.jsp");
		$("#footer").load("../Base/footer.html");
	})
	
	function pwCheck(){
			var id = $("#user_id").val();
			var pw = $("#user_pw").val();
			
			$.ajax({
				type: 'POST',
				url: 'MyPagePWCheck.do',
				data: { id : id, pw : pw },
				success: function(result) {
					if(result == 0) {
						$("#pw_check").text("비밀번호가 일치하지 않습니다.");
						$("#pw_check").css("color","red");
					} else if(result == 1) {
						document.location.href = "Mypage_Modify_Menu.jsp";
					}
				}
			})
		}
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
               margin-top : 50px;
               margin-left : 200px;
               height: 500px;
    		 }
/*     		   
    #pw_form ul li:first-child { margin-bottom: 30px;
    							 font-weight: bold;
    						   } */
    
/* 	#pw_form input { border: 1px solid #ececec;
					 font-size: 12pt;
					 color: #4c4c4c; 
					 height: 40px; 
					 padding: 10px; 
					 width: 250px;
					 margin-right: 20px; 
				   } */
   	
   	.btn { color: #fff; 
		   background-color: #fc585e;
		   border: 3px solid #fc585e; 
		   font-size: 12pt;
		   font-weight: bold; 
		   padding: 10px;
		   height: 58px; 
		   vertical-align: middle;
		   width: 100px; 
		   display: inline-block; 
		   text-align: center; 
		   margin: 0 auto; 
		   margin-bottom: 3px;
		   cursor: pointer;
		  }

    #pw_form table { border-spacing: 0;
    				 margin-bottom: 10px;
    				 margin-left: 100px; 
    				 padding: 0; 
    				 border: 0;
    				 width: 500px;
    				 text-align: center;
    			   }
    #pw_form table .msg { font-weight: bold;
    					  font-size: 15pt;
    	 				}
    #pw_form table td { width: 300px; }
	#pw_form table input { border: 1px solid #ececec;
					 	   font-size: 12pt;
					 	   color: #4c4c4c; 
						   height: 40px; 
						   padding: 10px; 
					 	   width: 250px;
					 	   margin-top: 30px;
					 	   margin-right: 20px; 
						  }
	#pw_form table .check { padding : 0px; padding-top: 10px; height: 0px; font-size: 11pt; color: red; }
	
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
       	
       	<div id = "pw_form">
       		<table>
              	<tbody>
					<tr>
						<td class = "msg">본인확인을 위해 비밀번호를 한 번 더 입력해주세요.</td>
                	</tr>
                	<tr>
                  		<td>
                  			<span><input type="password" placeholder="비밀번호를 입력해주세요." id = "user_pw" name = "pw"></span>
                  			<input type = "hidden" id = "user_id" name = "id" value = <%= (String)session.getAttribute("sessionID") %>>
                  			<span><button class="btn" type = "button" onclick = "pwCheck()">확인</button></span>
                  		</td>
                	</tr>
                	 <tr>
                		<td class = "check">
                			<div id = "pw_check"></div>
                		</td>
                	</tr>
                </tbody>
			</table>
       		<%-- <ul>
				<li>본인확인을 위해 비밀번호를 한 번 더 입력해주세요.</li>
				<li>
					<span><input type="password" placeholder="비밀번호를 입력해주세요." id = "user_pw" name = "pw"></span>
					<input type = "hidden" id = "user_id" name = "id" value = <%= (String)session.getAttribute("sessionID") %>>
					<span><button class="btn" type = "button" onclick = "pwCheck()">확인</button></span>
				</li>
			</ul> --%>
       	</div>
       	<div id = "#pw_check"></div>
   
       	<div id = "footer">
       	
       	</div>
	</div>
</body>
</html>