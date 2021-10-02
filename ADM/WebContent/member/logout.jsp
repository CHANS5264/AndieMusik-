<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<div class="logout">
	<div>
		<%=session.getAttribute("name") %>님이 로그인 되었습니다.
	</div>
</div>

</body>
</html>