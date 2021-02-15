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
               
	  /* ȸ������ Ÿ��Ʋ */

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

	
    #join_form { margin : 0 auto;
              	 width : 715px;
              	 text-align : center;
              	 margin-top : 40px;
             	 margin-left : 350px;
    		   }
    #join_form table { border-spacing: 0;
    				   margin: 0;
    				   padding: 0; 
    				   border: 0;
    				 }
	#join_form table input { border: 1px solid #ececec;
							 font-size: 12pt;
							 color: #4c4c4c; 
							 height: 30px; 
							 padding: 10px; 
							 width: 300px; 
						   }
	#join_form table input[type="radio"] { width: 15px; height: 15px; }	 
	#join_form table input[type="radio"]:checked { background: #f95427; }  
    #join_form table th { text-align : center; }
   	#join_form table th span { color: #404040;
   							   font-size: 15px; 
   							   display: inline-block; 
   							   padding: 0 20px 0 0; 
   							  }
   	#join_form table th span:after { content: "*";
   									 font-size: 13px;
   									 color: #f95427;
   									 position: absolute;
   									 top: 0;
   									 right: 0;
   								   }
   	#join_form table td { padding: 6px 0;
   						  position: relative;
   						}
   	.gender { line-height : 30px; }
   	
   	#btn { margin-left : 50px; }
    #btn ul li { list-style: none; }

	.complete_btn_wrap { text-align: center; 
			   			 margin: 20px 30px 30px;
			   			 float: left;
			  		   }
	.complete_btn_wrap button { color: #fff; 
				  		   		background-color: #fc585e;
				  		   		border: 3px solid #fc585e; 
				  		   		font-size: 12pt;
				 		   		font-weight: bold; 
				  		   		padding: 10px;  
				 		   		height: 56px; 
				  		   		vertical-align: middle;
				 		  		width: 100px; 
				  		  		display: block; 
				 		   		text-align: center; 
				 		  		margin: 0 auto;
				 		 	  }
	.cancel_btn_wrap { text-align: center; 
			   		   margin: 20px 0 30px;
			   		   float: left;
			   		  
			  		 }
	.cancel_btn_wrap button { color: #fc585e; 
				  		 	  background-color: #fff; 
				  			  border: 3px solid #fc585e;
				  			  font-size: 12pt;
				 			  font-weight: bold; 
				  	  		  padding: 10px;  
				 	     	  height: 56px; 
				  		 	  vertical-align: middle;
				 		 	  width: 100px; 
				  		 	  display: block; 
				 		 	  text-align: center; 
				 		 	  margin: 0 auto;
				 			}

	.exform_txt{ padding:20px 0 10px 50px; 
				 text-align: left;
				 color: #9a9a9a;
				 font-size:13px;
			   }
	.exform_txt span{ display: inline-block;
					  position: relative; 
					  padding-left: 10px}
	.exform_txt span:after{ content: "*";
							position: absolute;
							left: 0;
							top: 0; 
							color: #f95427; 
							font-size: 13px; 
							font-weight: bold;}	 
</style>
<title>ȸ��������</title>
</head>
<body>
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>ȸ������</p></li>
			</ul>
       	</div>
       	
       	<form action = "UserInfoInsert.do" method = "post">
       	<div id = "join_form">
			<table>
              	<tbody>
					<tr>
						<th><span>���̵�</span></th>
						<td><input type="text" placeholder="ID �� �Է��ϼ���." name = "id"></td>
                	</tr>
                	<tr>
                  		<th><span>��й�ȣ</span></th>
                  		<td><input type="password" placeholder="��й�ȣ�� �Է����ּ���." name = "pw"></td>
                	</tr>
                	<tr>
                 		 <th><span>��й�ȣ Ȯ��</span></th>
                  		<td><input type="password" placeholder="��й�ȣ�� Ȯ���ϼ���" name = "pwcheck"></td>
               		 </tr>
               		 <tr>
                  		<th><span>�̸�</span></th>
                  		<td><input type="text" placeholder="" name = "name"></td>
                	</tr>
                	 <tr>
                  		<th><span>�г���</span></th>
                  		<td><input type="text" placeholder="" name = "nickname"></td>
                	</tr>
                	<tr>
                  		<th><span>����</span></th>
                  		<td class = "gender">
                  			<input type="radio" name = "gender" value = "F">���� 
                  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  			<input type="radio" name = "gender" value = "M">����
                  		</td>
                	</tr>
                	<tr>
                 		 <th><span>����</span></th>
                  		 <td><input type="text" placeholder="ex)1994-10-14" name = "birth"></td>
               		 </tr>
               		 <tr>
                 		 <th><span>��ȭ��ȣ</span></th>
                  		<td><input type="text" placeholder="ex)010-5402-6873" name = "tel"></td>
               		 </tr>
				</tbody>
			</table>
            <div class="exform_txt">
            	<span>ǥ�ô� �ʼ������� �Է����ּž� ������ �����մϴ�.</span>
            </div>
		
        
        	<div id = "btn">
        		<ul>
					<li class = "complete_btn_wrap">
						<button type = "submit" onclick = "SignUpComplete.jsp">�Ϸ�</button>
					</li>
					<li class = "cancel_btn_wrap">
						<button type = "reset" onclick = "main.html">���</button>
					</li>
				</ul>
       		</div>
       	</div><!-- join_form E  -->
       	</form>
       	<div id = "footer">
       	
       	</div>
	</div>
</body>
</html>