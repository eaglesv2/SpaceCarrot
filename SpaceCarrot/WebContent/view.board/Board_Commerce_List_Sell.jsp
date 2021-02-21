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
                   /* border : 2px solid black; */
                 }
	  /* 중고거래 타이틀 */
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
              width : 730px;
              text-align : center;
              margin-left : 183px;
            } 
      /* 카테고리 메뉴 */
      #category { height : 40px; 
      			  margin-top: 20px;
      			   }   
      #category ul { height : 40x; 
      			     
      			   }    
      #category ul li { list-style : none;
                    	color : #000000;
                   		float : left;
                    	text-align: center;
                    	vertical-align: middle;
                    	margin-right :35px;
                 	  }
      #category ul li:last-child{ margin-right : 0; }
      #category .menuLink { text-decoration : none;
                       	    color : #000000;
                       	    display : block;
                       	    font-size : 12pt;
                       	    font-weight : bold;
                       	    cursor: pointer;
                    	  }
      /* #category .menuLink:hover { text-decoration : underline; 
                           		  text-underline-position : under;
                          		} */
	/*탭 */
	#category ul li:nth-child(1){
    border-bottom: 2px solid #000;
    padding-bottom: 8px;
		
		}
                          
      /* 판매버튼 + 검색창 */
      #sell_btn { float: left; 
      			  margin-bottom: 40px;
      			  margin-right: 30px;
      			  height: 56px; 
      			  width: 113px;
      			  vertical-align: center;
      			}
      #sell_btn button { color: #fff;
      					 background-color: #fc585e; 
      					 outline: none;
	  			 		 border: 3px solid #fc585e; 
	  			 		 width: 100%; 
	  			 		 height: 100%;
	  			 		 padding: 10px;
	  			 		 font-size: 18px;
	  			 		 font-weight: bold;		
	  			 		 cursor: pointer; 
	  			 	}
				 	   
	  #search { width: 565px; 
	  			height: 50px; 
	  			border: 3px solid #fc585e; 
	  			float: left;
	  			margin-bottom: 40px;
	  			 }
      #search input { border: 0;
      				  padding: 10px 10px 0px 0px;
      				  outline: none;
				  	  width: 480px;
				  	  height: 30px;
				  	  float: left;
				  	  font-size: 16pt;
				  	  text-align: right;
				  	  margin-right: 0px;
				  	}
	  #search button { margin-left: 0px;
	 			 	   background-color: #fc585e;
	  			  	   width: 75px;
	  			  	   height: 50px;
	  			  	   padding: 6px 7px 10px 7px;
	  			  	   float: left;
	  			  	   outline: none;
	  			  	   border: 0;
	  			  	   cursor: pointer;
	  			 	 }

      
       /* 중고물품 목록 */
       #items { width: 730px; height: 950px; } /* 왼쪽정렬 해결해야함 ㅠㅠ! */
      .row li:last-child { margin-right: 0px; }
      .goods { float : left;
               width : 227px;
               height : 280px;
               border: 1px solid #eeeeee;
               margin-right : 14px;
               margin-bottom : 12px;
               list-style : none; 
               margin-left: 0px;
             }
      .goods img { width : 227px;
                   height : 210px;
                   border-bottom: 1px solid #eeeeee;
                   cursor: pointer;
                 }
      .goods p { margin-top: 10px;
                 margin-left: 10px;
                 margin-bottom: 12px;
                 font-size: 12pt;
                 float: left;
                 cursor: pointer;
               }
      .price { margin-left : 10px;
               margin-bottom : 15px; 
               font-size : 11pt;
               clear : left;
               float : left;
             }
      .time { margin-right : 10px;
              margin-bottom : 15px;
              font-size : 10pt;
              float : right;
           }
           
       /* 페이지번호 */
       #page_number { margin-top: 40px; }
       #page_number ul li { list-style: none;
       				  		display: inline;
       					  }
       #page_number ul li a { padding: 4px;
							  margin-right: 10px;
							  /* height: 50px; */
							  width: 15px;
							  color: #000;
							  font-size: 12pt;
							  text-align: center;
							  text-decoration: none;
      						}
       #page_number ul li a:hover, #page_number ul li a:focus { color: #fff;
												   				border: 1px solid #000;
												  				border-radius: 50%;
												   				background-color: #000;
												 			  }
</style>
</head>
<meta charset="EUC-KR">
<title>중고거래_판매</title>
</head>
<body>
<%
session.getAttribute("sessionID");
session.getAttribute("sessionNickName");
%>

	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>중고거래</p></li>
			</ul>
       	</div>
       	
       	<div id="subtitle">
       		<ul>
       			<li class="subtitle_wrap"><p>판매하기</p>
       			</li>
       		</ul>
       	</div>
       	
       	<form action="CommerceInsert.do" method="post" enctype="multipart/form-data">
       	<div id = "board_form">
			<table>
              	<tbody>
					<tr>
						<th><span>카테고리</span></th>
						<td>
							<select name="category">
								<option value="fashion" selected>의류/패션
								<option value="digit">디지털/가전
								<option value="book">도서/티켓/취미/애완
								<option value="life">생활/문구/가구
								<option value="sports">스포츠/레저		
								<option value="other">기타					
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
                  		<td><input id="amount" type="text" name="amount" placeholder=""></td>
                	</tr>
                	<tr>
                  		<th><span>가격</span></th>
                  		<td>
                  			<input id="price" type="text" name="price" placeholder=""> &nbsp;원
                  		</td>
                	</tr>
                	<tr>
                 		 <th><span>설명</span></th>
                  		 <td><textarea name="content" id="content"></textarea></td>
               		 </tr>
				</tbody>
			</table>		
        
        	<div id = "btn">
        		<ul>
					<li class = "complete_btn_wrap">
						<button type="submit">완료</button>
					</li>
					<li class = "cancel_btn_wrap">
						<button type="reset">취소</button>
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