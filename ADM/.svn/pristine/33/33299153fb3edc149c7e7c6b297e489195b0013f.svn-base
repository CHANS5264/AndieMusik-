<%@page import="adm.vo.ViewVO"%>
<%@page import="java.util.List"%>
<%@page import="adm.vo.ReviewVO"%>
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


.starR1{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat -52px 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR2{
    background: url('http://miuu227.godohosting.com/images/icon/ico_review.png') no-repeat right 0;
    background-size: auto 100%;
    width: 15px;
    height: 30px;
    float:left;
    text-indent: -9999px;
    cursor: pointer;
}
.starR1.on{background-position:0 0;}
.starR2.on{background-position:-15px 0;}
</style>
<title>게시글 작성</title>
</head>
<%
	List<ViewVO> list = (List<ViewVO>)request.getAttribute("list");
%>
<script>
$(function(){

	//목록으로 클릭시
	$('#list').on('click', function(){
		location.href = '<%=request.getContextPath() %>/ReviewWrite.do';
	
	})
	/*  */
	$('.starRev span').click(function(){
		  $(this).parent().children('span').removeClass('on');
		  $(this).addClass('on').prevAll('span').addClass('on');
		  return false;
		});
	/*  */
})
</script>
<body>
<div class="container">
<form  class="form-horizontal" method="post">
 
  <div class="form-group">
    <label class="control-label col-sm-2" for="text">제목</label>
    <div class="col-sm-5">
      <input type="text" name="rev_title" class="form-control" id="sub1" placeholder="제목을 입력하세요.">
    </div>
  </div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="text">공연 제목</label>
    <div class="col-sm-5">
    
    	 <select class="selectpicker" data-width="75%" name="pbl_code">
    	 <%for(int i = 0; i < list.size(); i++){ 
    	 	ViewVO vo = list.get(i);
    	 %>
     		<option value="<%=vo.getPbl_code()%>"><%=vo.getPbl_nm() %></option>
     	<%} %>
 		 </select>    		
    </div>
  </div>
  
  <div class="form-group starRev">
    <label class="control-label col-sm-2" for="text" name="rev_score">별점</label>
	<div class="col-sm-5">
  		<span class="starR1 on">별1_왼쪽</span>
  		<span class="starR2">별1_오른쪽</span>
  		<span class="starR1">별2_왼쪽</span>
  		<span class="starR2">별2_오른쪽</span>
  		<span class="starR1">별3_왼쪽</span>
  		<span class="starR2">별3_오른쪽</span>
  		<span class="starR1">별4_왼쪽</span>
  		<span class="starR2">별4_오른쪽</span>
  		<span class="starR1">별5_왼쪽</span>
  		<span class="starR2">별5_오른쪽</span>      
  </div>
</div>
  
  <div class="form-group">
    <label class="control-label col-sm-2" for="pwd">내용 </label>
    <div class="col-sm-5">
      <textarea class="form-control" name="rev_content" rows="30" cols="30" id="cont1" placeholder="내용을 입력하세요."></textarea>
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