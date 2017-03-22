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
		//将cookie添加到链表，链表长度最大为2，如果超过2，删除链首，增加链尾
		//如果新增的cookie和原cookie有重复的，不需要删除链首，直接在链尾增加。
		//链表的各个索引指向地址，当cookie改变时，链表里的内容也改变。
		//cookie名字若重复，新来的会覆盖原来的。
		if (cookies != null && cookies.length > 0) {
			for (Cookie cookie : cookies) {
				String cookieName = cookie.getName();
				if (cookieName.startsWith("book_")) {
					//cookie.setMaxAge(0);
					//response.addCookie(cookie);
					if (list.size() >= 2) {
						if (book.equals(cookies[0].getValue())||
								book.equals(cookies[1].getValue())||
								  book.equals(cookies[2].getValue())) {
							list.add(cookie);
						} else {
							list.getFirst().setMaxAge(0);
							response.addCookie(list.getFirst());
							//list.removeFirst();（不需要这个，当第一个cookie实质上删除后，链表第一个也自动消失）
							list.add(cookie);
						}

					} else {
						System.out.println("jinru");
						list.add(cookie);

					}

				}

			}

		}

		Cookie cookie = new Cookie("book_" + book, book);

		response.addCookie(cookie);
		System.out.println("listsize=" + list.size());
	%>
</body>
</html>