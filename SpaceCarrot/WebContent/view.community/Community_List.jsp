<%@page import="spacecarrotVO.SpaceCarrotVO_Board_Community"%>
<%@page import="java.util.List"%>
<%@page import="spacecarrotDAO.SpaceCarrotDAO_Board_Community"%>
<%@page import="spacecarrotDBConn.SpaceCarrotDBConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
		$("#header").load("../Base/header.html");
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
      #category .menuLink:hover { text-decoration : underline; 
                           text-underline-position : under;
                          }     
                          
      /* 글쓰기버튼 + 검색창 */
      #btn {
      	margin-bottom:100px;
      }
      
      #write_btn { float: left; 
      			  margin-bottom: 40px;
      			  margin-right: 30px;
      			  height: 60px; 
      			  width: 100px;
      			  vertical-align: center:
      			}
      #write_btn button { color: #fff;
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
      
       /* 게시글 목록 */
       #board_wrap { width: 800px; height: 550px; 
       				 margin: 0 auto;
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
			border-top: 2px solid #6a6a6a;
		    border-bottom: 2px solid #6a6a6a;
		}
		#board_wrap ul li:last-child {
		    border-bottom: 2px solid #6a6a6a;
		}
		
		#board_wrap ul li:nth-child(n+2):nth-child(-n+10) {
			border-bottom: 1px solid #000;
		}
		#board_wrap ul li span:first-child {
			display: inline-block;
		    float: left;
		    padding-right:218px;
		}
		#board_wrap ul li span:nth-child(2) {
			display: inline-block;
		    padding-right:220px;
		}
		#board_wrap ul li span:nth-child(3) {
			display: inline-block;
		    padding-right:40px;
		}
		#board_wrap ul li span:nth-child(4) {
			display: inline-block;
		    padding-right:30px;
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
<title>커뮤니티_목록</title>
</head>
<body>
	<!-- 디자인 할 예정.. 날짜도 수정예정.. -->
	<!-- frontController에서 parameter를 못 받아왔을 시 리다이렉트로 파라미터를 가지고 온다 -->
	<c:if test="${empty articlePage}">
		<% RequestDispatcher rd = request.getRequestDispatcher("Write_Community.do");
		rd.forward(request, response); 
		System.out.print("redirect success"); %>
	</c:if>
	
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>커뮤니티</p></li>
			</ul>
       	</div>
       	
       	<div id = "wrap">
       		<div id = "category">
       		<form action="Category_Community.do" method="post">
       			<ul>
       				<li><input type="submit" name="category" value="자유" /></li>
       				<li><input type="submit" name="category" value="정보" /></li>
       				<li><input type="submit" name="category" value="QnA" /></li>
       				<li><input type="submit" name="category" value="리뷰" /></li>
       			</ul>
       			<!-- <ul>
       				<li><a class="menuLink" href="#">자유</a></li>
       				<li><a class="menuLink" href="#">정보</a></li>
       				<li><a class="menuLink" href="#">Q&A</a></li>
       				<li><a class="menuLink" href="#">리뷰</a></li>
       			</ul> -->
       		</form>
       		</div>
       		
       		<div id="btn">
       			<div id = "write_btn">
       				<button style="cursor:pointer;" onclick="location='Community_Write.jsp'">글쓰기</button>
       			</div>
       			<div id = "search">
       			<form action="Search_Community.do" method="post">
       					<input type = "text" name = "searchArea">
       					<button type = "submit"><img src = "../img/SearchButton.png"></button>
       			</form>
       			</div>
       		</div>
       		
       		<div id="board_wrap">
			    <table border="1">
			    	<tr>
			    		<td>번호</td>
			    		<td>제목</td>
			    		<td>작성자</td>
			    		<td>조회수</td>
			    		<td>작성일</td>
			    	</tr>
			    	<!-- articlePage 파라미터에 글이 없을 시에 출력 -->
			   		<c:if test="${articlePage.hasNoArticles()}">
			   			<tr>
			   				<td colspan="4"> 게시글이 없습니다. </td>
			   			</tr>
			   		</c:if>
			   		<!-- articlePage의 content 파라미터를 반복한다 -->
			   		<c:forEach var="article" items="${articlePage.content}">
			   			<tr>
			   				<td>${article.postNum}</td>
			   				<td><c:out value="${article.subject}"></c:out></td>
			   				<td>${article.userNickName}</td>
			   				<td>${article.views}</td>
			   				<td>${article.regDate}</td>
			   			</tr>
			   		</c:forEach>
			   		<!-- 게시판 이동 항목 -->
			   		<c:if test="${articlePage.hasArticles()}">
			   			<tr>
			   				<td colspan="5">
			   					<!-- 현재페이지가 5 이상일 시 이전 링크-->
			   					<c:if test="${articlePage.startPage > 5}">
			   					<a href="Write_Community.do?pageNo=${articlePage.startPage - 5}">[이전]</a>
			   					</c:if>
			   					<!-- startPage to endPage -->
			   					<c:forEach var="pNo" begin="${articlePage.startPage}" end="${articlePage.endPage}">
			   					<a href="Write_Community.do?pageNo=${pNo}">[${pNo}]</a>
			   					</c:forEach>
			   					<!-- endPage가 총페이지보다 작을 시에 다음 링크 -->
			   					<c:if test="${articlePage.endPage < articlePage.totalPages}">
			   					<a href="Write_Community.do?pageNo=${articlePage.startPage + 5 }">[다음]</a>
			   					</c:if>
			   				</td>
			   			</tr>
			   		</c:if>
			    </table>
			</div>
			
			
       		<div id = "footer">
       
       		</div>
		</div>
	</div>
</body>
</html>