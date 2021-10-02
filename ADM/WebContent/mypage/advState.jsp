<%@page import="adm.vo.ReserveVO"%>
<%@page import="java.util.List"%>
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
<%
	List<ReserveVO> list = (List<ReserveVO>)request.getAttribute("list");
%>
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
				<a href="<%=request.getContextPath()%>/" class="list-group-item">My 자유게시판</a>
				<a href="<%=request.getContextPath()%>/" class="list-group-item">회원 탈퇴</a>
			</div>
		</div>
		
		<div class = "pad">
		
		
          
  
   
    
     
  
<div class="container">
		
			<table class="table">
	    		<thead>
	     			<tr>
	       				<th>예매일자</th>
	        			<th>공연명</th>
	        			<th>공연 날짜</th>
	        			<th>공연 시간</th>
	        			<th>공연 장소</th>
	        			<th>좌석명</th>
	        		</tr>
	    		</thead>
	    		<tbody>
			<%if(list == null){
			%>
     			 <tr>
       				 <td colspan="5">예매내역이 없습니다</td>
      			</tr>
			<% }else{
				for(int i = 0; i < list.size(); i++){
					ReserveVO vo = list.get(i);
				%>
				 <tr>
       				<td><%=vo.getAdv_time().substring(0,10)%></td>
       				<td><a href = "<%=request.getContextPath()%>/"><%=vo.getPbl_nm()%></a></td>
        			<td><%=vo.getPbl_date().substring(0,10)%></td>
        			<td><%=vo.getPbl_time() %></td>
        			<td><%=vo.getPrf_nm() %></td>
        			<td><%=vo.getSeat_code() %></td>
     			 </tr>
					
				<%}
			%>
				
				
			<%} %>
			  	</tbody>
			  </table>
		
		</div>
		</div>
		<div id = "content">
		</div>
		
		<div class = "pad"></div>
		
		<div id = "end"></div>
		
		
	</div>
</body>
</html>












