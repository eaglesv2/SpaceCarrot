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
			<td>ȸ����ȣ</td>
			<td><input type = "text" name = "userserial"></td>
		</tr>
		<tr>
			<td>�̸�</td>
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
			<td>����</td>
			<td><input type = "text" name = "usergender"></td>
		</tr>
		<tr>
			<td>����</td>
			<td><input type = "date" name = "userbirth"></td>
		</tr>
		<tr>
			<td>��ȭ��ȣ</td>
			<td><input type = "tel" name = "usertel"></td>
		</tr>
		<tr>
			<td colspan = 2 align = center> <input type = "submit" value = "�߰�"></td>
		</tr>
	</table>
</form>
</body>
</html>