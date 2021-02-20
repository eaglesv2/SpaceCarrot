<%@page import="java.util.Date"%>
<%@page import="java.sql.Timestamp"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../Base/reset.css" />
<c:if test="${empty articlePage}">
	<% RequestDispatcher rd = request.getRequestDispatcher("Commerce_Reset.do");
	   rd.forward(request, response);
	 %>
</c:if>
<%-- <c:if test="${not empty articlePage}">
	<% System.out.println("articlePage 들어옴"); %>
</c:if> test문--%>
<script>        
	$(document).ready(function(){    
		$("#header").load("../Base/Header.jsp");
		$("#footer").load("../Base/footer.html");
	})
	
	function timeBefore(){
	        //현재시간을 가져옴
	        var now = new Date(); 
	        
	        //글쓴 시간 
	        var writeDay = $("#regDate").val();
	        
	        var minus;
	        //현재 년도랑 글쓴시간의 년도 비교 
	        
	        if(now.getDate() > writeDay.getDate()){ //글쓴지 하루 이상 지났을 경우
	        	minus= now.getDate()-writeDay.getDate();
	        	$(".time").html(minus + "일 전")
	        } else if(now.getDate() == writeDay.getDate()){
	            //당일인 경우에는 
	            var nowTime = now.getTime();
	            var writeTime = writeDay.getTime();
	            
	            if(nowTime > writeTime) {
	            //시간을 비교
	                sec = parseInt(nowTime - writeTime) / 1000;
	                day  = parseInt(sec/60/60/24);
	                sec = (sec - (day * 60 * 60 * 24));
	                hour = parseInt(sec/60/60);
	                sec = (sec - (hour*60*60));
	                min = parseInt(sec/60);
	                sec = parseInt(sec-(min*60));
	                if(hour > 0){
	                //몇시간전인지
	                	$(".time").html("hour + '시간 전'");

	                }else if(min > 0){
	                //몇분전인지
	                    $(".time").html("min + '분 전'");
	                }
	            }
	        }
	}
	
	
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
      .book_tab:after { content: "";
      					display: block;
      					width: 148px;
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
<meta charset="UTF-8">
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
       				<li><a class="menuLink" href="Board_Commerce_List_Digital.jsp">디지털/가전</a></li>
       				<li class = "book_tab"><a class="menuLink" href="Board_Commerce_List_Book.jsp">도서/티켓/취미/애완</a></li>
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
       	<c:if test="${not empty articlePage}">

       		<div id = "items">
       			<ul>
				<c:forEach var="article" items="${articlePage.content}">
       				<li class = "goods">
       					<img src = "data:x-image/jpg;base64,${article.repImage}" >
        					
       					<p><c:out value="${article.subject}"></c:out></p>
       					<span class = "price">${article.price}</span>
       					<span class = "time">${article.regDate}</span>
       					<input type = "hidden" id = "regDate" value = "${article.regDate}">
       				</li>
       				</c:forEach>
       			</ul>
       		</div>
       		
       	</c:if>
       		<div id = "page_number">
       		<!-- 게시판 이동 항목 -->
	<c:if test="${articlePage.hasArticles()}">
		<ul>
			<li>
				<!-- 현재페이지가 5 이상일 시 이전 링크--> <c:if
					test="${articlePage.startPage > 5}">
					<a
						href="Commerce_Reset.do?pageNo=${articlePage.startPage - 5}">[이전]</a>
				</c:if> <!-- startPage to endPage --> <c:forEach var="pNo"
					begin="${articlePage.startPage}" end="${articlePage.endPage}">
					<a href="Commerce_Reset.do?pageNo=${pNo}">${pNo}</a>
				</c:forEach> <!-- endPage가 총페이지보다 작을 시에 다음 링크 --> <c:if
					test="${articlePage.endPage < articlePage.totalPages}">
					<a
						href="Commerce_Reset.do?pageNo=${articlePage.startPage + 5 }">[다음]</a>
				</c:if>
			</li>
		</ul>
	</c:if>
       		</div>
       </div>
       <div id = "footer">
       
       </div>
	</div>
</body>
</html>