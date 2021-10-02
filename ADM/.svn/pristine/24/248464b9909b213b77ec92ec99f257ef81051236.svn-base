<%@page import="adm.vo.FansVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%

	//servlet에서 값 가져오기
	List<FansVO> list = (List<FansVO>) request.getAttribute("seq");
	
%>
[
<%
  if(list != null && list.size() > 0){
	for(int i=0; i<list.size(); i++){
		FansVO vo = list.get(i);
		if(i > 0) out.print(",");
%>
	{
		"code" : "<%=vo.getFans_code() %>",
		"title" : "<%=vo.getFans_content() %>",
		"content" : "<%=vo.getFans_date() %>",
		"date" : "<%=vo.getFans_date().replaceAll("\r", "").replaceAll("\n", "<br>")%>",
		"id" : "<%=vo.getMem_id() %>",
		"fcode" : "<%=vo.getFboard_code() %>"
		
	}


<%
	}

  }
%>


]



