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
	  
	  /* 커뮤니티 타이틀 */
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
     /* 글쓰기 서브타이틀 */       
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
             	 margin-left : 200px;
    		   }
    #board_form table { border-spacing: 0;
    				   margin: 0;
    				   padding: 0; 
    				   border: 0;
    				 }
    				 
    #board_form table select { text-align:center;
    						   width:230px;
    						   height:35px;
    						   padding: .5em .5em;
    }
    
    #board_form table option { font-size: 13pt;
    
    }
	#board_form table input { border: 1px solid #ececec;
							 font-size: 13pt;
							 color: #4c4c4c;  
							 padding: 10px; 
						   }
						   
	#board_title { height: 40px;
				   width: 622px;
	
	}
 	
 	#content { height: 500px;
			   width: 622px;
			   font-size: 11.5pt;
 			   padding: .8em .5em;
 	}
 	
    #board_form table th { text-align : center; }
   	#board_form table th span { color: #404040;
   							   font-size: 15px; 
   							   display: inline-block; 
   							   padding: 0 20px 0 0; 
   							  }
   	#board_form table td { padding: 6px 0;
   						  position: relative;
   						}
   	#btn { margin-left : 190px; }
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
</head>
<meta charset="UTF-8">
<title>커뮤니티_글쓰기</title>
</head>
<body>
<div></div>
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>커뮤니티</p></li>
			</ul>
       	</div>
       	
       	<div id="subtitle">
       		<ul>
       			<li class="subtitle_wrap"><p>글쓰기</p>
       			</li>
       		</ul>
       	</div>
       	<form action="Write_Community.do" method="post">
       	<div id = "board_form">
			<table>
              	<tbody>
					<tr>
						<th><span>카테고리</span></th>
						<td>
							<select name="category">
							<option value="자유" selected>자유
							<option value="정보">정보
							<option value="QnA">QnA
							<option value="리뷰">리뷰
							</select>
						</td>
						
                	</tr>
                	<tr>
                  		<th><span>제목</span></th>
                  		<td><input id="board_title" type="text" name="title" placeholder="제목을 입력해주세요."></td>
                	</tr>
                	<tr>
                 		 <th><span>내용</span></th>
                  		 <td><!-- <input id="content" type="text" name="content" placeholder=""> -->
                  		 <textarea name="content" id="content" ></textarea> 
                  		 </td>
               		 </tr>
				</tbody>
			</table>		
        
        	<div id = "btn">
        		<ul>
					<li class = "complete_btn_wrap">
						<Button type="submit">완료</Button>
					</li>
					<li class = "cancel_btn_wrap">
						<Button type="reset">취소</Button>
					</li>
				</ul>
       		</div>
       	</div>
       	</form>
       	
       <div id = "footer">
       
       </div>
	</div>
</body>
</html>