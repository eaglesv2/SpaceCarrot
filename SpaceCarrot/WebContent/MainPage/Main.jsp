<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
            $("#footer").load("../Base/footer.html");
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
                    <li><a href="../view.board/Board_Commerce_List_Fashion.jsp"><img src="../img/CommerceBanner.jpg" alt=""></a></li>
                    <li><a href="../view.community/Community_List.jsp"><img src="../img/CommunityBanner.jpg" alt=""></a></li>
                    <li><a href="../view.eat/EatPlace_List.html"><img src="../img/FoodBanner.jpg" alt=""></a></li>
                </ul>
            </div>
            <div id="content2">             
                    <div id="tableset">
                    <table id="lefttable">
                        <tr>
                            <th><h1><a href="">공지사항</a></h1></th>
                        </tr>
                        
                        <tr>
                            <td>게시글1</td>
                        </tr>
                        <tr>
                            <td>게시글1</td>
                        </tr>
                        <tr>
                            <td>게시글1</td>
                        </tr>
                        <tr>
                            <td>게시글1</td>
                        </tr>
                        <tr id="end-tr">
                            <td>게시글1</td>
                        </tr>
                    </table>
                <!-- 여기에는 공지사항 -->
                <!-- 밑에는 카테고리1 -->
                    <table id="centertable">
                        <tr>
                            <th><h1><a href="">커뮤니티 최신글</a></h1></th>
                        </tr>
                    <c:forEach var="article" items="${community_VO}">
                        <tr>
                            <td><a href="Read_Community.do?no=${article.postNum}">${article.subject}</a></td>
                        </tr>
                        <!-- <tr>
                            <td>게시글1</td>
                        </tr>
                        <tr>
                            <td>게시글1</td>
                        </tr>
                        <tr>
                            <td>게시글1</td>
                        </tr>
                        <tr id="end-tr">
                            <td>게시글1</td>
                        </tr> -->
                    </c:forEach>
                    </table>
                
                <!-- 여기는 커뮤니티 카테고리2 -->
                    <table id="righttable">
                        <tr>
                            <th><h1><a href="">커뮤니티 인기글</a></h1></th>
                        </tr>
                        
                        <tr>
                            <td>게시글1</td>
                        </tr>
                        <tr>
                            <td>게시글1</td>
                        </tr>
                        <tr>
                            <td>게시글1</td>
                        </tr>
                        <tr>
                            <td>게시글1</td>
                        </tr>
                        <tr id="end-tr">
                            <td>게시글1</td>
                        </tr>
                    </table>
                </div>
                
            </div>
            <div id="content3">
                <div id="con-title">
                    <a href="../view.see/SeePlace_List.html"><h2>볼거리</h2></a>
                    <p><a href="../view.see/SeePlace_List.html">+더보기</a></p>
               </div>
                <div id="cardset">
                    <div class="card">
                        <a href="../view.see/seeplace1.html"><img src="../img/SeePlace_img1.jpg" alt="쌈지길 대표 이미지">
                        <h2>쌈지길</h2></a>
                    </div>
                    <div class="card">
                        <a href="../view.see/seeplace2.html"><img src="../img/SeePlace_img2.jpg" alt="북촌한옥마을 대표 이미지">
                        <h2>북촌한옥마을</h2></a>
                    </div>
                    <div class="card">
                        <a href="../view.see/seeplace3.html"><img src="../img/SeePlace_img3.jpg" alt="백사실계곡 대표 이미지">
                        <h2>백사실계곡</h2></a>
                    </div>
                    <div class="card">
                        <a href="../view.see/seeplace4.html"><img src="../img/SeePlace_img4_1.JPG" alt="서울역사박물관 대표 이미지">
                        <h2>서울역사박물관</h2></a>
                    </div>
                </div>
            </div>
 
            <div id="content4">
                <div id="con-title">
                    <a href="../view.eat/EatPlace_List.html"><h2>먹거리</h2></a>
                    <p><a href="../view.eat/EatPlace_List.html">+더보기</a></p>
               </div>
                <div id="cardset">
                    <div class="card">
                        <a href="../view.eat/eatplace1.html"><img src="../img/eatplace_img1.jpg" alt="쏘핫 대표 이미지">
                            <h2>쏘핫</h2></a>
                    </div>
                    <div class="card">
                        <a href="../view.eat/eatplace1.html"><img src="../img/eatplace_img2.jpg" alt="광장시장 대표 이미지">
                            <h2>광장시장</h2></a>
                    </div>
                    <div class="card">
                        <a href="../view.eat/eatplace1.html"><img src="../img/eatplace_img3.jpg" alt="호두나무카페 대표 이미지">
                            <h2>호두나무카페</h2></a>
                    </div>
                    <div class="card">
                        <a href="../view.eat/eatplace1.html"><img src="../img/eatplace_img4.jpg" alt="성곡미술관찻집 대표 이미지">
                            <h2>성곡미술관찻집</h2></a>
                    </div>
                </div>
            </div>
            <div id="content5">
                <div id="con-title">
                    <a href=""><h2>중고거래</h2></a>
                    <p><a href="">+더보기</a></p>
               </div>
                <div id="cardset">
                    <div class="card">
                        <img src="../img/AttractionsBanner.jpg" alt="">
                        <h2>제목</h2>
                        <p>가격</p>
                    </div>
                    <div class="card">
                        <img src="../img/AttractionsBanner.jpg" alt="">
                        <h2>제목</h2>
                        <p>가격</p>
                    </div>
                    <div class="card">
                        <img src="../img/AttractionsBanner.jpg" alt="">
                        <h2>제목</h2>
                        <p>가격</p>
                    </div>
                    <div class="card">
                        <img src="../img/AttractionsBanner.jpg" alt="">
                        <h2>제목</h2>
                        <p>가격</p>
                    </div>
                </div>

            </div>
    
            <div id="footer">

            </div>
        </div>
    </div>
</body>
</html>