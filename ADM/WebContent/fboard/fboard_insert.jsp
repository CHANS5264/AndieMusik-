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


<style>
#write_no{
	margin-left : 25%;
	margin-top : 5%;
}
.container{
	width : 57%;
	margin-left : 25%;
    margin-top : 7%;
}
#but1{
	margin-left : 30%;
}
</style>
<title>Insert title here</title>
</head>

<script>
$(function(){

	//목록으로 클릭시
	$('#list').on('click', function(){
		location.href = '<%=request.getContextPath() %>/FboardWrite.do';
	})
})
</script>
<body>
<div class="container">
<form  class="form-horizontal" action="/ADM/FboardWrite.do"
method="post" enctype="multipart/form-data">
 
  <div class="form-group">
    <label class="control-label col-sm-2" for="text">제목</label>
    <div class="col-sm-5">
      <input type="text" name="fboard_title" class="form-control" id="sub1" placeholder="제목을 입력하세요.">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">내용 </label>
    <div class="col-sm-5">
      <textarea class="form-control" name="fboard_content" rows="30" cols="30" id="cont1" placeholder="내용을 입력하세요."></textarea>
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">첨부파일</label>
    <div class="col-sm-5">
		<input type="file" class="form-control" name="file">
    </div>
  </div>
  
  <div id="but1">
	<button type="submit" class="btn btn-default" id="send">저장</button>
	<button type="button" class="btn btn-default" id="list">목록으로</button>
  </div>

</form>
 </div>
</body>
</html>