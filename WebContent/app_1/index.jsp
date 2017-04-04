<%@page import="java.io.Console"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		//1.若可以获取到请求参数loginName,则打印欢迎信息，把登录信息存入cookie中，
		//并设置cookie时限30s 的说法是否
		String name = request.getParameter("name");
		if (name != null && !name.trim().equals("")) {

			Cookie cookie = new Cookie("name", name);
			cookie.setMaxAge(30);
			response.addCookie(cookie);
		    System.out.println(1);
		} else {
			Cookie[] cookies = request.getCookies();
			if (cookies != null && cookies.length > 0) {
				for (Cookie cookie : cookies) {
					String cookieName = cookie.getName();
					if ("name".equals(cookieName)) {
						String val = cookie.getValue();
						name = val;
						System.out.println(2);
					}
				}
			}

		}
		if(name!=null&&!name.trim().equals("")){
			out.print("Hello"+name);
			
		}else{
			response.sendRedirect("login.jsp");
		}

		//2.从cookie中读取用户信息，若存在则打印
		//3.两者都没有，则重定向到login.jsp
	%>
</body>
</html>