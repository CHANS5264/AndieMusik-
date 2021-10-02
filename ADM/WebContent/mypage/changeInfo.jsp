<%@page import="adm.vo.MemberVO"%>
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
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
  <script src="<%=request.getContextPath() %>/js/jquery.serializejson.min.js"></script>
  <link rel = "stylesheet" href = "<%=request.getContextPath()%>/css/mypage.css">
  <script src="<%=request.getContextPath() %>/js/memberUpdate.js"></script>
  <script src="<%=request.getContextPath() %>/js/memberReg.js"></script>
</head>
<body>
<%
	MemberVO vo = (MemberVO)session.getAttribute("memberInfo");
%>
<jsp:include page="../include.jsp" flush="false"/>

	<div id = "par">
		
		<div id = "nav">
		
			
		  	
			<div class="list-group">
				<a href="mypageIndex.jsp" class="list-group-item">마이 페이지</a>
				<a href="<%=request.getContextPath()%>/" class="list-group-item">예매 내역 확인</a>
				<a href="<%=request.getContextPath()%>/" class="list-group-item">My Q&A</a>
				<a href="<%=request.getContextPath()%>/" class="list-group-item">My 자유게시판</a>
				<a href="<%=request.getContextPath()%>/" class="list-group-item">회원 탈퇴</a>
			</div>
		</div>
		
		<div class = "pad"></div>
		
		<div id = "content">
		
						<form class="form-horizontal" onsubmit="return false">
				  
				  <h2 style = "text-align: center;">개인 정보 변경</h2>
				  
				  	<div class="form-group">
				      <label class="control-label col-sm-2" for="id">아이디</label>
				      <div class="col-sm-6">
				        <input type="text" class="form-control" id="id"  name="mem_id" value = "<%=vo.getMem_id()%>" readonly>
				      </div>
				     
				        <span class="sp"></span>
				    </div>
				    
				    <div class="form-group">
				        <label class="control-label col-sm-2" for="name">이름</label>
				        <span class="sp"></span>
				      <div class="col-sm-6">
				        <input type="text" class="form-control" id="name"  name="mem_name" value = "<%=vo.getMem_name()%>">
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="bir">생년월일</label>
				        <span class="sp"></span>
				      <div class="col-sm-6">
				        <input type="date" class="form-control" id="bir"  name="mem_bir" value = "<%=vo.getMem_bir().substring(0,10)%>">
				    </div>
				      </div>
				      
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="pwd">비밀번호</label>
				        <span class="sp"></span>
				      <div class="col-sm-6">          
				        <input type="password" class="form-control" id="pwd"  name="mem_pass">
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="pwd2">비밀번호 재확인</label>
				        <span class="sp"></span>
				      <div class="col-sm-6">          
				        <input type="password" class="form-control" id="pwd2"  name="mem_pass">
				        
				      </div>
				    </div>
				  	
				  	<div class="form-group">
				      <label class="control-label col-sm-2" for="hp">휴대폰번호</label>
				        <span class="sp"></span>
				      <div class="col-sm-6">
				        <input type="text" class="form-control" id="hp"  name="mem_hp" value = "<%=vo.getMem_hp()%>">
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="email">이메일</label>
				        <span class="sp"></span>
				      <div class="col-sm-6">
				        <input type="email" class="form-control" id="email" name="mem_mail" value = "<%=vo.getMem_mail()%>">
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="zip">우편번호</label>
						<input type="button" class="button btn-default" onclick="sample4_execDaumPostcode()" value="우편번호 찾기" >		
				      <div class="col-sm-7">
				        <input type="text" class="form-control" id="sample4_postcode" name="mem_zip" value = "<%=vo.getMem_zip()%>">
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="zip">도로명주소</label>
				      <div class="col-sm-7">
				        <input type="text"  id="sample4_roadAddress" class="form-control" name="mem_addr1" value = "<%=vo.getMem_addr1()%>">
				      </div>
				    </div>
				    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="zip">지번주소</label>
				      <div class="col-sm-7">
				        <input type="text"  id="sample4_jibunAddress" class="form-control" name="mem_addr2" value = "<%=vo.getMem_addr2()%>">
				      </div>
				    </div>
				    <span id="guide" style="color:#999;display:none"></span>
				    
				    <div class="form-group">
				      <label class="control-label col-sm-2" for="zip">상세주소</label>
				      <div class="col-sm-7">
				        <input type="text"  id="sample4_detailAddress" class="form-control" name="mem_addr3" value = "<%=vo.getMem_addr2()%>">
				      </div>
				      </div>
				      
				       	
				    <!--취소 버튼에 메인 링크걸기  -->
				    <div class="form-group">        
				      <div class="col-sm-offset-2 col-sm-10">
				        <button type="submit" class="button btn-default btn-lg">수정하기</button>
				        <button type="button" class="button btn-default btn-lg">취소하기</button>
				        <span id="joinspan"></span>
				      </div>
				    </div>
				        
				   </form>
		
		
		
		
		</div>
		
		<div class = "pad"></div>
		
		<div id = "end"></div>
		
		
	</div>
</body>
</html>













