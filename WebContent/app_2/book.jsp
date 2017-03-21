<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="java.util.LinkedList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h4>Book Details</h4>
	Book:
	<%=request.getParameter("book")%>
	<br>
	<br>
	<a href=books.jsp>Return</a>
	<%
		String book = request.getParameter("book");
		LinkedList<Cookie> list = new LinkedList<Cookie>();
		Cookie[] cookies = request.getCookies();
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				String cookieName = cookie.getName();
				if (cookieName.startsWith("book_")) {

					if (list.size() >= 2) {

						list.removeFirst();
						list.add(cookie);

					} else {
						System.out.println("jinru");
						list.add(cookie);

					}
					cookie.setMaxAge(0);
				}

			}
		
		}

		Cookie cookie = new Cookie("book_" + book, book);

		response.addCookie(cookie);
		System.out.println("listsize=" + list.size());
	%>
</body>
</html>