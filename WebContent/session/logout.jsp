<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
</head>
<body>


	SessionId
	<%=session.getId()%>
	<br>
	<br> IsNew
	<%=session.isNew()%>
	<br>
	<br> MaxInactivInterval
	<%=session.getMaxInactiveInterval()%>
	<br>
	<br> LastAccessTime
	<%=session.getLastAccessedTime()%>
	<br>
	<br> CreateTime
	<%=session.getCreationTime()%>
	<br>
	<br> Hello:<%=session.getAttribute("username")%>
	<br>
	<br>
	Bye:<%=session.getAttribute("username") %>
	
	<%session.invalidate(); %>
	<a href="login.jsp">Return</a>
</body>
</html>