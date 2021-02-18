<!-- 게시글 textarea 출력시 필요한 커스텀태그 기능 -->
<%@ tag body-content="empty" pageEncoding="utf-8" %>
<%@ tag trimDirectiveWhitespaces="true" %>
<%@ attribute name="value" type="java.lang.String" required="true"%>
<%
	value = value.replace("&", "&amp;");
	value = value.replace("<", "&lt;");
	value = value.replace(" ", "&nbsp;");
	value = value.replace("\n", "\n<br>");
%>
<%= value %>