<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	//insert 서블릿에서 값을 가져온다 
	String memId =(String)request.getAttribute("insert");
	if(memId != null){
		
%>
{
	"sw" : "ok",
	"id" : "<%=memId %>"
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