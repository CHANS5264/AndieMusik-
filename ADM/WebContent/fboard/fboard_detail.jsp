<%@page import="java.util.List"%>
<%@page import="adm.vo.FansVO"%>
<%@page import="adm.vo.FboardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<!-- 공지사항 상세보기 JSP -->
<script type="text/javascript" src = "<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
 <style>
    .table {
      border-collapse: collapse;
      border-top: 1px solid gray;
      width : 57%;
    }  
    .table th {
      color: black;
      background: white;
      text-align: center;
      width : 70px;
      font-weight: normal;
    }
    .table th, .table td {
      padding: 10px;
      border: 1px solid #ddd;
    }
    .table th:first-child, .table td:first-child {
      border-left: 0;
    }
    .table th:last-child, .table td:last-child {
      border-right: 0;
    }
    .table tr td:first-child{
      text-align: center;
    }
    .table caption{caption-side: bottom; display: none;}
    
    #cont{
    	width : 50%;
    	margin-left : 60px;
    	margin-top: 30px;
    	margin-bottom: 30px;
    	
    }
    #fboard_img{
    	width : 40%;
    	margin-left : 100px;
    }
    #sub{
    	margin-left : 28%;
    	margin-top : 7%;
    }
    p{
    	font-size: 22px;
    	margin-left : 15px;
    	font-weight: bold;
    }
    #but{
    	margin-left : 37%;
    }
    img{
    	width : 100%;
    	height: 100%;
    }
    #imgCon{
    	height: auto;
    	overflow : auto;
    }

	textarea .replycon{
  		resize: none;
	}
	
	#replyins {
  background-color: #4CAF50; 
  border: none;
  color: white;
  padding: 15px 15px;
  width : 65px;
  height : 66px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  margin: 2px 2px;
  cursor: pointer;
  position : relative;
  bottom : 30px;
}
  </style>
<%
	FboardVO vo = (FboardVO)request.getAttribute("detail");
	FansVO vo1 = (FansVO)request.getAttribute("seq");
	List<FansVO> list = (List<FansVO>)request.getAttribute("list");
	
%>
<script>
$(function(){
	
	
	

	//글수정
	$("#upd").on("click", function(){
		var form = $("#fboardForm").get(0);
		form.action = "<%=request.getContextPath()%>/FboardUpdate.do";
		form.submit(); 
	});
	//목록으로
	$('#list').on('click', function(){
		location.href=('fboard/fboard_index.jsp');
	})
	//글삭제
	$('#del').on('click', function(){
		
		location.href = "<%=request.getContextPath()%>/FboardDelete.do?code=<%=vo.getFboard_code()%>";
	})
	
	
	//댓글 삭제 버튼
	$('.redel').on('click', function(){
		fboard_code = <%=vo.getFboard_code()%>
		var fans_code = $(this).attr('idx');
		location.href= "<%=request.getContextPath()%>/ReplyDelete.do?fboard_code=" + fboard_code + "&fans_code=" + fans_code;
	
	
	})
	
	// 댓글 등록 버튼 이벤트
	$('#replyins').on('click', function(){
		idx = $(this).attr('idx');
		con = $('#replyCon').val();
		alert(idx)
		alert(con)
		
		location.href = "<%=request.getContextPath()%>/FboardReplyWrite.do?code=" +idx+ '&con=' + con;
		
	})
	
	//댓글 수정 버튼
	$('.reup').on('click', function(){
		cont = $(this).attr('con');
		
		if($('#modifyForm').css('display') != "none"){
			replyReset();
		}
		
		//댓글수정 - p태그의 수정할 내용을 가져오기
		modifycont = $(this).parent().find('.replycon').html();
		
		//<br>태그를 \n으로 수정
		modifycont = modifycont.replace(/<br>/g, "\n");
		
		//textarea에 출력
		$('#modifyForm textarea'). val(modifycont);
		
		//댓글 수정폼 보이기
		$(this).parent().find('.replycon').empty().append($('#modifyForm'));
		$('#modifyForm').show();
	})	
	
	
	$('#cancle').on('click', function(){
		replyReset();
		
	})
	
	$('#ok').on('click',function(){
		
		
		modifycont = $('#modifyForm textarea').val();
		
		cont = $('#modifyForm').parent();
		
		vidx = $(this).parents('#ans').find('.reup').attr('idx');
	
		vs = <%=vo.getFboard_code()%>;
		$('body').append($('#modifyForm'));
		$('#modifyForm').hide();
		
		modi = modifycont.replace(/\r/g, "").replace(/\n/g, "<br>");
		$(cont).html(modi);
		alert(modi)
		replyUpdate();
	})
	
	
	replyUpdate = function(){
		info = {"fans_code" : vidx, "fans_content" : modifycont, "fboard_code" : vs};
		location.href = '/ADM/ReplyUpdate.do?fans_code=' +vidx+ '&fans_content=' +modifycont+ '&fboard_code=' + vs;
	}
	
	
	replyReset = function(){
		
		contp3 = $('#modifyForm').parent();//바로위의 부모인 cont p3에 접근
		
		//modifyForm을 다시 body로 append한다
		$('#modifyForm').append('body');
		$('#modifyForm').hide();
		
		//원래 내용을 contp3에 다시 출력
		modifycont = modifycont.replace(/\n/g, "<br>");
		$(contp3).html(modifycont);
		
	}
	
	
})
</script>
</head>

<body>
<div id="modifyForm" style = "display: none; ">
  <textarea rows="5" cols="50"></textarea><br>
  <input type="button" id="ok" value="확인"> 
  <input type="button" id="cancle" value="취소"> 
</div>


<form id="fboardForm" >
	<input type="hidden" id="fboard_code" name="fboard_code" value="<%=vo.getFboard_code()%>">
</form>

<div id="sub">
<p><%=vo.getFboard_title().replaceAll(" ", "&nbsp;") %></p>
 <table class="table">
    <tr><th>Name</th><td id ="id"><%=vo.getMem_id() %></td></tr>
    <tr><th>Date</th><td><%=vo.getFboard_date() %></td></tr>
  <%
  	if(vo.getFile_name() == null){
  %>
  
    <tr><th>File</th><td></td></tr>
  
  <%
  	}else{
  %>
  
  <tr>
  <th>File</th>
  <td><%=vo.getFile_name() %></td>
  </tr>
  
  <%
  	}
  %>
  </table>
  
  
  
  
  <div id = "imgCon">
  <%
  	if(vo.getFile_name() != null){
  %>    
  <div id="fboard_img">
  	<img src="<%=request.getContextPath()%>/FboardImageView.do?fileName=<%=vo.getFile_name()%>">
  </div>
  <div id="cont">
  <%=vo.getFboard_content().replaceAll("\r\n", "<br>") %>
  </div>
  <%
  	}else{
  %>
  
  <div id="cont">
  <%=vo.getFboard_content().replaceAll("\r\n", "<br>") %>
  </div>
  <%
  	}
  %>
  <div>
  <textarea rows="3" cols="90" id="replyCon"></textarea>
  <button idx = "<%=vo.getFboard_code()%>" type="button" class="btn btn-default" id="replyins">등록</button>
  </div>
  
  <%for(int i = 0; i < list.size(); i++){
	  FansVO vo2 = list.get(i);
	%>
	<div id="ans" style="border:1px solid gray; width:700px;">
	<p><%=vo2.getMem_id()%></p>
	<p><%=vo2.getFans_date()%></p>	
	<p class="replycon" idx="<%=vo2.getFans_code() %>"><%=vo2.getFans_content() %></p>
	<hr>
	
	<input idx = "<%=vo2.getFans_code()%>" con="<%=vo2.getFans_content()%>" type = "button" class = "reup" value = "수정">
	<input idx="<%=vo2.getFans_code()%>" type = "button" class = "redel" value = "삭제">

	</div>
  <%}%>
  
  <%

  %>
  
  
</div>
</div>	
<div id="but">
<button type="submit" class="btn btn-default" id="upd">수정</button>
<button type="button" class="btn btn-default" id="del">삭제</button>
<button type="button" class="btn btn-default" id="list">목록으로</button>
</div>
</body>
</html>