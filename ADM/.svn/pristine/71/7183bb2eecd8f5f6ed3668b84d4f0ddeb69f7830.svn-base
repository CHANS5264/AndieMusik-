<%@page import="adm.vo.NoticeVO"%>
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
	margin-left : 35%;
}
.listForm{
	width : 70%;
	margin-top : 20px;
	height : 500px;
	margin-left : 20%;
}
.pad{
    width : 20%;
}
hr{
	border : 2px solid lightgray;
	width : 40%;
	padding-left : 200px;
	margin-left : 150px;
}
h2{
	margin-left : 15%;
	padding-left : 220px;
}
#upt{
	padding-bottom : 5%;
}
.savebtn{
	margin : 1px;
	display: inline-block;
    margin-bottom: 0;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    background-image: none;
    border: 1px solid transparent;
    padding: 5px 12px;
    font-size: 14px;
   
    border-radius: 4px;
    user-select: none;
}
.save{
   color: #333;
   	background-color: #fff;
   	border-color: #ccc;
   
   	
}

</style>
<script>
$(function(){
	$('#list').on('click', function(){
		location.href=('notice/notice_index.jsp');
	})
	<%-- $("#write").on("click", function(){
		var form = $("#noticeForm").get(0);
		form.action = "<%=request.getContextPath()%>/notice/noticeUpdate.do";
		form.submit();
		
	}); --%>
})
</script>
<body>
<jsp:include page="../include.jsp" flush="false"/>
<%
	NoticeVO vo = (NoticeVO)request.getAttribute("vo");

%>
<div class="container listForm">
<form class="form-horizontal" action="/ADM/NoticeUpdate2.do"
method = "post" enctype = "multipart/form-data">
<div class = "pad">
</div>
<div id="upt">
<h2>공지사항 수정</h2>
<hr> 
<%-- <form id="noticeForm">
	<input type="hidden" id="code" name="notice_code" value="<%=vo.getNotice_code() %>">
</form> --%>
	<input type="hidden" name = "notice_code" value="<%=vo.getNotice_code()%>">
  <div class="form-group">
    <label class="control-label col-sm-2" for="text">제목</label>
    <div class="col-sm-5">
      <input type="text" style="width:600px" class="form-control" id="sub1" name="notice_title" value="<%=vo.getNotice_title()%>">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="text" >내용 </label>
    <div class="col-sm-5">
      <textarea class="form-control" rows="35" style="width:600px" id="cont1" name="notice_content"><%=vo.getNotice_content().replaceAll("\r\n", "\n")%></textarea>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">첨부파일</label>
    <div class="col-sm-5">
		<input type="file" class="form-control" style="width:600px" id="file" name = "file_name">
    </div>
  </div>
  
  <div id="but1">
	<button type="submit" class="save savebtn" id="write">저장</button>
	<button type="button" class="save savebtn" id="list">목록으로</button>
  </div>
</div>
<div class = "pad">
</div>
</form>
 </div>
</body>
</html>