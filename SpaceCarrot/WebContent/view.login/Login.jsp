<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../Base/reset.css" />
<script type="text/javascript">        
	$(document).ready(function(){    
		$("#header").load("../Base/Header.jsp");
		$("#footer").load("../Base/footer.html");
	})
	
	function loginCheck() {
			var id =  $("input[name=id]").val();
			var pw =  $("input[name=pw]").val();
			$.ajax({
				type: 'POST',
				url: 'UserLogin.do',
				data: { id : id, pw : pw },
				success: function(result) {
					if(result == 0) {
						$("#login_check").text("비밀번호가 일치하지 않습니다.");
						$("#login_check").css("color","red");
						/* document.location.href = "Login.jsp"; */
					} else if(result == -1) {
						$("#login_check").text("존재하지 않는 아이디입니다.");
						$("#login_check").css("color","red");
						/* document.location.href = "Login.jsp"; */
					} else {
						document.location.href = "../MainPage/Main.jsp";
					}
				}
			})
		}
</script>
<style>
	#container { margin : 0 auto;
                 width : 1080px;
               }
               
	  /* 로그인 타이틀 */

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
	
	/* 로그인 입력 부분 */ 
    #login_form { margin : 0 auto;
              	  width : 715px;
              	  height : 500px;
              	  text-align : center;
              	  margin-top : 40px;
             	  margin-left : 350px;
    		    }
    #login_form table { border-spacing: 0;
    				    margin-bottom: 10px;
    				    padding: 0; 
    				    border: 0;
    				  }
	#login_form table input { border: 1px solid #ececec;
							  font-size: 13pt;
							  color: #4c4c4c; 
							  height: 30px; 
							  padding: 10px; 
							  width: 250px; 
						    }
    #login_form table th { text-align : center; }
   	#login_form table th span { color: #404040;
   							    font-size: 15px; 
   							    display: inline-block; 
   							    padding: 0 20px 0 0; 
   							   }
   	#login_form table .check { padding : 0px; padding-top: 10px; height: 0px; font-size: 11pt; color: red;}
   	#btn { margin-left: 60px; }
	#btn ul li { list-style: none; }
	.login_btn_wrap { text-align: center; 
			   		  margin: 5px 30px 30px;
			   		  float: left; 
			   		} 
	.login_btn_wrap button { color: #fff; 
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
				 	   		 cursor: pointer;
					 	   }
	.signup_btn_wrap { text-align: center; 
			   		   margin: 5px 0 30px;
			   		   float: left;
			  		 }
	.signup_btn_wrap button { color: #fc585e;
							  background-color: #fff; 
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
				 	   		  cursor: pointer;
				 	   		}

</style>
<title>로그인</title>
</head>
<body>
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>로그인</p></li>
			</ul>
       	</div>
        
       <!--  <form action = "UserLogin.do" method = "post"> -->
        <div id = "login_form">
        	<table>
              	<tbody>
					<tr>
						<th><span>아이디</span></th>
						<td><input type="text" placeholder="아이디" name="id"></td>
                	</tr>
                	<tr>
                  		<th><span>비밀번호</span></th>
                  		<td><input type="password" placeholder="비밀번호" name="pw"></td>
                	</tr>
                	 <tr>
                		<td class = "check" colspan = 2>
                			<div id = "login_check"></div>
                		</td>
                	</tr>
                </tbody>
			</table>
			<div id = "btn">
				<ul>
					<li class = "login_btn_wrap">
						<button type = "button" onclick = "loginCheck()">로그인</button>
					</li>
					<li class = "signup_btn_wrap">
						<button onclick = "location.href='SignUp.jsp'">회원가입</button>
					</li>
				</ul>
			</div>
        </div>
        <!-- </form> -->
        
        <div id = "footer">
        
        </div>
	</div>
</body>
</html>