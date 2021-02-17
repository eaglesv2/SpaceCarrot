// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#user_id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $("#user_id").val();
		$.ajax({
			url : '${ pageContext.request.contextPath }/view.login/idCheck?userId=' + user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : " + data);							
				
				if (data == 1) {
					// 1 : 아이디가 중복되는 문구
					$("#id_check").text("이미 사용중인 아이디입니다");
					$("#id_check").css("color", "red");
					$("#reg_submit").attr("disabled", true);
				} else {
					if(idJ.test(user_id)){
						// 0 : 아이디 길이 / 문자열 검사
						$("#id_check").text("사용 가능한 아이디입니다");
						$("#id_check").css("color", "green");
						$("#reg_submit").attr("disabled", false);			
						} else if(user_id == "") {							
							$("#id_check").text("아이디를 입력해주세요");
							$("#id_check").css("color", "red");
							$("#reg_submit").attr("disabled", true);										
						} else {	
							$("#id_check").text("아이디는 소문자와 숫자 4~12자리만 가능합니다");
							$("#id_check").css("color", "red");
							$("#reg_submit").attr("disabled", true);
						}
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
// 비밀번호 확인란 검사
	$("#user_pw").blur(function() {
		if($("input[name=pw]").val() == $("input[name=pwcheck]").val()) {
			$("#pw_check").text("비밀번호가 일치합니다.");
			$("#pw_check").css("color","green");
			/*$("#reg_submit").attr("disabled", false);*/
		} else {
			$("#pw_check").text("비밀번호가 일치하지 않습니다.");
			$("#pw_check").css("color","red");
			/*$("#reg_submit").attr("disabled", true);*/
		}
	});