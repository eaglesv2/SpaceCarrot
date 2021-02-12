<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<form action="testCommunityInsert" method="post" enctype="multipart/form-data">
<table border=2>
	<tr>
		<td>글제목</td>
		<td><input type="text" name="subject"/></td>
	</tr>
	<tr>
		<td>작성자</td>
		<td><input type="text" name="userid"/></td>
	</tr>
	<tr>
		<td>내용</td>
		<td><input type="text" name="content"/></td>
	</tr>
	<tr>
		<td>첨부파일</td>
		<td><input type="file" name="file"/></td>
	</tr>
	<tr>
		<td><input type="submit" value="kaja" /></td>
	</tr>
</table>
</form>
</body>
</html>