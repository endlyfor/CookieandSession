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
		//在JavaWeb规范使用Cookie类代表cookie
	
		//1.获取Cookie
		Cookie[] cookies=request.getCookies();
		if(cookies!=null&&cookies.length>1){
			for(Cookie cookie2:cookies){
				out.print(cookie2.getName()+": "+cookie2.getValue());
				out.print("<br>");
			}
		}else{
			out.print("no cookie,create a new cookie");
			out.print("<br>");
			//1.创建cookie对象
			Cookie cookie=new Cookie("name","atguigu");
			cookie.setMaxAge(30);
			//2.调用response方法把cookie传给客户端
			response.addCookie(cookie);  
		
		}
	%>


</body>
</html>