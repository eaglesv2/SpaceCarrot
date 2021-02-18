<%@page import="spacecarrotVO.SpaceCarrotVO_Board_Community"%>
<%@page import="java.util.List"%>
<%@page import="spacecarrotDAO.SpaceCarrotDAO_Board_Community"%>
<%@page import="spacecarrotDBConn.SpaceCarrotDBConn"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- frontController에서 parameter를 못 받아왔을 시 리다이렉트로 파라미터를 가지고 온다 -->
<!-- 이것때문인지 모르겠는데 화면 넘길때 잡음? 잡화면이 생김 -->
<!-- 막 움직일 시 500오류 뜸 -->
<c:if test="${empty articlePage}">
	<% RequestDispatcher rd = request.getRequestDispatcher("Reset_Community.do");
	rd.forward(request, response);
	System.out.print("redirect success"); %>
</c:if>
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
              width : 100%;
              text-align : center;
              margin-top: 20px;
            } 
      /* 카테고리 메뉴 */
      #category { height : 40px;
      }   
      #category ul { height : 40px; 
      			     padding : 0;
      			     margin-left: 340px;
      			   }    
      #category ul li { list-style : none;
                    	color : #000000;
                   		float : left;
                    	text-align: center;
                    	padding-right :70px;
                 	  }
      #category ul li input { height : 30px;
      						font-size: 11.5pt;
      						background-color: white;
      						font-style: bold;
      						border: 1px solid white;
      }
      
                          
      /* 글쓰기버튼 + 검색창 */
      #btn {
      	margin-top:15px;
      	margin-bottom:60px;
      	margin-left: 160px;
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
				  	  text-align: left;
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
       #board_wrap { width: 1080px;
       				 margin-top: 125px;
       				 vertical-align: center;
       				 text-align: center;
       				 margin-left: 50px;
    				 }
       table { border : 2px solid black;
       }
       th { border : 2px solid black; 
       		height : 30px;
       		vertical-align: middle;
       		color: #fff;
  			background: #e7708d;}
       td { border : 2px solid black; 
       		height : 30px;
       		vertical-align: middle;
       }
       col { }
 	   
 	   tr:nth-child(2n-1) {	
			background: #fdf3f5;
		}
 	   
       
       
</style>
</head>
<meta charset="UTF-8">
<title>커뮤니티_목록</title>
</head>
<body>
	
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><a href="Community_List.jsp"><p>커뮤니티</p></a></li>
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
			    <table>
			    	<colgroup>
			    		<col width="100px">
			    		<col width="600px">
			    		<col width="100px">
			    		<col width="100px">
			    		<col width="100px">
			    	</colgroup>
			    	<tr>
			    		<th>번호</th>
			    		<th>제목</th>
			    		<th>작성자</th>
			    		<th>조회수</th>
			    		<th>작성일</th>
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
			   				<td><a href="Read_Community.do?no=${article.postNum}&pageNo=${articlePage.currentPage}"><c:out value="${article.subject}"></c:out></a></td>
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
			   					<a href="Reset_Community.do?pageNo=${articlePage.startPage - 5}">[이전]</a>
			   					</c:if>
			   					<!-- startPage to endPage -->
			   					<c:forEach var="pNo" begin="${articlePage.startPage}" end="${articlePage.endPage}">
			   					<a href="Reset_Community.do?pageNo=${pNo}">[${pNo}]</a>
			   					</c:forEach>
			   					<!-- endPage가 총페이지보다 작을 시에 다음 링크 -->
			   					<c:if test="${articlePage.endPage < articlePage.totalPages}">
			   					<a href="Reset_Community.do?pageNo=${articlePage.startPage + 5 }">[다음]</a>
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