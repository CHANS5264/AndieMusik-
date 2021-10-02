<%@page import="adm.vo.ReviewVO"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<ReviewVO> list =(List<ReviewVO>) request.getAttribute("reList");
	List<ReviewVO> pblnm = (List<ReviewVO>)request.getAttribute("pblnm");

	int spage =(Integer)request.getAttribute("sp");
	int epage =(Integer)request.getAttribute("ep");
	int tpage =(Integer)request.getAttribute("tp");
	System.out.println(list.size());
%>
{
	"tp" : "<%=tpage %>",
	"ep" : "<%=epage %>",
	"sp" : "<%=spage %>",
	"datas" : [
<%
	for(int i=0; i< list.size(); i++){
		ReviewVO vo = list.get(i);
		if(i > 0) out.print(",");
%>	
	{
		"code" : "<%=vo.getRev_code() %>",
		"title" : "<%=vo.getRev_title() %>",
		"writer" : "<%=vo.getMem_id() %>",
		"date" : "<%=vo.getRev_date() %>",
		"cnt" : "<%=vo.getRev_cnt() %>",
		"content" : "<%=vo.getRev_content().replaceAll("\r", "").replaceAll("\n", "<br>") %>",
		"score" : "<%=vo.getRev_score() %>",
		"pblnm" : "<%=pblnm.get(i).getPbl_nm() %>"
	}
<%
	}
%>
	]
}
	