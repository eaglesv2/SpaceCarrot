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
							 font-size: 13pt;
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
   	#join_form table th span:after { content: '*';
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
   	
    #btn ul li { list-style: none; }
	.complete_btn_wrap { text-align: center; 
			   			 margin: 20px 30px 30px;
			   			 float: left;
			  		   }
	.complete_btn_wrap a { color: #fff; 
				  		   background-color: #fc585e;
				  		   border: 3px solid #fc585e; 
				 		   font-weight: bold; 
				  		   padding: 10px;  
				 		   height: 30px; 
				  		   line-height: 30px; 
				 		   width: 100px; 
				  		   display: block; 
				 		   text-align: center; 
				 		   margin: 0 auto;
				 		 }
	.complete_btn_wrap a.wide { width:587px;
					   			margin: 0 0 0 20px;
					 		  }
					 
	.cancel_btn_wrap { text-align: center; 
			   		   margin: 20px 0 30px;
			   		   float: left;
			   		  
			  		 }
	.cancel_btn_wrap a { color: #fc585e; 
				  		 background-color: #fff; 
				  		 border: 3px solid #fc585e; 
				 		 font-weight: bold; 
				  	  	 padding: 10px;  
				 	     height: 30px; 
				  		 line-height: 30px; 
				 		 width: 100px; 
				  		 display: block; 
				 		 text-align: center; 
				 		 margin: 0 auto;
				 	}
 	.cancel_btn_wrap a.wide { width:587px;
					  	 	  margin: 0 0 0 20px;
					 		}	
	.exform_txt{ padding:20px 0 10px 50px; 
				 text-align: left;
				 color: #9a9a9a;
				 font-size:13px;
			   }
	.exform_txt span{ display: inline-block;
					  position: relative; 
					  padding-left: 10px}
	.exform_txt span:after{ content:'*';
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
       	
	<form action="DBInsert.do" method="post">
       	<div id = "join_form">
			<table>
              	<tbody>
					<tr>
						<th><span>���̵�</span></th>
						<td><input type="text" name="userid" placeholder="ID �� �Է��ϼ���."></td>
                	</tr>
                	<tr>
                  		<th><span>��й�ȣ</span></th>
                  		<td><input type="password" name="userpw" placeholder="��й�ȣ�� �Է����ּ���."></td>
                	</tr>
                	<tr>
                 		 <th><span>��й�ȣ Ȯ��</span></th>
                  		<td><input type="password" placeholder="��й�ȣ�� Ȯ���ϼ���"></td>
               		 </tr>
               		 <tr>
                  		<th><span>�̸�</span></th>
                  		<td><input type="text" name="username" placeholder=""></td>
                	</tr>
                	<tr>
                  		<th><span>����</span></th>
                  		<td class = "gender">
                  			<input type="radio" name = "usergender" value = "F">���� 
                  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  			<input type="radio" name = "usergender" value = "M">����
                  		</td>
                	</tr>
                	<tr>
                 		 <th><span>����</span></th>
                  		 <td><input type="text" name="userbirth" placeholder="ex)1994-10-14"></td>
               		 </tr>
               		 <tr>
                 		 <th><span>��ȭ��ȣ</span></th>
                  		<td><input type="text" name="usertel" placeholder="ex)010-5402-6873"></td>
               		 </tr>
				</tbody>
			</table>
            <div class="exform_txt">
            	<span>ǥ�ô� �ʼ������� �Է����ּž� ������ �����մϴ�.</span>
            </div>
		
        
        	<div id = "btn">
        		<ul>
					<li class = "complete_btn_wrap">
						<a href = "#">�Ϸ�</a>
					</li>
					<li class = "cancel_btn_wrap">
						<a href = "#">���</a>
					</li>
				</ul>
       		</div>
       	</div><!-- join_form E  -->
       	
       	<div id = "footer">
       	
       	</div>
    </form>
	</div>
</body>
</html>