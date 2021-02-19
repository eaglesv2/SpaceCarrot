<%@page import="spacecarrotDAO.SpaceCarrotDAO_UserInfo"%>
<%@page import="spacecarrotVO.SpaceCarrotVO_UserInfo"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../Base/reset.css" />
<script>        
	$(document).ready(function(){    
		$("#header").load("../Base/Header.jsp");
		$("#footer").load("../Base/footer.html");
		
		//닉네임 정규식 + 중복체크
		$("input[name=nickname]").blur(function() {
			var nickname = $("input[name=nickname]").val();
			var idReg = /^[a-z0-9_]*$/;
			
			$.ajax({ 
				type: 'POST',
				url: 'nicknameOverLapCheck.do',
				data: { nickname : nickname },
				
				success: function(result) {
					if(result == 1) {
						$("#nickname_check").text("사용 가능한 닉네임입니다.");
						$("#nickname_check").css("color","lime");
						$(".nicknamecheck").val("1");
					} else if(result == 0) {
						$("#nickname_check").text("이미 사용중인 닉네임입니다.");
						$("#nickname_check").css( "color","red");
						$(".nicknamecheck").val("0");
					} else if(result == -1) {
						$("#nickname_check").text("");
						$(".nicknamecheck").val("0");
					} else if(result == -2) {
						$("#nickname_check").text("닉네임은 한글, 영문, 숫자를 혼합하여 입력해주세요.");
						$("#nickname_check").css("color","red");
						$(".nicknamecheck").val("0");
					} else if(result == -3) {
						$("#nickname_check").text("닉네임은 2~6자로 입력해주세요.");
						$("#nickname_check").css("color","red");
						$(".nicknamecheck").val("0");
					}
				}
			})
		})
		
		
		
		//비밀번호 정규식
		$("input[name=pw]").blur(function() {
			var pw = $("input[name=pw]").val();
			var pwReg =  /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&+=]).{6,15}$/;
			
			if(pw == "") { 
				$("#standard_pw_check").text("");
				$(".pwCheck2").val("0");
			} else if(pw.length < 6 || pw.length > 15) {
				$("#standard_pw_check").text("비밀번호는 6~15자로 입력해주세요.");
				$("#standard_pw_check").css("color","red");
				$(".pwCheck2").val("0");
			} else if (pw.search(/\s/) != -1) {
				$("#standard_pw_check").text("비밀번호는 공백 없이 입력해주세요");
				$("#standard_pw_check").css("color","red");
				$(".pwCheck2").val("0");
			} else if (!pwReg.test(pw)) {
				$("#standard_pw_check").html("비밀번호는 영문, 숫자, 특수문자를 혼합하여 입력해주세요. <br> 특수문자는 ' ! @ # $ % ^ & + ='만 사용할 수 있습니다.");
				$("#standard_pw_check").css("color","red");
				$(".pwCheck2").val("0");
			} else {
				$("#standard_pw_check").text("사용 가능한 비밀번호입니다.");
				$("#standard_pw_check").css("color","lime");
				$(".pwCheck2").val("1");
			}
		})
		
		//비밀번호 확인란 일치 여부
		$("input[name=pwcheck]").blur(function() { //입력칸 비어있으면 안나오게,,
			
			if($("input[name=pw]").val() == $("input[name=pwcheck]").val()) {
				$("#pw_check").text("비밀번호가 일치합니다.");
				$("#pw_check").css("color","lime");
				$(".pwCheck2").val("1");
			} else {
				$("#pw_check").text("비밀번호가 서로 일치하지 않습니다.");
				$("#pw_check").css("color","red");
				$(".pwCheck2").val("0");
			}
			if($("input[name=pw]").val() == "" || $("input[name=pwcheck]").val() == "") {
				$("#pw_check").text("");
				$(".pwCheck2").val("0");
			}
		})
		
		//전화번호 정규식 //입력칸 비어있으면 안나오게,,
		$("input[name=tel]").blur(function() {
			var tel = $("input[name=tel]").val();
			var telReg =  /^\d{3}-\d{4}-\d{4}$/;
			
			if(tel == "") {
				$("#tel_check").text("");
				$(".telcheck").val("0");
			} else if(telReg.test(tel)) {
				$("#tel_check").text("");
				$(".telcheck").val("1");
			} else {
				$("#tel_check").html("전화번호 형식을 맞춰주세요.");
				$("#tel_check").css("color","red");
				$(".telcheck").val("0");
			}
		})
		
		
		function checkSubmit() {
			var idCheck = $(".idCheck");
		    var pwCheck = $(".pwCheck2");
		    var nicknamecheck = $(".nicknamecheck");
		    var telCheck = $(".telcheck");
		    var flag = false;
		    
		    if(idCheck.val() == '1') {
		    	flag = true;
		    } else {
		    	flag = false;
		    }
		    if(pwCheck.val() == '1') {
		    	flag = true;
		    } else {
		    	flag = false;
		    }
		    if(nicknamecheck.val() == '1') {
		    	flag = true;
	    	} else {
	    		flag = false;
	    	}
	    	if(telCheck.val() == '1') {
			    flag = true;
			} else {
			    flag = false;
			}	
	    	
		    if(flag == false){
		    	$("#submit").attr("disabled", true);
		    } else {
		    	$("#submit").attr("disabled", false);
		    }
		}
	})
	
	
</script>
<style>
	#container { margin : 0 auto;
                 width : 1080px;
               }
               
	  /* 마이페이지 타이틀 */
    #title ul li { list-style: none; }
    .title_wrap { text-align: center;
    			  margin-bottom: 30px;
     }
	.title_wrap p { color: #fff; 
				  	background-color: #fc585e; 
				  	padding : 25px 0px;
				  	font-size : 16pt;
				  	font-weight: bold; 
				  	display: block; 
				 	margin: 0 auto;
				  }

	/* 카테고리 메뉴 */
      #category { height : 20px;
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
      /* #category .menuLink:hover { text-decoration : underline; 
                           text-underline-position : under;
                          } */
                          
      .my_info_tab:after { content: "";
      					display: block;
      					width: 100px;
      				    text-align: center;
      		  		    border-bottom : 2px solid #000;
      					margin-top: 8px;
      				  } 
	
	/* 경고문 */
	#care { font-size: 13pt;
			background-color: #000000;
			color: #ffffff;
			font-weight: bold;
			margin-top: 20px;
			margin-left: 360px;
			margin-bottom: 20px;
			padding-left: 8px;
			padding-top: 10px;
			vertical-align: middle;
			width: 370px;
			height: 30px;
	
	}
	
	/* 개인 정보 수정 폼 */
    #update_form { margin : 0 auto;
              	   width : 715px;
              	   text-align : center;
             	   margin-left : 320px;
    		     }
    #update_form table { border-spacing: 0;
    				     border-collapse: separate;
    				     margin: 0;
    				     padding: 0; 
    				     border: 0;
    				   }
    
	#update_form table input { border: 1px solid #ececec;
							 font-size: 12pt;
							 color: #4c4c4c; 
							 height: 30px; 
							 padding: 10px; 
							 width: 300px; 
						   }
 
    #update_form table th { text-align : center; }
   	#update_form table th span { color: #404040;
   							   font-size: 15px; 
   							   display: inline-block; 
   							   padding: 0 20px 0 0;
   							   font-weight:bold; 
   							  }
   	#update_form table th span:after { content: "*";
   									 font-size: 13px;
   									 color: #f95427;
   									 position: absolute;
   									 top: 0;
   									 right: 0;
   								   }
   	#update_form table td { padding: 6px 0;
   						  position: relative;
   						}
   	
   	#update_form table .fixed { border: 0px;
   								outline: none;
							 	font-size: 12pt;
							 	color: #000; 
							 	height: 30px; 
								padding: 10px; 
								width: 300px; 
   							  }
   	
   	#update_form table .check { padding : 0px; height: 0px; font-size: 11pt; border-spacing: 0px;}
   	
   	.tel { text-align:left;
   		   /* border-collapse: separate; */
   		   border-spacing: 0;
   	}
   	
   	/* 버튼 */
   	#btn { margin-left : 80px; }
    #btn ul li { list-style: none; }

	.complete_btn_wrap { text-align: center; 
			   			 margin: 20px 30px 30px;
			   			 float: left;
			  		   }
	.complete_btn_wrap button { color: #fff; 
				  		   		background-color: #fc585e;
				  		   		border: 3px solid #fc585e; 
				  		   		font-size: 12pt;
				 		   		font-weight: bold; 
				  		   		padding: 10px;  
				 		   		height: 56px; 
				  		   		vertical-align: middle;
				 		  		width: 100px; 
				  		  		display: block; 
				 		   		text-align: center; 
				 		  		margin: 0 auto;
				 		  		cursor: pointer;
				 		 	  }
	.cancel_btn_wrap { text-align: center; 
			   		   margin: 20px 0 30px;
			   		   float: left;
			   		  
			  		 }
	.cancel_btn_wrap button { color: #fc585e; 
				  		 	  background-color: #fff; 
				  			  border: 3px solid #fc585e;
				  			  font-size: 12pt;
				 			  font-weight: bold; 
				  	  		  padding: 10px;  
				 	     	  height: 56px; 
				  		 	  vertical-align: middle;
				 		 	  width: 100px; 
				  		 	  display: block; 
				 		 	  text-align: center; 
				 		 	  margin: 0 auto;
				 		 	  cursor: pointer;
				 			}
</style>

<title>마이페이지_수정_개인정보</title>
</head>
<body>
	<% String id = (String)session.getAttribute("sessionID");
	   SpaceCarrotVO_UserInfo scv = SpaceCarrotDAO_UserInfo.getInfo(id);
	%>
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>마이페이지</p></li>
			</ul>
       	</div>
       	
       	<div id = "category">
       		<ul>
       			<li class = "my_info_tab"><a class="menuLink" href="Mypage_Modify_My_Info.jsp">내 정보 수정</a></li>
       			<li><a class="menuLink" href="Mypage_List_Community.jsp">내가 올린 커뮤니티 글 수정</a></li>
       			<li><a class="menuLink" href="Mypage_List_Board_Commerce.jsp">내가 올린 중고거래 글 수정</a></li>
       		</ul>
       	</div>
     	<hr>
       	
       		<div id="care">
       			비밀번호, 전화번호, 닉네임만 변경 가능합니다
       		</div>
       		
       	<form action = "UserInfoUpdate.do" method = "post">
       	<div id = "update_form">
			<table>
              	<tbody>
					<tr>
						<th><span>아이디</span></th>
						<td >	
							<%-- <%=(String)session.getAttribute("sessionID") %> --%>
							<input type = "text" class="fixed" value = <%=(String)session.getAttribute("sessionID") %> name = "userID">
						</td>
                	</tr>
                	<tr>
                  		<th><span>비밀번호</span></th>
                  		<td><input type="password" value = <%= scv.getUserPW() %> name = "pw"></td>
                	</tr>
                	<tr>
                		<td class = "check" colspan = 2>
                			<div id = "standard_pw_check"></div>
                		</td>
                	</tr>
                	<tr>
                 		 <th><span>비밀번호 확인</span></th>
                  		<td><input type="password" placeholder="비밀번호를 확인하세요" name = "pwcheck"></td> <!-- 비밀번호 불일치시 수정 비활성 -->
               		 </tr>
               		 <tr>
                		<td class = "check" colspan = 2>
                			<div id = "pw_check"></div>
                		</td>
                	</tr>
                	 <tr>
                  		<th><span>닉네임</span></th>
                  		<td><input type="text" value = <%= scv.getUserNickName() %> name = "nickname"></td>
                	</tr>
                	 <tr>
                		<td class = "check" colspan = 2>
                			<div id = "nickname_check"></div>
                		</td>
                	</tr>
               		 <tr>
                 		 <th><span>전화번호</span></th>
                  		<td><input type="text" value = <%= scv.getUserTel() %> name = "tel"></td>
               		 </tr>
               		 <tr>
                		<td class = "check" colspan = 2>
                			<div id = "tel_check"></div>
                		</td>
                	</tr>
               		 <tr>
                  		<th><span>이름</span></th>
                  		<td> 
                  			<input type = "text" class="fixed" value = <%= scv.getUserName() %> name = "userID">
                  		</td>
                	</tr>
                	<tr>
                  		<th><span>성별</span></th>
                  		<td>
                  			<input type = "text" class="fixed" value = <%= scv.getUserGender() %> name = "userID">
                  		</td>
                	</tr>
                	<tr>
                 		 <th><span>생일</span></th>
                  		 <td>
                  		 	<input type = "text" class="fixed" value = <%= scv.getUserBirth() %>>
                  		 </td>
               		 </tr>
				</tbody>
			</table>		
        
        	<div id = "btn">
        		<ul>
					<li class = "complete_btn_wrap">
						<button id = "submit" type = "submit" disabled>수정</button>
					</li>
					<li class = "cancel_btn_wrap">
						<button type = "button" onclick = "location.href='../MainPage/Main.jsp'">취소</button>
					</li>
				</ul>
       		</div>
       	</div><!-- join_form E  -->
       	</form>
       	<div class="formCheck">
            <input type="hidden" name="idCheck" class="idCheck">
            <input type="hidden" name="pw2Check" class="pwCheck2">
            <input type="hidden" name="nicknamecheck" class="nicknamecheck">
            <input type="hidden" name="telcheck" class="telcheck">
        </div>
       	<div id = "footer">
       	
       	</div>
	</div>
</body>
</html>