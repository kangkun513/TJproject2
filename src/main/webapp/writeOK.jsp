<%@page import="com.tjoeun.main.vo.MemberVO"%>
<%@page import="com.tjoeun.main.service.MainService"%>
<%@page import="com.tjoeun.main.vo.MainVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>저장하기 1</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	String category = request.getParameter("category");
	String subject = request.getParameter("subject");
	String content = request.getParameter("content");
	String id = (String) session.getAttribute("loginInfoID");
//	out.println("id : "+id +"/");
//	out.println("content : "+content+"/");
//	out.println("subject :"+subject+"/");
//	out.println("category :"+category+"/");
	
	MainVO vo = new MainVO();
	vo.setId(id);
	vo.setSubject(subject);
	vo.setContent(content);	
	vo.setCategory(category);
//	out.println("writeOK - vo : " + vo);
%>


<%
	MainService.getInstance().write(vo);
	response.sendRedirect("list.jsp");
%>

</body>
</html>