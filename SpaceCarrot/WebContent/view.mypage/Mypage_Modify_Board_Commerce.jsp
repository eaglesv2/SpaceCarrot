<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../Base/reset.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>        
	$(document).ready(function(){    
		$("#header").load("../Base/Header.jsp");
		$("#footer").load("../Base/footer.html");
	})
</script>
<style>
      #container { margin : 0 auto;
                   width : 1080px;
                 }
	  
	  /* 마이페이지 타이틀 */
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

     /* 내가 올린 중고거래 글 수정하기 서브타이틀 */       
     #subtitle ul li { list-style: none; }
     .subtitle_wrap { text-align: center; }
	 .subtitle_wrap p { padding : 25px 0px;
				  	  font-size : 18pt;
				  	  font-weight: bold; 
				  	  display: block; 
				 	  margin: 0 auto;
				 	  text-decoration: underline;
				    }
     
     /* 게시 형식 */
       #board_form { margin : 0 auto;
              	 width : 1000px;
              	 margin-top : 40px;
             	 margin-left : 150px;
    		   }
    #board_form table { border-spacing: 0;
    				   margin: 0;
    				   padding: 0; 
    				   border: 0;
    				 }
    				 
    #board_form table select { width:300px;
    
    }
    
    #board_form table option { font-size: 13pt;
    
    }
	#board_form table input { border: 1px solid #ececec;
							 font-size: 13pt;
							 color: #4c4c4c;  
							 padding: 10px; 
						   }
						   
	#board_title { height: 30px;
				   width: 700px;
	
	}
	
	#price { height: 30px;
			 width: 150px;
	
	}
 
 	#count { height: 30px;
			 width: 150px;
 	
 	}
 	
 	#explain { height: 600px;
			   width: 700px;
 	
 	}
 	
 	#board_form .file_upload { border:0;
 	}
 	
    #board_form table th { text-align : center; }
   	#board_form table th span { color: #404040;
   							   font-size: 15px; 
   							   display: inline-block; 
   							   padding: 0 20px 0 0;
   							   font-weight:bold; 
   							  }

   	#board_form table td { padding: 6px 0;
   						  position: relative;
   						}
   	
   	/* 버튼 */
   	#btn {margin-left:50px;}
    #btn ul li { list-style: none; }
	.complete_btn_wrap { text-align: center; 
			   			 margin: 20px 30px 30px;
			   			 margin-left : 200px;
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

</style>
</head>
<meta charset="EUC-KR">
<title>마이페이지_수정_중고거래</title>
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
       	
       	<div id="subtitle">
       		<ul>
       			<li class="subtitle_wrap"><p>내가 올린 중고거래 글 수정하기</p>
       			</li>
       		</ul>
       	</div>
       	<div id = "board_form">
			<table>
              	<tbody>
					<tr>
						<th><span>카테고리</span></th>
						<td>
							<select name="category">
							<option value="커뮤니티">커뮤니티<br>
							<option value="중고거래" selected>중고거래<br>
							</select>
						</td>
						
                	</tr>
                	<tr>
                  		<th><span>제목</span></th>
                  		<td><input id="board_title" type="text" name="title" placeholder="제목을 입력해주세요."></td>
                	</tr>
                	<tr>
                 		 <th><span>대표 이미지</span></th>
                  		<td ><input class="file_upload" type="file" name="file1"></td>
               		 </tr>
               		 <tr>
                  		<th><span>수량</span></th>
                  		<td><input id="count" type="text" name="count" placeholder=""></td>
                	</tr>
                	<tr>
                  		<th><span>가격</span></th>
                  		<td>
                  			<input id="price" type="text" name="price" placeholder="">
                  		</td>
                	</tr>
                	<tr>
                 		 <th><span>설명</span></th>
                  		 <td><input id="explain" type="text" name="explanation" placeholder=""></td>
               		 </tr>
				</tbody>
			</table>		
        
        	<div id = "btn">
        		<ul>
					<li class = "complete_btn_wrap">
						<a href = "#">수정 완료</a>
					</li>
					<li class = "cancel_btn_wrap">
						<a href = "#">취소</a>
					</li>
				</ul>
       		</div>
       	</div>
       	
       <div id = "footer">
       
       </div>
	</div>
</body>
</html>