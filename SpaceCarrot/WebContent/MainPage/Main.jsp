<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="../MainPage/main.css">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <link rel="stylesheet" href="../Base/reset.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>

    <script>
        $(document).ready(function(){
            var main = $('.bxslider').bxSlider({
                mode: 'fade',
                auto:true,
                controls:true,
                speed:500,
                touchEnabled : (navigator.maxTouchPoints > 0)

            })
        });
        $(document).ready(function(){    
            $("#header").load("../Base/Header.jsp");
            
        })
        
      </script>
    <title>우주당근</title>
</head>
<body>
<c:if test="${empty community_VO}">
   <% RequestDispatcher rd = request.getRequestDispatcher("Reset_Main.do");
   rd.forward(request, response);
   System.out.print("redirect success"); %>
</c:if>
<%-- <% String id = (String)session.getAttribute("sessionID"); 
	System.out.print(id);%> --%>

    <div id="container">
        <div id="containerwrap">
            <div id="header">

            </div>
            <div id="content1">
                <ul class="bxslider">
                    <li><a href="../view.see/SeePlace_List.html"><img src="../img/AttractionsBanner.jpg" alt=""></a></li>
                    <li><a href="../view.board/Board_Commerce_List.jsp"><img src="../img/CommerceBanner.jpg" alt=""></a></li>
                    <li><a href="../view.community/Community_List_Default.jsp"><img src="../img/CommunityBanner.jpg" alt=""></a></li>
                    <li><a href="../view.eat/EatPlace_List.html"><img src="../img/FoodBanner.jpg" alt=""></a></li>
                </ul>
            </div>
            <div id="content2">             
                    <div id="tableset">
                    <table id="lefttable">
                        <tr>
                            <th><h1>공지사항</h1></th>
                        </tr>
                        
                        <tr>
                            <td><a href="../view.notice/Notice1.html">개인정보 처리방침 개정안내</a></td>
                        </tr>
                        <tr>
                            <td><a href="../view.notice/Notice2.html">[이벤트] 중고물품 올리면 이모티콘 100% 지급!</a></td>
                        </tr>
                        <tr>
                            <td><a href="../view.notice/Notice5.html">[설문] 내 기억 속 ‘특별한 구매자’는?</a></td>
                        </tr>
                        <tr>
                            <td><a href="../view.notice/Notice4.html">[긴급공지] 피싱 사이트를 주의하세요!(필독)</a></td>
                        </tr>
                        <tr id="end-tr">
                            <td><a href="../view.notice/Notice3.html">[완료] 2월 19일(금) 임시점검 안내</a></td>
                        </tr>
                    </table>
                <!-- 여기에는 공지사항 -->
                <!-- 밑에는 카테고리1 -->
                    <table id="centertable">
                        <tr>
                            <th><h1><a href="">커뮤니티 최신글</a></h1></th>
                        </tr>
                    <c:forEach var="community_article" items="${community_VO}">
                        <tr>
                            <td><a href="Read_Community.do?no=${community_article.postNum}">${community_article.subject}</a></td>
                        </tr>
                    </c:forEach>
                    </table>
                
                <!-- 여기는 커뮤니티 카테고리2 -->
                    <table id="righttable">
                        <tr>
                            <th><h1><a href="">커뮤니티 인기글</a></h1></th>
                        </tr>
                    <c:forEach var="community_Hotarticle" items="${communityHot_VO}">
                        <tr>
                            <td><a href="Read_Community.do?no=${community_Hotarticle.postNum}">${community_Hotarticle.subject}</a></td>
                        </tr>
                    </c:forEach>
                    </table>
                </div>
                
            </div>
            <div id="content3">
                <div id="con-title">
                    <h2><a href="../view.see/SeePlace_List.html">볼거리</a></h2>
                    <p><a href="../view.see/SeePlace_List.html">+더보기</a></p>
               </div>
                <div id="cardset">
                    <div class="card">
                        
                        <a href="../view.see/seeplace1.html"><img src="../img/SeePlace_img1.jpg" alt="쌈지길 대표 이미지"> </a>
                        <h2>쌈지길</h2>
                    </div>
                    <div class="card">
                        
                        <a href="../view.see/seeplace2.html"><img src="../img/SeePlace_img2.jpg" alt="북촌한옥마을 대표 이미지"></a>
                        <h2>북촌한옥마을</h2>
                    </div>
                    <div class="card">
                        
                        <a href="../view.see/seeplace3.html"><img src="../img/SeePlace_img3.jpg" alt="백사실계곡 대표 이미지"></a>
                        <h2>백사실계곡</h2>
                    </div>
                    <div class="card">
                        
                        <a href="../view.see/seeplace4.html"><img src="../img/SeePlace_img4_1.JPG" alt="서울역사박물관 대표 이미지"></a>
                     	<h2>서울역사박물관 </h2>
                    </div>
                </div>
            </div>
 
            <div id="content4">
                <div id="con-title">
                    <h2><a href="../view.eat/EatPlace_List.html">먹거리</a></h2>
                    <p><a href="../view.eat/EatPlace_List.html">+더보기</a></p>
               </div>
                <div id="cardset">
                    <div class="card">
                        
                        <a href="../view.eat/eatplace1.html"><img src="../img/eatplace_img1.jpg" alt="쏘핫 대표 이미지"></a>
                        <h2>쏘핫</h2>
                    </div>
                    <div class="card">
                        
                        <a href="../view.eat/eatplace2.html"><img src="../img/eatplace_img2.jpg" alt="광장시장 대표 이미지"> </a>
                      	<h2>광장시장  </h2>
                    </div>
                    <div class="card">
						
                         <a href="../view.eat/eatplace3.html"><img src="../img/eatplace_img3.jpg" alt="호두나무카페 대표 이미지"></a>
                      	 <h2>호두나무카페</h2>
                    </div>
                    <div class="card">
                        <a href="../view.eat/eatplace4.html"><img src="../img/eatplace_img4.jpg" alt="성곡미술관찻집 대표 이미지"></a>
						<h2>성곡미술관찻집</h2>
                    </div>
                </div>
            </div>
            <div id="content5">
                <div id="con-title">
                    <h2><a href="../view.board/Board_Commerce_List.jsp">중고거래</a></h2>
                    <p><a href="../view.board/Board_Commerce_List.jsp">+더보기</a></p>
                </div>
                <div id="cardset">
                <c:forEach var="commerce_article" items="${commerce_VO}">             
                    <div class="card">
                        <a href="Read_Commerce.do?no=${commerce_article.postNum}">
                        	<img src = "data:x-image/jpg;base64,${commerce_article.repImage}" >
                        </a>
                        <h2> 
                        	<a href="Read_Commerce.do?no=${commerce_article.postNum}">${commerce_article.subject}</a>
                        </h2>
                        <p><fmt:formatNumber value="${commerce_article.price}" pattern="#,###"/>원</p>
                    </div>
                </c:forEach>
                </div>
            </div>
            
      <div id="footer">
			<ul>
				<li><a href="../MainPage/Main.jsp"><img src = "../img/MainLogo.png" alt = "우주당근"></a></li>
				<li><p>(주)우주당근 대표이사 : 박재영 이준우 임승묵 임의정 정현수 정회승</p>
					<p>대표번호: 02-123-7777 | e-mail: spaceCarrot@xxxxxx.xxx</p>
					<p>Copyright ⓒ 2021 kt corp. all rights reserved</p></li>
			</ul>
            </div>
        </div>
    </div>
</body>
</html>