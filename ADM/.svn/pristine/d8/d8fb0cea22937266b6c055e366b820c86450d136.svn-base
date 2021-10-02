<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%

 //servlet에서 저장 값 가져오기
 int seq = (Integer)request.getAttribute("seq");
 if(seq > 0) {
%>
{
	"sw" : "ok",
	"seq" : "<%= seq %>"
}

<% }else { %>
	{
		"sw" : "no",
		"seq" : "<%= seq %>"
	}
<% } %>