<%@page import="com.tjoeun.TJproject2.vo.MainList"%>
<%@page import="com.tjoeun.TJproject2.service.MainService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
//	이전 페이지에서 넘어오는 화면에 표시할 페이지 번호를 받음
	int currentPage = 1;
	try {
		currentPage = Integer.parseInt(request.getParameter("currentPage"));
	} catch (NumberFormatException e) {
		
	}
	
//	메인글 리스트 전체 얻어옴
	MainList list = MainService.getInstance().selectRankList();
	
	request.setAttribute("rankList", list);
	pageContext.forward("read.jsp");
%>

</body>
</html>