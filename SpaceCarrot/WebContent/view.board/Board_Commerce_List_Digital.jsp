<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../Base/reset.css" />
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
              width : 715px;
              text-align : center;
              margin-left : 183px;
            } 
      /* 카테고리 메뉴 */
      #category { height : 40px; 
      			  margin-top: 20px;
      			   }   
      #category ul { height : 40x; 
      			     padding : 0;
      			   }    
      #category ul li { list-style : none;
                    	color : #000000;
                   		float : left;
                    	text-align: center;
                    	vertical-align: middle;
                    	padding-right :35px;
                 	  }
      #category ul li:last-child{ padding : 0; }
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
      .digital_tab:after { content: "";
      					   display: block;
      					   width: 85px;
      					   text-align: center;
      					   border-bottom : 2px solid #000;
      					   margin-top: 8px;
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
       #items { width: 715px; height: 950px; } /* 왼쪽정렬 해결해야함 ㅠㅠ! */
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
                 }
      .goods p { margin-top: 10px;
                 margin-left: 10px;
                 margin-bottom: 12px;
                 font-size: 12pt;
                 float: left;
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
<title>중고거래_목록</title>
</head>
<body>
	
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>중고거래</p></li>
			</ul>
       	</div>
       	
       	<div id = "wrap">
       		<div id = "category">
       			<ul>
       				<li><a class="menuLink" href="Board_Commerce_List_Fashion.jsp">의류/패션</a></li>
       				<li class = "digital_tab"><a class="menuLink" href="Board_Commerce_List_Digital.jsp">디지털/가전</a></li>
       				<li><a class="menuLink" href="Board_Commerce_List_Book.jsp">도서/티켓/취미/애완</a></li>
       				<li><a class="menuLink" href="Board_Commerce_List_Life.jsp">생활/문구/가구</a></li>
       				<li><a class="menuLink" href="Board_Commerce_List_Sports.jsp">스포츠/레저</a></li>
       				<li><a class="menuLink" href="Board_Commerce_List_Other.jsp">기타</a></li>
       			</ul>
       		</div>
       		
       		<div>
       			<div id = "sell_btn">
       				<button style="cursor:pointer;" onclick="location='Board_Commerce_List_Sell.jsp'">판매하기</button>
       			</div>
       			<div id = "search">
       					<input type = "text" name = "searchArea">
       					<button><img src = "../img/SearchButton.png"></button>
       			</div>
       		</div>
       		
       		<div id = "items">
       			<ul class = "row">
       				<li class = "goods">
       					<img src = "../img/MainLogo.png" alt = "물품1">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       				<li class = "goods">
       					<img src = "../img/MainLogo.png" alt = "물품2">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       				<li class = "goods">
       					<img src = "../img/MainLogo.png" alt = "물품3">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       			</ul>
       			<ul class = "row">
       				<li class = "goods">
       					<img src = "../img/MainLogo.png" alt = "물품4">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       				<li class = "goods">
       					<img src = "../img/MainLogo.png" alt = "물품5">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       				<li class = "goods">
       					<img src = "../img/MainLogo.png" alt = "물품6">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       			</ul>
       			<ul class = "row">
       				<li class = "goods">
       					<img src = "../img/MainLogo.png" alt = "물품7">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       				<li class = "goods">
       					<img src = "../img/MainLogo.png" alt = "물품8">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       				<li class = "goods">
       					<img src = "../img/MainLogo.png" alt = "물품9">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       			</ul>
       		</div>
       		
       		<div id = "page_number">
       			<ul>
       				<li><a href="#"><</a></li>
					<li><a href="#">1</a></li>  
    				<li><a href="#">2</a></li>  
    				<li><a href="#">3</a></li>  
   					<li><a href="#">4</a></li>  
    				<li><a href="#">5</a></li>  
   					<li><a href="#">6</a></li>  
   					<li><a href="#">7</a></li>  
    				<li><a href="#">8</a></li>
    				<li><a href="#">></a></li>
       			</ul>
       		</div>
       </div>
       <div id = "footer">
       
       </div>
	</div>
</body>
</html>