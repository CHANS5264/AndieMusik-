<%@page import="adm.vo.FboardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 공지사항 수정 JSP -->
<script type="text/javascript" src = "<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<title>Insert title here</title>
<style>
#but1{
	margin-left : 30%;
}
.container{
	width : 57%;
	margin-top : 7%;
	height : 500px;
}
</style>

<script>
$(function(){
	$('#list').on('click', function(){
		location.href=('fboard/fboard_index.jsp');
	})
	<%-- $("#write").on("click", function(){
		var form = $("#noticeForm").get(0);
		form.action = "<%=request.getContextPath()%>/notice/noticeUpdate.do";
		form.submit();
		
	}); --%>
})
</script>
</head>
<body>
<%
	FboardVO vo = (FboardVO)request.getAttribute("vo");
%>
<div class="container">
<form class="form-horizontal" action="/ADM/FboardUpdate2.do"
method="post" enctype="multipart/form-data">

	<input type="hidden" name="fboard_code" value="<%=vo.getFboard_code()%>">
  <div class="form-group"> 
  	<label class="control-label col-sm-2" for="text">제목</label>
    <div class="col-sm-5">
    	<input type="text" class="form-control" id="sub1" name="fboard_title" value="<%=vo.getFboard_title()%>">	
    </div>
  </div>

	<div class="form-group">
    <label class="control-label col-sm-2" for="text" >내용 </label>
    <div class="col-sm-5">
      <textarea class="form-control" rows="30" cols="30" id="cont1" name="fboard_content"><%=vo.getFboard_content().replaceAll("\r\n", "\n")%></textarea>
    </div>
  </div>
  
	<div class="form-group">
		<label class="control-label col-sm-2" for="pwd">첨부파일</label>
		<div class="col-sm-5">
			<input type="file" class="form-control" id="file" name="file_name">
		</div>
	</div>

  <div id="but1">
	<button type="submit" class="btn btn-default" id="write">저장</button>
	<button type="button" class="btn btn-default" id="list">목록으로</button>
  </div>
  
</form>
</div>
</body>
</html>