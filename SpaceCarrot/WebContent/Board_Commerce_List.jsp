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
		$("#header").load("header.html");
		$("#footer").load("footer.html");
	})
</script>
<style>
      #container { margin : 0 auto;
                   width : 1080px;
                 /* border : 2px solid black; */
                 }
	  /* 중고거래 타이틀 */
      #title { width : 1080px; 
      		   height : 70px;
      		   background-color : #fc585e; 
      		 }
      #title p { margin:0; }
      #title ul li { color : white;
                     font-size : 18pt;
                     font-weight : bold;
                     font-family : "나눔고딕";
                     text-align: center;
                     padding-top : 25px;
                     margin: 0px;
                     display : block;
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
                    	/*vertical-align : middle;*/
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
      #sellButton { width : 100px;
      				height : 56px;
                    background-color: #fc585e;        
                    cursor : pointer;
                    flaot : left;
                    margin-right : 30px;
                  }
	  #sellButton p { margin : 0; padding-left : 0px; }
      #sellButton ul li { list-style : none; 
       					  font-size : 12pt;
       					  color : white;
       					  font-weight : bold;
                     	  padding : 5px;
                     	  margin: 0px;
                     	  display : block;
      					  text-align : center;
                   		  text-decoration : none;
                         }
      #search { float : left; }
      #search ul li { list-style : none; }
      #search ul li span { boarder : 3px solid #fc585e; }
      .searchSpace { width : 400px;
      			 	 height : 50px;
      			 	 boarder : 0px;
      			 	 font-size : 12pt;
      			 	 line-height : 50px;  
      			 	 outline: none;
      			   }
      .searchIcon { background-color : #fc585e;
      				padding : 8px 20px; 
      				height : 50px;
      				line-height : 50px;
      			  }
      
       /* 중고물품 목록 */
      .goods { float : left;
               width : 230px;
               height : 280px;
               border: 1px solid #eeeeee;
               margin-right : 12px;
               margin-bottom : 12px;
               list-style : none; 
             }
      #layer1 li:last-child { padding : 0px; }
      .goods img { width : 230px;
                   height : 200px;
                   border: 1px solid #eeeeee;
                 }
      .goods p { margin-top : 10px;
                 margin-left : 10px;
                 font-size : 12pt;
                 float : left;
               }
      .price { margin-top : 12px;
               margin-left : 10px;
               margin-bottom : 15px; 
               font-size : 11pt;
               clear : left;
               float : left;
             }
      .time { margin-top : 12px;
              margin-right : 10px;
              margin-bottom : 15px;
              font-size : 10pt;
              float : right;
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
				<li><p>중고거래</p></li>
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
       			<div id = "sellButton">
       				<ul>
       					<li><p><a href = "#">판매하기</a></p></li>
       				</ul>
       			</div>
       			<div id = "search">
       				<ul>
       					<li>
       						<input type = "text" class = "searchSpace">
       						<button class = "searchIcon" type = "submit"><img src = "img/SearchIcon.png"></button>
       					</li>
       				</ul>
       			</div>
       		</div>
       		
       		<div>
       			<ul id = "layer1">
       				<li class = "goods">
       					<img src = "img/MainLogo.png" alt = "물품1">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       				<li class = "goods">
       					<img src = "img/MainLogo.png" alt = "물품2">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       				<li class = "goods">
       					<img src = "img/MainLogo.png" alt = "물품3">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       			</ul>
       			<ul>
       				<li class = "goods">
       					<img src = "img/MainLogo.png" alt = "물품4">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       				<li class = "goods">
       					<img src = "img/MainLogo.png" alt = "물품5">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       				<li class = "goods">
       					<img src = "img/MainLogo.png" alt = "물품6">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       			</ul>
       			<ul>
       				<li class = "goods">
       					<img src = "img/MainLogo.png" alt = "물품7">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       				<li class = "goods">
       					<img src = "img/MainLogo.png" alt = "물품8">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       				<li class = "goods">
       					<img src = "img/MainLogo.png" alt = "물품9">
       					<p>제목</p>
       					<span class = "price"><%-- <% price %>원 --%>가격</span>
       					<span class = "time"><%-- <% time %> 분전 --%>시간</span>
       				</li>
       			</ul>
       		</div>
       		
       </div>
       <div id = "footer">
       
       </div>
	</div>
</body>
</html>