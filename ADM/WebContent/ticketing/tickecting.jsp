<%@page import="java.util.Calendar"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.text.DateFormat"%>
<%@page import="java.util.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>An Die Musik</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
 <link
    rel="stylesheet"
    href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"
  />
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%
	String id = (String)session.getAttribute("id");
%>
<style type="text/css">
body{
	height: 1500px;
}
	td{
		padding : 15px;
	}
	.tdimg{
		
	}
	#par{
		display: flex;
		flex-direction: row;
	}
	.pad{
		width:5%;
	}
	.reserv{
		position : absolute;
		top : 19%;
		margin-left: 75%;
	}
	#tb{
		width : 45%;
	}
	table {
		background: #fcfcfc;
		width : 100%;
		border-radius: 10px;
	}
	#nav{
		width : 20%;
	}
	#nav .container{
		width: 100%;
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
	    border: 1px solid transparent;
	    padding: 6px 12px;
	    font-size: 14px;
	    line-height: 1.42857143;
	    border-radius: 10px;
	    user-select: none;
	    width: 100%;
	}
	
	.save{
	    color: #333;
    background-color: #EF3F43;
    border-color: #ccc;
    box-shadow: 2px 3px 2px 1px lightgray;
    height: 50px;
    margin-top: 10px;
    color: white;
    font-weight: bold;
    font-size: 20px;
    	
	}
	#selectPref{
		height: auto;
		width: 350px;
		border : 1px solid lightgray;
		border-radius: 10px;
		box-shadow: 2px 1px 2px 1px gray;
		
	}
	option{
		font-size: 20px;
	}
	.form-control{
		font-size: 20px;
		width: 90%;
		margin-left: 3%;
		margin-right: 3%;
	}
	.selText{
		margin : 3%;
	}
	#pblDetail{
		margin-top: 25px;
		padding-left : 30px;
	}
	.seaP{
		font-size: 14px;
	}
	.seatP span{
		font-weight: bold; 
		font-size: 17px;
	}
	#seatSatate{
		width: 50%;
		
	}
	#seatSatate table{
		width: 100%;
	}
	
	#seatSatate th{
		width: 30%;
		text-align: center;
	}
	#seatSatate td{
	text-align : right;
		width: 70%;
	}
	
	#seatText{
		text-align: center;
	}
	#seatpar{
		display: flex;
		flex-direction : row;
		margin-bottom: 15px;
		width: 100%;
	}
	.seatpad{
		width: 25%;
	}
	#perfdate h2{
	
	text-shadow : 1px 1px 1px lightgray;
	text-align: center;
}
	
</style>
<script type="text/javascript">
	$(function(){
		
		ticketInfo = {
			
		}
		selectPblCehck = false;
		
		$(window).scroll(function(){
			var scrollTop = $(document).scrollTop();
			if (scrollTop < 210) {
			 scrollTop = 210;
			}
			$(".reserv").stop();
			$(".reserv").animate( { "top" : scrollTop });
			}); 
		
		$('#selDate').change(function(){
			vdate = $(this).val();
			
			
			$.ajax({
				url : '<%=request.getContextPath()%>/SelectPblNm.do',
				data : {'date' : vdate},
				type : 'post',
				success : function(data){
					res = '<div class="form-group">'
					res += '  <label for="sel1" class = "selText">?????????</label>'
					res += '<select class="form-control" id="selPbl">'
					
					
					if(data == ""){
						res += '<option>????????? ????????????.</option>'
					}else{
						res += '<option>==????????????==</option>'
						$.each(data,function(i,v){
							res += '<option value = '+ v.pbl_code +'>'+ v.pbl_nm +'['+v.pbl_time +']</option>'
						})
					}
				
					res += '	  </select>'
					res += '			</div>'
					
					$('#pblNm').html(res);
					$('#pblDetail').empty();
					$('#seatSatate').empty();
					$('#seatText').empty();
					
				},
				error : function(xhr){
					alert(xhr.status)
					
				},
				dataType : 'json'
			})
		})
		
		$('#pblNm').on('change','#selPbl',function(){
			vpblNm = $(this).val();
			if(vpblNm == "????????? ????????????." || vpblNm == "==????????????=="){
				return;
			}
			vcode = $(this).val();
			selectPblCehck = true;
			
		$.ajax({
		
			url : '<%=request.getContextPath()%>/selectTicketPbl.do',
			data : {'code' : vcode},
			type : 'post',
			success : function(data){
				ticketInfo.pbl_code = data.vo.pbl_code;
				res = '<table>'
				res +='<tr>'
				res +='		<th class = "td1">??????</th>'
				res +='     <td class = "td2">' + data.vo.prf_nm + '</td>'
				res +='</tr>'
				
				res +='<tr>'
				res +='<th class = "td1">??????</th>'
				res +='	<td class = "td2">' + data.vo.pbl_date.substring(0,10) + '</td>'
				res +='</tr>'
				
				res +='<tr>'
				res +='	<th class = "td1">??????</th>'
				res +='	<td class = "td2">'+ data.vo.pbl_time+'</td>'
				res +='</tr>'
				
				res +='<tr>'
				res +='	<th class = "td1">????????????</th>'
				res +='	<td class = "td2">'+ data.vo.pbl_grade +'</td>'
				res +='</tr>'
				
				res +='<tr>'
				res +='	<th class = "td1">??????/??????</th>'
				res +='	<td class = "td2">???????????????/<br>'+ data.vo.team_nm +'</td>'
				res +='</tr>'
				
				res +='</table>'
				
				seat = '<label for="sel1" class = "selText">????????????</label>'
				
				seatstate = '<table>'
				seatstate += '<tr>'
				seatstate += '<th>R??? </th>' 
				seatstate += '<td>' + data.r + '/20</td>'
				seatstate += '</tr>'
				
				seatstate += '<tr>'
				seatstate += '<th>S??? </th>' 
				seatstate += '<td>' + data.s + '/20</td>'
				seatstate += '</tr>'
						
				seatstate += '<tr>'
				seatstate += '<th>A??? </th>' 
				seatstate += '<td>' + data.a + '/30</td>'
				seatstate += '</tr>'
				
				seatstate += '<tr>'
				seatstate += '<th>B??? </th>' 
				seatstate += '<td>' + data.b + '/30</td>'
				seatstate += '</tr>'
				
				seatstate += '</table>'
				
				$('#pblDetail').html(res);
				$('#seatText').html(seat);
				$('#seatSatate').html(seatstate);
			},
			error : function(xhr){
				alert(xhr.status)
			},
			dataType : 'json'
		})
		
		
			
		})
		checkid = 0;
		<%if(id != null){ %>
		
		checkid = <%=id.length()%>;
		
		<%}%>
		$('#ticket').on('click',function(){
			
			if(checkid < 1){
				check = confirm("????????? ??? ?????????????????????. ????????? ????????????????????")
				if(check){
					location.href = '../member/login.jsp'
					return;
				}else{
					return;
				}
			}else{
			
				if(!selectPblCehck){
					alert("????????? ????????? ???????????? ?????????");
					return;
				}
				
				vcode = ticketInfo.pbl_code;
				flag = confirm("?????? ????????? ????????? ?????? ????????????????????");
				
				if(!flag){
					return;
				}
	
				
				 location.href = ('<%=request.getContextPath()%>/selectSeat.do?code=' + vcode)
			}
		})
		
	})
	
	
	
	

</script>
</head>

<body>
<jsp:include page="../include.jsp" flush="false"/>



<div id = "par">

<div id = "nav">
		<div class="container">
		  <div id = "perfdate">
		  	<h2>?????? ??????</h2>
		  </div>
		  <div class="list-group">
		    <a href="<%=request.getContextPath()%>/selectPbl.do" class="list-group-item">?????? ??????</a>
		    <a href="<%=request.getContextPath()%>/selectPbl.do?team=?????? ?????? ????????????" class="list-group-item">-?????? ?????? ????????????</a>
		    <a href="<%=request.getContextPath()%>/selectPbl.do?team=?????? ?????? ?????????" class="list-group-item">-?????? ?????? ?????????</a>
		    <a href="<%=request.getContextPath()%>/selectPbl.do?team=?????? ?????? ?????????" class="list-group-item">-?????? ?????? ?????????</a>
		    
		   
		    
		  </div>
		</div>
	
	</div>

<div class = "pad">

</div>
<div id = 'tb'>
	<table border = 1>
		<tr>
			<td class = "tdimg">
				<img src = "<%=request.getContextPath()%>/images/??????.jpg">
			</td>
			<td>
				<h3 style="color : blue;">??????</h3>
				<p>- ?????? ??????(?????? 5???)?????? ????????? ???????????? ????????? ???????????????, ?????? ?????? ????????? ????????? ????????? ?????? ???????????? ????????? ??????????????? ?????????.</p>
				<p style="color:#FA3C3C;">&nbsp;&nbsp;&nbsp;??? ??? ?????? ??????(?????? 5???)????????? ????????? ????????????, ???????????? ???????????? ????????????.</p>
				<p>- ????????? ???????????? ????????? ?????? ????????? ???????????? ?????????(???????????????,??????????????? ???),???????????? ??????(????????? ????????????)??? ???????????? ????????? ????????????.</p>
				<p style="color:#FA3C3C;">&nbsp;&nbsp;&nbsp;??? ???????????????????????? ??????????????? ?????? ??????????????? 10% ?????? ????????? ????????? ??? ????????????.</p>
				<h3 style="color : blue;">?????? ??????</h3>
				<p>- ?????? ?????? ?????? ?????? 1?????? ????????? ??????????????? ?????? ????????????, ????????? ???????????? ???????????? ???????????? ??? ????????????.</p>
				<p style="color:#FA3C3C;">&nbsp;&nbsp;&nbsp;??? ???, ????????? ????????? ???????????? ?????? ?????? 15??? ????????? ?????? ?????? ????????? ?????? ?????? ??? ??? ????????? ????????? ?????? ?????? ???????????? ????????????.</p>
			</td>
		</tr>
		
		<tr>
			<td class = "tdimg">
				<img src = "<%=request.getContextPath()%>/images/??????.jpg">
			</td>
			<td>
				<h3 style="color : blue;">?????? ?????? ??????</h3>
				<p>- 20??? ?????? ???????????????, ?????? ????????? ????????????.</p>
				<p>- ?????? ????????? ??????????????? ?????????????????? ?????? ?????? ??????????????? ????????? ????????? ?????? ?????????</p>
			</td>
		</tr>
		
			<tr>
			<td class = "tdimg">
				<img src = "<%=request.getContextPath()%>/images/????????????.jpg">
			</td>
			<td>
				<h3 style="color : blue;">?????? ??????&??????</h3>
				<p>- ?????? 1??? ??? : ?????????(?????? ????????? 10%) ??????</p>
				<p style="color:#FA3C3C;">&nbsp;&nbsp;&nbsp;??? ?????? ??????(?????? 5???)????????? ????????? ????????????, ???????????? ???????????? ????????????.</p>
				<p style="color:#FA3C3C;">&nbsp;&nbsp;&nbsp;??? ???????????? ?????? ?????????????????? ????????????????????? ?????? ??? ????????????. ??????????????? ?????????????????? ????????????.</p>
				<p>- ?????? : ?????? ??????</p>
				<p>- ?????? ????????? ???????????? ????????? ??????, ?????? ?????? ??????????????? ??????????????? ?????????.</p>
			</td>
		</tr>
	</table>
	
</div>
<div class = "pad"></div>

</div>
<div class = "reserv">
	<div id = "selectPref">
		<div class="form-group">
			  <label for="sel1" class = "selText">?????? ??????</label>
			  <select class="form-control" id="selDate" class = "selectDay" >
			    <%
			    DateFormat df = new SimpleDateFormat("yyyy-MM-dd");
			    Calendar cal = Calendar.getInstance();
			    Date date = new Date(); 
			    cal.setTime(date);
			    String now = null;
			    for(int i = 1; i <=30; i++){
			   		cal.add(Calendar.DATE, 1);
			   		now = df.format(cal.getTime());
			    %>
			    <option class = "dateText"><%=now%></option>
			    
			    <%}
			    %>
			  
			  </select>
		</div>
		<div id = "pblNm"></div>
		<div id = "pblDetail"></div>
		<hr>
		<div id = "seatText"></div>
		<div id = "seatpar">
			<div class = "seatpad"></div>
			<div id = "seatSatate"></div>
			<div class = "seatpad"></div>
	</div>
	<button id = "ticket" type="submit" class="save savebtn">???&nbsp;&nbsp;&nbsp;???</button>
</div>

</body>
</html>