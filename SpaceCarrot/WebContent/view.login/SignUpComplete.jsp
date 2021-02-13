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
<title>ȸ������ �Ϸ�</title>
</head>
<body>
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
       			<%-- <%= id %> --%>���̵� �� ȸ�������� ���ϵ帳�ϴ�
       		</div>
       		<div id = "btn">
        		<ul>
					<li class = "home_btn_wrap">
						<a href = "#">Ȩ����</a>
					</li>
					<li class = "login_btn_wrap">
						<a href = "#">�α��� �Ϸ� ����</a>
					</li>
				</ul>
       		</div>
      	 </div>
      	 
       	<div id = "footer">
       	
       	</div>
	</div>
</body>
</html>