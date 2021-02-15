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
               
	  /* ȸ������ �Ϸ� Ÿ��Ʋ */

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
<title>ȸ������ �Ϸ�</title>
</head>
<body>
	    <%
        //�Ѿ���� �� �ѱ� ���ڵ� ó���ϱ�
        request.setCharacterEncoding("UTF-8");
    	response.setCharacterEncoding("UTF-8");
       
        //nickname�� �ش��ϴ� value��������
        String nickname = request.getParameter("nickname");   
   		%>
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>ȸ������ �Ϸ�</p></li>
			</ul>
       	</div>
       	
       	<div id = "wrap">
       		<div id = "msg">
       			<%= nickname %> �� ȸ�������� ���ϵ帳�ϴ�
       		</div>
       		<div id = "btn">
        		<ul>
					<li class = "home_btn_wrap">
						<button onclick = "main.html">Ȩ����</button>
					</li>
					<li class = "login_btn_wrap">
						<button onclick = "Login.jsp">�α��� �Ϸ� ����</button>
					</li>
				</ul>
       		</div>
      	 </div>
      	 
       	<div id = "footer">
       	
       	</div>
	</div>
</body>
</html>