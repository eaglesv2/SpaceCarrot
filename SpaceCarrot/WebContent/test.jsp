<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action = "DBInsert" method = "post">
	<table border = 2>
		<tr>
			<td>회원번호</td>
			<td><input type = "text" name = "userserial"></td>
		</tr>
		<tr>
			<td>이름</td>
			<td><input type = "text" name = "username"></td>
		</tr>
		<tr>
			<td>ID</td>
			<td><input type = "text" name = "userid"></td>
		</tr>
		<tr>
			<td>PW</td>
			<td><input type = "password" name = "userpw"></td>
		</tr>
		<tr>
			<td>성별</td>
			<td><input type = "text" name = "usergender"></td>
		</tr>
		<tr>
			<td>생일</td>
			<td><input type = "date" name = "userbirth"></td>
		</tr>
		<tr>
			<td>전화번호</td>
			<td><input type = "tel" name = "usertel"></td>
		</tr>
		<tr>
			<td colspan = 2 align = center> <input type = "submit" value = "추가"></td>
		</tr>
	</table>
</form>
</body>
</html>