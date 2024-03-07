<%@page import="com.tjoeun.main.service.MainCommentService"%>
<%@page import="com.tjoeun.main.vo.MainCommentList"%>
<%@page import="com.tjoeun.main.vo.MainVO"%>
<%@page import="com.tjoeun.main.vo.MainList"%>
<%@page import="com.tjoeun.main.service.MainService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
		
	int currentPage;
	try {
		currentPage = Integer.parseInt( request.getParameter("currentPage") );
	} catch (NumberFormatException e) {
		currentPage = 1;
	}
	
	MainList list1 = MainService.getInstance().selectHit();
	MainList list2 = MainService.getInstance().selectGood();
	MainList list3 = MainService.getInstance().selectNew();
//	out.println(list1);
//	out.println(list2);
//	out.println(list3);
	
	
	request.setAttribute("currentPage", currentPage);
	request.setAttribute("selectHit", list1);
	request.setAttribute("selectGood", list2);
	request.setAttribute("selectNew", list3);
	
	pageContext.forward("./write.jsp");
%>


</body>
</html>