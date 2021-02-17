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
               
	  /* ���������� Ÿ��Ʋ */
    #title ul li { list-style: none; }
    .title_wrap { text-align: center;
    			  margin-bottom: 30px;
     }
	.title_wrap p { color: #fff; 
				  	background-color: #fc585e; 
				  	padding : 25px 0px;
				  	font-size : 16pt;
				  	font-weight: bold; 
				  	display: block; 
				 	margin: 0 auto;
				  }

	/* ī�װ� �޴� */
      #category { height : 20px;
      			  margin-left : 250px;
      }   
      #category ul { height : 40x; 
      			     padding : 0;
      			   }    
      #category ul li { list-style : none;
                    	color : #000000;
                   		float : left;
                    	text-align: center;
                    	padding-right :40px;
                 	  }
      #category ul li:last-child{ padding : 0; }
      #category .menuLink { text-decoration : none;
                       	    color : #000000;
                       	    display : block;
                       	    font-size : 11.5pt;
                       	    font-weight : bold;
                    	  }
      /* #category .menuLink:hover { text-decoration : underline; 
                           text-underline-position : under;
                          } */
                          
      .my_info_tab:after { content: "";
      					display: block;
      					width: 100px;
      				    text-align: center;
      		  		    border-bottom : 2px solid #000;
      					margin-top: 8px;
      				  } 
	
	/* ��� */
	#care { font-size: 13pt;
			background-color: #000000;
			color: #ffffff;
			font-weight: bold;
			margin-top: 20px;
			margin-left: 360px;
			vertical-align: middle;
			width: 370px;
			height: 30px;
	
	}
	
	/* ���� ���� ���� �� */
    #join_form { margin : 0 auto;
              	 width : 715px;
              	 text-align : center;
             	 margin-left : 350px;
    		   }
    #join_form table { border-spacing: 0 30px;
    				   border-collapse: separate;
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
 
    #join_form table th { text-align : center; }
   	#join_form table th span { color: #404040;
   							   font-size: 15px; 
   							   display: inline-block; 
   							   padding: 0 20px 0 0;
   							   font-weight:bold; 
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
   	
   	#join_form .id { text-align:left;
   	}

   	#join_form .name { text-align:left;
   	}
   	
   	#join_form .gender { text-align:left;
   	}
   	
   	#join_form .birth { text-align:left;
   	}
   	
   	.pw_re { text-align:left;
   			 border-spacing: 0px;
   			 border-style:none;
   			 padding:0px;
   	}
   	
   	.tel { text-align:left;
   		   /* border-collapse: separate; */
   		   border-spacing: 0;
   	}
   	
   	/* ��ư */
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
</style>
<title>����������_����_��������</title>
</head>
<body>
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>����������</p></li>
			</ul>
       	</div>
       	
       	<div id = "category">
       		<ul>
       			<li class = "my_info_tab"><a class="menuLink" href="Mypage_Modify_My_Info.jsp">�� ���� ����</a></li>
       			<li><a class="menuLink" href="Mypage_List_Community.jsp">���� �ø� Ŀ�´�Ƽ �� ����</a></li>
       			<li><a class="menuLink" href="Mypage_List_Board_Commerce.jsp">���� �ø� �߰�ŷ� �� ����</a></li>
       		</ul>
       	</div>
     	<hr>
       	
       		<div id="care">
       			��й�ȣ, ��ȭ��ȣ, �г��Ӹ� ���� �����մϴ�
       		</div>
       		
       	<form action = "UserInfoInsert.do" method = "post">
       	<div id = "join_form">
			<table>
              	<tbody>
					<tr>
						<th><span>���̵�</span></th>
						<td class="id">abc1234</td>
                	</tr>
                	<tr>
                  		<th><span>��й�ȣ</span></th>
                  		<td><input type="password" placeholder="��й�ȣ�� �Է����ּ���." name = "pw"></td>
                	</tr>
                	<tr>
                 		 <th><span>��й�ȣ Ȯ��</span></th>
                  		<td><input type="password" placeholder="��й�ȣ�� Ȯ���ϼ���" name = "pwcheck"></td>
               		 </tr>
               		 <tr class="pw_re">
               		 	<th><span></span></th>
               		 	<td>�� ��й�ȣ�� ��ġ���� �ʽ��ϴ�</td>
               		 </tr>
                	 <tr>
                  		<th><span>�г���</span></th>
                  		<td><input type="text" placeholder="" name = "nickname"></td>
                	</tr>
               		 <tr>
                 		 <th><span>��ȭ��ȣ</span></th>
                  		<td><input type="text" placeholder="ex)010-5402-6873" name = "tel"></td>
               		 </tr>
               		 <tr class="tel">
               		 	<th><span></span></th>
               		 	<td>�� Ư������ ��� �Ұ����մϴ�</td>
               		 </tr>
               		 <tr>
                  		<th><span>�̸�</span></th>
                  		<td class="name">��ö��</td>
                	</tr>
                	<tr>
                  		<th><span>����</span></th>
                  		<td class="gender">����</td>
                	</tr>
                	<tr>
                 		 <th><span>����</span></th>
                  		 <td class="birth">19911111</td>
               		 </tr>
				</tbody>
			</table>		
        
        	<div id = "btn">
        		<ul>
					<li class = "complete_btn_wrap">
						<button type = "submit" onclick = "#">����</button>
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