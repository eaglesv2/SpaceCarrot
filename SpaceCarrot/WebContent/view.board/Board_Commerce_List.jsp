<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<script>        
	$(document).ready(function(){    
		$("#header").load("../Base/header.html");
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
      #category { height : 40px; }   
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
      #category .menuLink:hover { text-decoration : underline; 
                           text-underline-position : under;
                          }     
                          
      /* 판매버튼 + 검색창 */
      #sell_btn { float: left; 
      			  margin-bottom: 40px;
      			  margin-right: 30px;
      			  height: 60px; 
      			  width: 100px;
      			  vertical-align: center:
      			}
      #sell_btn button { color: #fff;
      					 background-color: #fc585e; 
      					 outline: none;
	  			 		 border: 0; 
	  			 		 width: 100%; 
	  			 		 height: 100%;
	  			 		 padding: 10px;
	  			 		 font-weight: bold;
	  			 		 font-size: 11.5pt;
	  			 		 
	  			 	}
				 	   
	  #search { width: 570px; 
	  			height: 55px; 
	  			border: 3px solid #fc585e; 
	  			float: left;
	  			margin-bottom: 40px;
	  			 }
      #search input { border: 0;
      				  padding: 10px;
      				  outline: none;
				  	  width: 470px;
				  	  height: 30px;
				  	  float: left;
				  	  font-size: 12pt;
				  	  text-align: right;
				  	  margin-right: 0px;
				  	}
	  #search button { margin-left: 0px;
	 			 	   background-color: #fc585e;
	  			  	   width: 80px;
	  			  	   height: 56px;
	  			  	   padding-top: 5px;
	  			  	   float: left;
	  			  	   outline: none;
	  			  	   border: 0;
	  			 	 }

      
       /* 중고물품 목록 */
       #items { width: 715px; height: 950px; } /* 왼쪽정렬 해결해야함 ㅠㅠ! */
      .goods { float : left;
               width : 210px;
               height : 280px;
               border: 1px solid #eeeeee;
               margin-right : 12px;
               margin-bottom : 12px;
               list-style : none; 
               margin-left:0px;
             }
      .goods img { width : 210px;
                   height : 200px;
                   border-bottom: 1px solid #eeeeee;
                 }
      .goods p { margin-top : 10px;
                 margin-left : 10px;
                 font-size : 12pt;
                 float : left;
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
							  margin-right: 20px;
							  /* height: 50px; */
							  width: 15px;
							  color: #000;
							  font-size: 12pt;
							  text-align: center;
							  text-decoration: none;
      						}
       #page_number ul li a:hover, ul li a:focus { color: #fff;
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
       				<li><a class="menuLink" href="#">의류/패션</a></li>
       				<li><a class="menuLink" href="#">디지털/가전</a></li>
       				<li><a class="menuLink" href="#">도서/티켓/취미/애완</a></li>
       				<li><a class="menuLink" href="#">생활/문구/가구</a></li>
       				<li><a class="menuLink" href="#">스포츠/레저</a></li>
       				<li><a class="menuLink" href="#">기타</a></li>
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
       			<ul>
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
       			<ul>
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
       			<ul>
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