<%@page import="adm.vo.FboardVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <%
  List<FboardVO> list = (List<FboardVO>)request.getAttribute("fboList");
  int spage = (Integer)request.getAttribute("sp");
  int epage = (Integer)request.getAttribute("ep");
  int tpage = (Integer)request.getAttribute("tp");
  %>
  

	{
		"tp" : "<%= tpage %>",
		"ep" : "<%= epage %>",
		"sp" : "<%= spage %>",
		"datas" : [
	
<%
	for(int i = 0; i < list.size(); i++){
		FboardVO vo = list.get(i);
		if(i > 0) out.print(",");
%>

		{
			"code" : "<%= vo.getFboard_code() %>",
			"title" : "<%= vo.getFboard_title() %>",
			"date" : "<%= vo.getFboard_date() %>",
			"mem_id" : "<%=vo.getMem_id() %>",
			"content" : "<%=vo.getFboard_content().replaceAll("\r\n", "<br>") %>",
			"cnt" : "<%= vo.getFboard_cnt() %>",
			"rnum" : <%=vo.getRnum() %>
		
		}
		
		<% 
			}  
		%>
	]

  }

 
