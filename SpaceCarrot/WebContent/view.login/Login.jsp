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
	#container { margin : 0 auto;
                 width : 1080px;
               }
               
	  /* �α��� Ÿ��Ʋ */

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
	
	/* �α��� �Է� �κ� */ 
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
   	#btn { margin-left: 60px; }
	#btn ul li { list-style: none; }
	.login_btn_wrap { text-align: center; 
			   		  margin: 20px 30px 30px;
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
					 	   }
	.signup_btn_wrap { text-align: center; 
			   		   margin: 20px 0 30px;
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
				 	   		}

</style>
<title>�α���</title>
</head>
<body>
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>�α���</p></li>
			</ul>
       	</div>
        
        <div id = "login_form">
        	<table>
              	<tbody>
					<tr>
						<th><span>���̵�</span></th>
						<td><input type="text" placeholder="���̵�"></td>
                	</tr>
                	<tr>
                  		<th><span>��й�ȣ</span></th>
                  		<td><input type="password" placeholder="��й�ȣ"></td>
                	</tr>
                </tbody>
			</table>
			<div id = "btn">
				<ul>
					<li class = "login_btn_wrap">
						<button type = "submit" onclick = "main.html">�α���</button>
					</li>
					<li class = "signup_btn_wrap">
						<button onclick = "SignUp.jsp">ȸ������</button>
					</li>
				</ul>
			</div>
        </div>
        
        <div id = "footer">
        
        </div>
	</div>
</body>
</html>