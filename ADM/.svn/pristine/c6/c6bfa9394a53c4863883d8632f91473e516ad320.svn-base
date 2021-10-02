<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="adm.vo.PblprfrVO"%>
<%@page import="adm.vo.SeriesVO"%>
<%@page import="adm.vo.TeamVO"%>
<%@page import="com.sun.scenario.effect.impl.prism.PrDrawable"%>
<%@page import="adm.vo.PrfplcVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<title>An Die Musik</title>
<script type="text/javascript">
	$(function(){
		$('#performPL').on('change', function(){
			$('#performPL option:selected').each(function(){
			
				if($(this).val() == "1"){
					$("#inputPer").val(''); 
					$("#inputPer").attr("readonly",false);
					
				}else{
					$("#inputPer").val($(this).text()); 
					$("#inputPer").attr("readonly",true);
				}
			})
		})
		
	})
</script>

<style>
.savebtn{
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
	    padding: 6px 12px;
	    font-size: 14px;
	    line-height: 1.42857143;
	    border-radius: 4px;
	    user-select: none;
	}
	
	.save{
	    color: #333;
    background-color: #fff;
    border-color: #ccc;
    	
	}
	#par{
		display: flex;
		flex-direction: row;
	}
	
	.pad{
		width : 18%;
	}
	h2{
		text-align: center;
		margin-bottom: 40px;
	}
</style>
</head>
<body>
<%
	// 공연장 정보 받기
	List<PrfplcVO> prfList = (List<PrfplcVO>)request.getAttribute("prfList");
	// 공연팀 정보 받기
	List<TeamVO> teamList = (List<TeamVO>)request.getAttribute("teamList");
	// 시리즈 정보 받기
	List<SeriesVO> serList = (List<SeriesVO>)request.getAttribute("serList");
	// 세션에 담긴 vo객체 얻기
	PblprfrVO vo = (PblprfrVO)session.getAttribute("detailvo");
	
	String tos = vo.getPbl_date().substring(0,10);
%>

<jsp:include page="../include.jsp" flush="false"/> 

	
<div id = "par">
<div class = "pad"></div>
<div class="container">
  <form class="form-horizontal" action="<%=request.getContextPath()%>/UpdatePbl.do"
 	 method = "post" enctype = "multipart/form-data" >


    <div class="form-group">
    <h2>공연 정보 수정</h2>
      <label class="control-label col-sm-2" for="sel1">공연장 선택</label>
      	<div class="col-sm-3">
      		<select class="form-control" id="performPL" name = "">
      			<option value = "1">직접입력</option>
        		<%
        			//공연장 정보 select박스에 담기
        			for(int i = 0; i < prfList.size(); i++){
        				%>
        				<option value = "<%=prfList.get(i).getPrf_nm()%>"><%=prfList.get(i).getPrf_nm()%></option>
        		<%
        			}
        		%>
        		
        		
      		</select>
      	</div>
      	<div class="col-sm-4">
        <input type="text" class="form-control" id="inputPer" placeholder="공연장 입력" name="prf_nm" value = "<%=vo.getPrf_nm()%>">
      </div>
      	
   	 </div>
   	 
   	 <div class="form-group">
      <label class="control-label col-sm-2" for="sel1">공연 단체</label>
      	<div class="col-sm-7">
      		<select class="form-control" id="sel1" name = "team_nm">
        		<%
        			//공연장 정보 select박스에 담기
        			for(int i = 0; i < teamList.size(); i++){
        				if(teamList.get(i).getTeam_nm().equals(vo.getTeam_nm())){
        				
        				%>
        				<option value = "<%=teamList.get(i).getTeam_nm()%>" selected><%=teamList.get(i).getTeam_nm()%></option>
        				<%}else{ %>
        				<option value = "<%=teamList.get(i).getTeam_nm()%>"><%=teamList.get(i).getTeam_nm()%></option>
        		<%
        			}
        				}
        		%>
        		
      		</select>
      	</div>
   	 </div>
   	 
   	 <div class="form-group">
      <label class="control-label col-sm-2" for="sel1">시리즈</label>
      	<div class="col-sm-7">
      		<select class="form-control" id="sel1" name = "ser_nm">
        		<%
        			//공연장 정보 select박스에 담기
        			for(int i = 0; i < serList.size(); i++){
        				if(serList.get(i).getSer_nm().equals(vo.getSer_nm())){
        				%>
        				<option value = "<%=serList.get(i).getSer_nm()%>" selected><%=serList.get(i).getSer_nm()%></option>
        				<%} else{%>
        				<option value = "<%=serList.get(i).getSer_nm()%>"><%=serList.get(i).getSer_nm()%></option>
        		<%
        				}
        			}
        		%>
      		</select>
      	</div>
   	 </div>
   	 
   	 	 <div class="form-group">
      <label class="control-label col-sm-2" for="sel1">관람등급</label>
      	<div class="col-sm-7">
      		<select class="form-control" id="" name = "pbl_grade">
        		
        			<option class = "gradeop" value = "전체관람가">전체관람가</option>
        			<option class = "gradeop" value = "초등학생 이상 관람가" selected>초등학생 이상 관람가</option>
        			<option class = "gradeop" value = "15세이상 관람가">15세이상 관람가</option>
        			<option class = "gradeop" value = "19세이상 관람가">19세이상 관람가</option>
        		
      		</select>
      	</div>
   	 </div>
   	 
   
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">공연 날짜</label>
      <div class="col-sm-7">
        <input type="date" class="form-control" id="date"  name="pbl_date" value = "<%=tos%>">
      </div>
    </div>
    
     <div class="form-group">
      <label class="control-label col-sm-2" for="email">공연 시간</label>
      <div class="col-sm-7">
        <input type="time" class="form-control" id="time"  name="pbl_time" value="<%=vo.getPbl_time()%>">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">공연명</label>
      <div class="col-sm-7">          
        <input type="text" class="form-control" id="" placeholder="공연명" name="pbl_nm" value = <%=vo.getPbl_nm().replace(" ", "&nbsp")%>>
      </div>
    </div>
    
    
 
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="comment">공연 내용</label>
      <div class="col-sm-7"> 
     	 <textarea class="form-control" rows="5" id="comment" name = "pbl_content" ><%=vo.getPbl_content().replaceAll("<br>", "\r\n") %></textarea>
      </div>
    </div>
    
     <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">첨부 이미지</label>
      <div class="col-sm-7">          
        <input type="file" class="form-control" name = "file" value="">
      </div>
    </div>
 
  
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <button type="submit" class="save savebtn">수정</button>
        <input type="button" class="btn btn-default" value = "이전으로" onclick = "location.href='<%=request.getContextPath()%>/selectPbl.do'">
      </div>
    </div>
    
    
  </form>
  
</div>
<div class = "pad"></div>
</div>
</body>
</html>