<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<a href=book.jsp?book=java>Java</a>
	<a href=book.jsp?book=oracle>Oracle</a>
	<a href=book.jsp?book=android>Android</a>
	<a href=book.jsp?book=javaee>JavaEE</a>
	<a href=book.jsp?book=git>Git</a>
	<%
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				String cookieName = cookie.getName();
				if (cookieName.startsWith("book_")) {
	%>
	<br><br>
	<%
	     
		out.print(cookie.getValue()+"  ");

				}
			}
		}
	%>
</body>
</html>