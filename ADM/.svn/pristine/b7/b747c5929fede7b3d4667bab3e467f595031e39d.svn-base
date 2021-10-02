<%@page import="adm.vo.QnasVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<QnasVO> list = (List<QnasVO>)request.getAttribute("seq");

%>
[
<%
	if(list != null && list.size() > 0){
		for(int i=0; i<list.size(); i++){
			QnasVO vo = list.get(i);
			if(i > 0) out.print(",");
%>
	{
		"s_code" : "<%=vo.getQnas_code() %>",
		"adm_id" : "<%=vo.getAdmin_id() %>",
		"content" : "<%= vo.getQnas_content().replaceAll("\r", "<br>").replaceAll("\n", "<br>") %>",
		"date" : "<%=vo.getQnas_date() %>",
		"code" : "<%=vo.getQna_code() %>"
	}

<% 
		}
	}
%>
]
