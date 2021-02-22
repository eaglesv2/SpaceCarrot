<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="../Base/reset.css" />
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<c:if test="${empty articlePage}">
   <% 
   RequestDispatcher rd = request.getRequestDispatcher("Writer_Search.do");
   rd.forward(request, response);
   System.out.print("redirect success"); %>
</c:if>
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
	  /* 커뮤니티 타이틀 */
      #title ul li { list-style: none; }
      .title_wrap { text-align: center;
      				margin-bottom:35px;				
      }
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
      			  margin-left : 300px;
      			  margin-bottom:30px;
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
                          
      .comment:after { content: "";
      					display: block;
      					width: 68px;
      				    text-align: center;
      		  		    border-bottom : 2px solid #000;
      					margin-top: 8px;
      				  }     
      
       /* 게시글 목록 */
       #board_wrap { width: 710px; height: 550px; 
       				 margin: 0 auto;
					 right:500px;
    				 /* box-sizing: border-box; */} /* 왼쪽정렬 해결해야함 ㅠㅠ! */
       a { text-decoration: none;
		   color: #404040;
		}

		li {
		    list-style: none;
		}

		/* #board_wrap ul { width: 100%;
		}
 */
		#board_wrap ul li {
		    line-height: 50px; /*li 세로 간격*/
		    padding-left: 10px;
		}

		#board_wrap ul li:first-child {
			border-top: 3px solid #6a6a6a;
		    border-bottom: 3px solid #6a6a6a;
		    font-weight: bold;
		}

		#board_wrap ul li:last-child {
		    border-bottom: 3px solid #6a6a6a;
		}
		
		#board_wrap ul li:nth-child(n+2):nth-child(-n+10) {
			border-bottom: 1px solid #000;
		}

		#board_wrap ul li span:first-child {
			display: inline-block;
		    float: left;
		    padding-right:188px;
		}

		#board_wrap ul li span:nth-child(2) {
			display: inline-block;
		    padding-right:200px;
		}
		#board_wrap ul li span:nth-child(3) {
			display: inline-block;
		    padding-right:40px;
		}
		#board_wrap ul li span:nth-child(4) {
			display: inline-block;
		    padding-right:20px;
		}
		#board_wrap ul li span:last-child {
		    display: inline-block;
		    float: right;
		    padding-right:20px;
		}
 
       /* 페이지번호 */
       #page_number { margin-top: 50px; }
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
<meta charset="UTF-8">
<title>커뮤니티_작성자</title>
</head>
<body>
	
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>커뮤니티 - 작성자가 남긴 댓글 보기</p></li>
			</ul>
       	</div>
       	
       	<div id = "wrap">
       		<div id = "category">
       			<ul>
       				<li><a class="menuLink" href="Community_Writer_Writting.jsp">작성글</a></li>
       				<li class = "comment"><a class="menuLink" href="Community_Writer_Comment.jsp">작성댓글</a></li>
       			</ul>
       		</div>
       		
       		<div id="board_wrap">
			    <ul>
			    <c:forEach var="article" items="${articlePage.content}">
        			<li><span>번호</span><span>제목</span><span>작성자</span><span>조회수</span><span>작성일</span></li>

			        <li><span>${article.postNum}</span><span><a href="Read_Community.do?no=${article.postNum}&pageNo=${articlePage.currentPage}">${article.subject}</a></span><span>${article.userNickName}</span><span>${article.views}</span><span>${article.regDate}</span></li>
			        <!-- <li><span>9</span><span><a href="#">제목</a></span><span>김단성사</span><span>2</span><span>21.02.15</span></li>
			        <li><span>8</span><span><a href="#">제목</a></span><span>김단성사</span><span>2</span><span>21.02.15</span></li>
			        <li><span>7</span><span><a href="#">제목</a></span><span>김단성사</span><span>2</span><span>21.02.15</span></li>
			        <li><span>6</span><span><a href="#">제목</a></span><span>김단성사</span><span>2</span><span>21.02.15</span></li>
			        <li><span>5</span><span><a href="#">제목</a></span><span>김단성사</span><span>2</span><span>21.02.15</span></li>
			        <li><span>4</span><span><a href="#">제목</a></span><span>김단성사</span><span>2</span><span>21.02.15</span></li>
			        <li><span>3</span><span><a href="#">제목</a></span><span>김단성사</span><span>2</span><span>21.02.15</span></li>
			        <li><span>2</span><span><a href="#">제목</a></span><span>김단성사</span><span>2</span><span>21.02.15</span></li>
			        <li><span>1</span><span><a href="#">제목</a></span><span>김단성사</span><span>2</span><span>21.02.15</span></li> -->
			    </c:forEach>        			
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