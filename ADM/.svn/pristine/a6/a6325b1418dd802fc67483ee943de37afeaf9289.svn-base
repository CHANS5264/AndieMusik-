<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A>글작성</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
</head>
<style>

 .listForm{
	width : 70%;
	margin-left : 30%;
    height : 500px;
    margin-top:10px;
    padding-bottom : 5%;
} 
#but1{
	margin-left : 60%;
	margin-bottom: 5%;
}

hr{
	border : 2px solid lightgray;
	width : 80%;
	padding-left : 220px;
	margin-left : 40px;
}
h2{
	margin-left : 10%;
	padding-left : 230px;
}
#par{
    display: flex;
    flex-direction: row;
    width: 100%;
}
    
.pad{
    width : 20%;
}
#listIns{
	width : 48%;
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
		location.href = 'qna/qna_index.jsp';
	})
	
	
})
</script>
<body>
<jsp:include page="../include.jsp" flush="false"/>
<div class="container listform">
<form  class="form-horizontal" action="/ADM/QnaInsert.do">
<div id = "par">
	<div class = "pad">
	</div>
	<div id="listIns">
	<h2>Q&A 작성</h2>
	<hr> 
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="text">제목</label>
	    <div class="col-sm-5">
	      <input type="text" name="qna_title" style="width:600px" class="form-control" id="sub1" placeholder="제목을 입력하세요.">
	    </div>
	  </div>
	  
	  <div class="form-group">
	    <label class="control-label col-sm-2" for="pwd">내용 </label>
	    <div class="col-sm-5">
	      <textarea class="form-control" style="width:600px" name="qna_content" rows="35" id="cont1" placeholder="내용을 입력하세요."></textarea>
	    </div>
	  </div>
	  
	  <div id="but1">
		<button type="submit" class="save savebtn" id="send">저장</button>
		<button type="button" class="save savebtn" id="list">목록으로</button>
	  </div>
	  
	  </div>
	  <div class = "pad">
		</div>
</div>
</form>
 </div>
</body>
</html>