<%@page import="adm.vo.NoticeVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
List<NoticeVO> list = (List<NoticeVO>)request.getAttribute("noList");
int spage = (Integer)request.getAttribute("sp");
int epage = (Integer)request.getAttribute("ep");
int tpage = (Integer)request.getAttribute("tp");
String id = (String)request.getAttribute("id");
%>

{
	"tp" : "<%= tpage %>",
	"ep" : "<%= epage %>",
	"sp" : "<%= spage %>",
	"datas" : [

<% 	for(int i = 0; i < list.size(); i++){
		NoticeVO vo = list.get(i);
		if(i > 0) out.print(",");

%>
	{
		"code" : "<%= vo.getNotice_code() %>",
		"title" : "<%= vo.getNotice_title() %>",
		"date" : "<%= vo.getNotice_date() %>",
		"ad_id" : "<%=vo.getAdmin_id() %>",
		"content" : "<%=vo.getNotice_content().replaceAll("\r\n", "<br>") %>",
		"cnt" : "<%= vo.getNotice_cnt() %>",
		"rnum" : "<%=vo.getRnum() %>"
		
	}


<%
	}
%>
  ]

}