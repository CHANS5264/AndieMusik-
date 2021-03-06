<%@page import="java.util.List"%>
<%@page import="adm.vo.QnasVO"%>
<%@page import="adm.vo.QnaVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Q&A 상세보기</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>
<script type="text/javascript" src = "<%=request.getContextPath()%>/js/jquery-3.6.0.min.js"></script>
<!-- Q&A상세보기 JSP -->
<style>
  .table {
    border-collapse: collapse;
    border-top: 1px solid gray;
    width : 100%;
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
  	margin-left : 60px;
  	margin-top: 10px;
  	margin-bottom: 30px;
  }

  #sub{
  	/* border-top: 1px solid lightgray;
  	border-left: 1px solid lightgray;
  	border-right: 1px solid lightgray;
  	border-bottom: 1px solid lightgray; */
  	width: 50%;
  	margin-bottom: 50px;
  	padding-bottom : 30px;
	height : auto;
  }
  #titlep{
  	font-size: 22px;
  	margin-left : 15px;
  	font-weight: bold;
  	margin-top : 10px;
  }
  #but{
  	margin-left : 35%;
  	margin-bottom : 3%;
  }
  #par{
  	display: flex;
  	flex-direction: row;
  }
  
  .pad{
  	width : 25%;
  }
/* #reply{
	border-top : 1px solid lightgray;
} */
#send{
	height : 50px;
	margin-left : 35%;
	margin-top : 10px;
}
#akw{
	display: flex;
	flex-direction: column;
	border : 1px solid lightgray;
	border-radius: 2em;
	margin-top : 10px;
	padding : 15px;
}
#ekq{
	padding-left:20px;
	padding-top:10px;
	
	
}
#ans{
	border : 1px solid lightgray;
	border-radius: 2em;
	padding-left : 30px;
	padding-top : 30px;
	padding-bottom : 30px;
	margin-top : 10px;
	
}
#qn{
	border : 1px solid lightgray;
	border-radius: 2em;
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
	    background-color: #3CAEFF;
	    color : white;
	    border-radius: 4px;
	    user-select: none;
	}
	.save{
	   color: #333;
    	background-color: #fff;
    	border-color: #ccc;
    
    	
	}

.replycon{
	font-size : 20px;
	font-weight: normal;
} 
#to{
	display : flex;
}
p{
	margin-left : 10px;
	font-size : 15px;
}
.to1{
	margin-left : 60px;
	padding-right : 10px;
	font-weight : bold;
	border-right : 1px solid lightgray;
	margin-bottom : 20px;
}
#wnf {
	margin-left : 60px;
	height : auto; 
}
#so{
	margin-left : 50px;
}
  </style>
<%
	QnaVO vo = (QnaVO)request.getAttribute("detail");
	List<QnasVO> list = (List<QnasVO>)request.getAttribute("reply"); 
	String admin = (String)session.getAttribute("Y");
	String id = (String)session.getAttribute("id");
/* 	QnasVO revo = (QnasVO)request.getAttribute("qnas_code"); */
%>

</head>

<script>
$(function(){
	$("#upd").on("click", function(){
		var form = $("#qnaForm").get(0);
		form.action = "<%=request.getContextPath()%>/QnaUpdate2.do";
		form.submit(); 
	});
	
	$('#list').on('click', function(){
		location.href=('qna/qna_index.jsp');
	})
	
	$('#del').on('click', function(){
	
		location.href = "<%=request.getContextPath()%>/QnaDelete.do?code=<%=vo.getQna_code()%>";
		
	})
	
	$('.redel').on('click', function(){
	
		qna_code = <%=vo.getQna_code()%>
		var qnas_code = $(this).attr('idx');
		
		
		location.href = "<%=request.getContextPath()%>/Qnas_Delete.do?qna_code=" + qna_code + "&qnas_code=" + qnas_code ;
		
		
	}) 	
	
	$('.reupd').on('click', function(){
		
		cont = $(this).attr('con');
		
		if($('#modifyForm').css('display')  != "none"){
			replyReset();
		}
		
		//댓글 수정 - p태그의 수정할 내용을 가져오기
		modifycont = $(this).parent().find('.replycon').html();
		
		//<br>태그를 \n으로 수정
		modifycont = modifycont.replace(/<br>/g, "\n");
		//modifycont = modifycont.replace("\r\n", "<br>");
		
		//textarea에 출력
		$('#modifyForm textarea').val(modifycont);
		
		//댓글 수정폼 보이기
		$(this).parent().find('.replycon').empty().append($('#modifyForm'));
		$('#modifyForm').show();
		
		$(this).parent().find('.redel').hide();
		$(this).parent().find('.reupd').hide();
		
		
		
		
		
		
		/* code = '<div id="modifyForm">';		
		code += '<h4>댓글 수정</h4>';
		code += '<textarea cols="70" name="qnas_content">';
		code += cont;
		code += '</textarea>';
		code += '<br>';
		code += '<input type="button" class="btn btn-default reupd" id="ok" value="확인">';
		code += '<input type="button" class="btn btn-default reupd" id="cancle" value="취소"> '; */
		
		//$('#ans').html(code);
		
		
	})
	
	$('#cancle').on('click', function(){
		replyReset();
		
	})
	
	$('#ok').on('click',function(){
		
		
		modifycont = $('#modifyForm textarea').val();
		console.log(modifycont)
		cont = $('#modifyForm').parent();
		
		vidx = $(this).parents('#ans').find('.replycon').attr('idx');
		vs = <%=vo.getQna_code()%>;
		$('body').append($('#modifyForm'));
		$('#modifyForm').hide();
		
		modi = modifycont.replace(/\r/g, " ").replace(/\n/g, "<br>");
		console.log(modi)
		//modi = modifycont.replace("\r\n", "<br>");
		$(cont).html(modi);
		
		
		
		/* reply = {}
		reply.s_code = vidx;
		reply.content = modifycont; */
		
		
		/* alert(vidx)
		alert(modifycont)
		alert(vs) */
		
		replyUpdate();
	})
	
replyUpdate = function(){
		//info = {"qnas_code" : vidx, "qnas_content" : modi, "qna_code" : vs};
		location.href = '/ADM/Qnas_update.do?qnas_code=' + vidx+'&qnas_content=' + modi + '&qna_code=' + vs;
/* 	 $.ajax({
		url : '/ADM/Qnas_update.do',
		type : 'post',
		data : {"qnas_code" : vidx, "qnas_content" : modifycont, "qna_code" : vs}, //renum, cont
		/*success : function(res){
			
		},
		error : function(xhr){
			alert("상태 : " + xhr.status);
		},*/
 		//dataType : 'json'
		
//	})  */
}  

	
replyReset = function(){
		
		contp3 = $('#modifyForm').parent();//바로위의 부모인 cont p3에 접근
		
		//modifyForm을 다시 body로 append한다
		$('#modifyForm').append('body');
		$('#modifyForm').hide();
		
		//원래 내용을 contp3에 다시 출력
		modifycont = modifycont.replace(/\n/g, "<br>");
		$(contp3).html(modifycont);
		
		$('#tn').show();
		$('#tkr').show();
	}
	
})
	
</script>

<body>
	<div id="modifyForm" style = "display: none;">
  		<textarea rows="8"  style="width:800px" class="form-control"></textarea><br>
  		<input type="button" id="ok" value="확인" class="btn btn-default"> 
  		<input type="button" id="cancle" value="취소" class="btn btn-default"> 
	</div>






<jsp:include page="../include.jsp" flush="false"/>
<form id="qnaForm" >
	<input type="hidden" id="qna_code" name="qna_code" value="<%=vo.getQna_code()%>">
</form>
<div id = "par">
	<div class = "pad">
	
	</div>
		<div id="sub">
		<div id="qn">
		<p id = "titlep"><%=vo.getQna_title().replaceAll(" ", "&nbsp;") %></p>
		 <table class="table">
		    <tr><th>작성자</th><td id = "id"><%=vo.getMem_id() %></td></tr>
		    <tr><th>날짜</th><td><%=vo.getQna_date().substring(0, 10) %></td></tr>	
		    <tr><th>조회수</th><td><%=vo.getQna_cnt() %></td></tr>	
		  </table>

		  <div id="cont"> 
		  <%=vo.getQna_content().replaceAll("\r\n", "<br>") %>
		  </div>
		 
		
		<div id="but">
<%if(id != null){
		if(id == vo.getMem_id()){%>
		
			<button type="submit" class="btn btn-default" id="upd">수정</button>
			<button type="submit" class="btn btn-default" id="del">삭제</button>
			<button type="button" class="btn btn-default" id="list">목록으로</button>
			
		<%}else{%>
			
			<button type="button" class="btn btn-default" id="list">목록으로</button>
	<%
		}
	%>	
	
	<% }else{%>
			<button type="button" class="btn btn-default" id="list">목록으로</button>
	<% }%>
	
		
		</div>
		</div>
		
		<form id="commendForm" action="/ADM/QnasInsert.do">
		<div id="reply">
		<input type="hidden" value="<%=vo.getQna_code()%>" name = "qna_code">
		
			<%if(list == null){
				
			%>
				<p>등록된 댓글이 없습니다</p>
			<%}else{
				for(int i = 0; i < list.size(); i++){
					QnasVO vo2 = list.get(i);
					
				%>
					
					<div id="ans">
						<div id="to">
							<p class="to1">작성자 </p><p> <%=vo2.getAdmin_id()%></p>
							<p class="to1">날짜</p><p><%=vo2.getQnas_date().substring(0, 16) %></p>
						</div>
						
						<div id="so">
							<p class = "replycon" idx = "<%=vo2.getQnas_code()%>"><%=vo2.getQnas_content().replaceAll("\r\n", "<br>")%></p>
					<%if(admin != null){
							if(admin.equals("Y")){
					%>	 	
							<input id="tn" con = "<%=vo2.getQnas_content().replaceAll("\r\n", "<br>") %>" idx = "<%=vo2.getQnas_code()%>" type="submit" class="btn btn-default reupd" value="수정">
							<input id="tkr" idx = "<%=vo2.getQnas_code() %>" type="button" class="btn btn-default redel" value = "삭제">
							
					<%	} } %>
						</div>
					</div>
					
				<%}%>
			<%}%>
			
<%if(admin != null){
	if(admin.equals("Y")){
%>
		<%if(list.size() < 2){
		%>

		<div id="akw">
			<!-- <p id="ekq">답변 달기</p> -->
			<div id="wnf">
				<textarea class="form-control" style="width:800px" rows="10" name="qnas_content"></textarea>
				<button type="submit" class="sava savebtn" id="send">답변달기</button>
			</div>
		</div>
		</form> 
		
		</div>
	<% }else{%>	
		
		<%} %>
		
<%		
	}
	
}
%>
	
	<div class = "pad">
	</div>
</div>


</body>
</html>


