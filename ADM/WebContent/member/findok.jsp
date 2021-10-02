<%@page import="adm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src="http://code.jquery.com/jquery-latest.js"></script>
<title>아이디 정보</title>
<style>
.mybtn {
	width: 150px;
	height: 40px;
	padding: 0;
	display: inline;
	border-radius: 4px;
	background: #212529;
	color: #fff;
	margin-top: 20px;
	border: solid 2px #212529;
	transition: all 0.5s ease-in-out 0s;
}

.mybtn:hover .mybtn:focus {
	background: white;
	color: #212529;
	text-decoration: none;
}
#findBtn{
	width: 350px;
}
#cancel{
	width: 350px;
}
#aa{
	text-decoration: none;
}
</style>
</head>
<%	
	

	String memid = request.getParameter("mem_id");
	String memname = request.getParameter("mem_name");
	String memmail = request.getParameter("mem_mail");
%>
<div class="w3-content w3-container w3-margin-top">
	<div class="w3-container w3-card-4 w3-auto"
		style="width: 382px; height: 480px;">
		<div class="w3-center w3-large w3-margin-top">
		<%if(!memid.equals("")){ %>
			<h3><%=memname %>님의 아이디는</h3>
		</div>
		
		<div>
			<h2><%=memid %>입니다</h2>
			<p> <%}else{%></p>
			<p><%=memname %>님!</p>
			<h1>가입정보가 없습니다.</h1>
		</div>
		
			<%} %>
		<button type="button" id="findBtn" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn"><a id="aa" href="login.jsp">로그인</a></button>
		<button type="button" id="cancel"onclick="history.go(-1);" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">취소</button>
		</div>
	</div>
</html>

