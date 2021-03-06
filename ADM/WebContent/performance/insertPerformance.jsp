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
		
		<%-- if(<%=session.getAttribute("id")%> != "admin"){
			alert("올바른 경로가 아닙니다");
			location.href = "<%=request.getContextPath()%>/selectPbl.do";
		}  --%>
		
		
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
	.form-group{
		color: black;
	}
	
	.form-group input{
		color: black;
	}
	
	.form-group option{
		color: black;
	}
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
%>



<jsp:include page="../include.jsp" flush="false"/>

<div id = "par">
<div class = "pad"></div>
<div class="container">
<h2>공연 정보 추가</h2>
  <form class="form-horizontal" action="<%=request.getContextPath()%>/InsertPbl.do"
 	 method = "post" enctype = "multipart/form-data" >


    <div class="form-group">
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
        <input type="text" class="form-control" id="inputPer" placeholder="공연장 입력" name="prf_nm">
      </div>
      	
   	 </div>
   	 
   	 <div class="form-group">
      <label class="control-label col-sm-2" for="sel1">공연 단체</label>
      	<div class="col-sm-7">
      		<select class="form-control" id="sel1" name = "team_nm">
        		<%
        			//공연장 정보 select박스에 담기
        			for(int i = 0; i < teamList.size(); i++){
        				%>
        				<option value = "<%=teamList.get(i).getTeam_nm()%>"><%=teamList.get(i).getTeam_nm()%></option>
        		<%
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
        				%>
        				<option value = "<%=serList.get(i).getSer_nm()%>"><%=serList.get(i).getSer_nm()%></option>
        		<%
        			}
        		%>
      		</select>
      	</div>
   	 </div>
   	 
   	 	 <div class="form-group">
      <label class="control-label col-sm-2" for="sel1">관람등급</label>
      	<div class="col-sm-7">
      		<select class="form-control" id="sel1" name = "pbl_grade">
        		
        			<option value = "전체관람가">전체관람가</option>
        			<option value = "초등학생 이상 관람가">초등학생 이상 관람가</option>
        			<option value = "15세이상 관람가">15세이상 관람가</option>
        			<option value = "19세이상 관람가">19세이상 관람가</option>
        		
      		</select>
      	</div>
   	 </div>
   	 
  
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="email">공연 날짜</label>
      <div class="col-sm-7">
        <input type="date" class="form-control" id="date"  name="pbl_date">
      </div>
    </div>
    
     <div class="form-group">
      <label class="control-label col-sm-2" for="email">공연 시간</label>
      <div class="col-sm-5">
        <input type="time" class="form-control" id="time"  name="pbl_time">
      </div>
    </div>
    
    <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">공연명</label>
      <div class="col-sm-7">          
        <input type="text" class="form-control" id="" placeholder="공연명" name="pbl_nm">
      </div>
    </div>
    
    
 
  
    <div class="form-group">
      <label class="control-label col-sm-2" for="comment">공연 내용</label>
      <div class="col-sm-7"> 
     	 <textarea class="form-control" rows="5" id="comment" name = "pbl_content"></textarea>
      </div>
    </div>
    
     <div class="form-group">
      <label class="control-label col-sm-2" for="pwd">첨부 이미지</label>
      <div class="col-sm-7">          
        <input type="file" class="form-control" name = "file">
      </div>
    </div>
 
  
    <div class="form-group">        
      <div class="col-sm-offset-2 col-sm-10">
        <input type="submit" class = "save savebtn" value = "저장">
        <input type="button" class="btn btn-default" value = "이전으로" onclick = "location.href='<%=request.getContextPath()%>/selectPbl.do'">
      </div>
    </div>
    
    
  </form>
</div>
<div class = "pad"></div>
</div>
</body>
</html>