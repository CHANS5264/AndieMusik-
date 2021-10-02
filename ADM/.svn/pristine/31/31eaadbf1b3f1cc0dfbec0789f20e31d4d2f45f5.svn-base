<%@page import="adm.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<%
	String memid = (String)request.getAttribute("mem_id");
	String memname = (String)request.getAttribute("mem_name");
	String memmail = (String)request.getAttribute("mem_mail");

%>
<body>

   <div class="w3-content w3-container w3-margin-top">
		<div class="w3-container w3-card-4 w3-auto" style="width: 382px;height: 450px;">
			<div class="w3-center w3-large w3-margin-top">
				<h3>아이디 찾기</h3>
			</div>
			<div>
				<p>
					<label>이름</label>
					<input class="w3-input" type="text" id="name" name="mem_name" placeholder="회원가입한 이름을 입력하세요" required>
				</p>
				<p>
					<label>이메일</label>
					<input class="w3-input" type="text" id="mail" name="mem_mail" placeholder="회원가입한 이메일주소를 입력하세요" required>
				</p>
				<p class="w3-center">
					<button type="button" id="search" name="search"  class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">찾기</button>
					<button type="button" onclick="history.go(-1);" class="w3-button w3-hover-white w3-ripple w3-margin-top w3-round mybtn">취소</button>
				</p>
			</div>
		</div>
	</div>
</body>
</html>

