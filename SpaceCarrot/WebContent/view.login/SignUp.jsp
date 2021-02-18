<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.1/jquery.min.js"></script>
<link rel="stylesheet" href="../Base/reset.css" />
<script type = "text/javascript">        
	$(document).ready(function(){    
		$("#header").load("../Base/header.html");
		$("#footer").load("../Base/footer.html");
		
		
		$("input[name=id]").blur(function() {
			var id = $("input[name=id]").val();
			var idReg = /^[a-z0-9_]*$/;
			
			//아이디 정규식
			/* if(id == "") { 
				$("#id_check").text("");
			} else if(!idReg.test(id)) {
				$("#id_check").text("아이디는 영문 소문자와 숫자를 혼합하여 입력해주세요.");
				$("#id_check").css("color","red");
			} else if(id.length < 5 || id.length > 15) {
				$("#id_check").text("아이디는 5~15자로 입력해주세요.");
				$("#id_check").css("color","red");	
			}  */
			
			//아이디 중복 검사
			$.ajax({ 
				type: 'POST',
				url: 'idOverLapCheck.do',
				data: { id : id },
				
				success: function(result) { //result 값 안넘어오는듯?
					if(result == 1) {
						$("#id_check").text("사용 가능한 아이디입니다.");
						$("#id_check").css("color","lime");
						$(".idCheck").val("1");
					} else if(result == 0) {
						$("#id_check").text("이미 사용중인 아이디입니다.");
						$("#id_check").css( "color","red");
					} else if(result == -1) {
						$("#id_check").text("");
					} else if(result == -2) {
						$("#id_check").text("아이디는 영문 소문자와 숫자를 혼합하여 입력해주세요.");
						$("#id_check").css("color","red");
					} else if(result == -3) {
						$("#id_check").text("아이디는 5~15자로 입력해주세요.");
						$("#id_check").css("color","red");	
					}
				}
			});				
		});
		
		
		
		//비밀번호 정규식
		$("input[name=pw]").blur(function() {
			var pw = $("input[name=pw]").val();
			var pwReg =  /^(?=.*[A-Za-z])(?=.*[0-9])(?=.*[!@#$%^&+=]).{6,15}$/;
			
			if(pw == "") { 
				$("#standard_pw_check").text("");
			} else if(pw.length < 6 || pw.length > 15) {
				$("#standard_pw_check").text("비밀번호는 6~15자로 입력해주세요.");
				$("#standard_pw_check").css("color","red");			
			} else if (pw.search(/\s/) != -1) {
				$("#standard_pw_check").text("비밀번호는 공백 없이 입력해주세요");
				$("#standard_pw_check").css("color","red");	
			} else if (!pwReg.test(pw)) {
				$("#standard_pw_check").html("비밀번호는 영문, 숫자, 특수문자를 혼합하여 입력해주세요. <br> 특수문자는 ' ! @ # $ % ^ & + ='만 사용할 수 있습니다.");
				$("#standard_pw_check").css("color","red");
				$("#standard_pw_check2").css("color","red");
			} else {
				$("#standard_pw_check").text("사용 가능한 비밀번호입니다.");
				$("#standard_pw_check").css("color","lime");
			}
		})
		
		//비밀번호 확인란 일치 여부
		$("input[name=pwcheck]").blur(function() {
			
			if($("input[name=pw]").val() == $("input[name=pwcheck]").val()) {
				$("#pw_check").text("비밀번호가 일치합니다.");
				$("#pw_check").css("color","lime");
				$("#submit").attr("disabled", false);
				$(".pwCheck2").val("1");
			} else {
				$("#pw_check").text("비밀번호가 서로 일치하지 않습니다.");
				$("#pw_check").css("color","red");
				$("#submit").attr("disabled", true);
			}
		})
		
		//전화번호 정규식
		var telReg =  /^01(?:0|1|[6-9])[.-]?(\\d{4})[.-]?(\\d{4})$/;
		
		function checkSubmit() {
			var idCheck = $(".idCheck");
		    var pwCheck2 = $(".pwCheck2");
		    
		    if(idCheck.val() == '1'){
		        res = true;
		    }else{
		        res = false;
		    }
		    if(pwCheck2.val() == '1'){
		        res = true;
		    }else{
		        res = false;
		    }
		    
		    if(res == false){
		        alert("회원가입 폼을 정확히 채워 주세요.");
		    }
		    return res;
		}
	});
		
</script>
<style>
	#container { margin : 0 auto;
                 width : 1080px;
               }
               
	  /* 회원가입 타이틀 */

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

	
    #join_form { margin : 0 auto;
              	 width : 715px;
              	 text-align : center;
              	 margin-top : 40px;
             	 margin-left : 350px;
    		   }
    #join_form table { border-spacing: 0;
    				   margin: 0;
    				   padding: 0; 
    				   border: 0;
    				 }
	#join_form table input { border: 1px solid #ececec;
							 font-size: 12pt;
							 color: #4c4c4c; 
							 height: 30px; 
							 padding: 10px; 
							 width: 300px; 
						   }
						   
	#join_form table input[type="radio"] { width: 15px; height: 15px; }	 
	#join_form table input[type="radio"]:checked { background: #f95427; }  
    #join_form table th { text-align : center; }
   	#join_form table th span { color: #404040;
   							   font-size: 15px; 
   							   display: inline-block; 
   							   padding: 0 20px 0 0; 
   							  }
   	#join_form table th span:after { content: "*";
   									 font-size: 13px;
   									 color: #f95427;
   									 position: absolute;
   									 top: 0;
   									 right: 0;
   								   }
   	#join_form table td { padding: 6px 0;
   						  position: relative;
   						}
   	#join_form table .check { padding : 0px; height: 0px; font-size: 11pt;}
   	
   	.gender { line-height : 30px; }
   	
   	#btn { margin-left : 50px; }
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

	.exform_txt{ padding:20px 0 10px 50px; 
				 text-align: left;
				 color: #9a9a9a;
				 font-size:13px;
			   }
	.exform_txt span{ display: inline-block;
					  position: relative; 
					  padding-left: 10px}
	.exform_txt span:after{ content: "*";
							position: absolute;
							left: 0;
							top: 0; 
							color: #f95427; 
							font-size: 13px; 
							font-weight: bold;}	 
</style>
<title>회원가입폼</title>
</head>
<body>
	<div id = "container">
        <div id = "header">

        </div>
       	
       	<div id = "title">
			<ul>
				<li class = "title_wrap"><p>회원가입</p></li>
			</ul>
       	</div>
       	
       	<form action = "UserInfoInsert.do" method = "post">
       	<div id = "join_form">
			<table>
              	<tbody>
					<tr>
						<th><span>아이디</span></th>
						<td><input type="text" placeholder="ID 를 입력하세요." id = "user_id" name = "id" required></td>
						
                	</tr>
                	<tr>
                		<td class = "check" colspan = 2>
                			<div id = "id_check"></div>
                		</td>
                	</tr>
                	<tr>
                  		<th><span>비밀번호</span></th>
                  		<td><input type="password" placeholder="비밀번호를 입력해주세요." id = "user_pw" name = "pw" required></td>
                	</tr>
                	 <tr>
                		<td class = "check" colspan = 2>
                			<div id = "standard_pw_check"></div>
                		</td>
                	</tr>
                	<tr>
                 		 <th><span>비밀번호 확인</span></th>
                  		<td><input type="password" placeholder="비밀번호를 확인하세요" name = "pwcheck" required></td>
               		 </tr>
               		 <tr>
                		<td class = "check" colspan = 2>
                			<div id = "pw_check"></div>
                		</td>
                	</tr>
               		 <tr>
                  		<th><span>이름</span></th>
                  		<td><input type="text" placeholder="" name = "name" required></td>
                	</tr>
                	 <tr>
                  		<th><span>닉네임</span></th>
                  		<td><input type="text" placeholder="" name = "nickname" required></td>
                	</tr>
                	<tr>
                  		<th><span>성별</span></th>
                  		<td class = "gender">
                  			<input type="radio" name = "gender" value = "F" required>여자 
                  			&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                  			<input type="radio" name = "gender" value = "M" required>남자
                  		</td>
                	</tr>
                	<tr>
                 		 <th><span>생일</span></th>
                  		 <td><input type="text" placeholder="ex) 1994-10-14" name = "birth" required></td>
               		 </tr>
               		 <tr>
                 		 <th><span>전화번호</span></th>
                  		<td><input type="text" placeholder="ex) 010-5402-6873" name = "tel" required></td>
               		 </tr>
				</tbody>
			</table>
            <div class="exform_txt">
            	<span>표시는 필수적으로 입력해주셔야 가입이 가능합니다.</span>
            </div>
		
        
        	<div id = "btn">
        		<ul>
					<li class = "complete_btn_wrap">
						<button id = "submit" type = "submit" onclick = "location.href='SignUpComplete.jsp'" disabled>완료</button>
					</li>
					<li class = "cancel_btn_wrap">
						<button type = "reset" onclick = "location.href='main.html'">취소</button>
					</li>
				</ul>
       		</div>
       	</div><!-- join_form E  -->
       	</form>
       	        <div class="formCheck">
            <input type="hidden" name="idCheck" class="idCheck">
            <input type="hidden" name="pw2Check" class="pwCheck2">
        </div>
       	<div id = "footer">
       	
       	</div>
	</div>
</body>
</html>