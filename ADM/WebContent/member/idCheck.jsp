<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String memId = (String)request.getAttribute("memId");
	if(memId == null){
		
%>
{
	"sw" : "ok"
}

<%
	}else{
		
%>
{
	"sw" : "no"
}

<% 
	}
%>