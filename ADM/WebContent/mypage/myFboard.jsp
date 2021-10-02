<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
  <link rel = "stylesheet" href = "<%=request.getContextPath()%>/css/mypage.css">
</head>
<body>
<jsp:include page="../include.jsp" flush="false"/>

	<div id = "par">
		
		<div id = "nav">
		
			<div id = "perfdate">
		  		<h2>공연 일정</h2>
		  	</div>
		  	
			<div class="list-group">
				<a href="<%=request.getContextPath()%>/" class="list-group-item">개인 정보 변경</a>
				<a href="<%=request.getContextPath()%>/" class="list-group-item">예매 내역 확인</a>
				<a href="<%=request.getContextPath()%>/" class="list-group-item">My Q&A</a>
				<a href="<%=request.getContextPath()%>/" class="list-group-item">회원 탈퇴</a>
			</div>
		</div>
		
		<div class = "pad"></div>
		
		<div id = "content">
		<!-- 여기가 리스트 불러올 공간 -->
		</div>
		
		<div class = "pad"></div>
		
		<div id = "end"></div>
		
		
	</div>
</body>
</html>













