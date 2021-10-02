<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	String id = request.getParameter("memId");
	String pass = request.getParameter("memPass");
	
	request.setAttribute("memId", id);
	request.setAttribute("memPass", pass);
%>
</body>
</html>