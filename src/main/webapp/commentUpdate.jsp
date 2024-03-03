<%@page import="com.tjoeun.main.service.MainCommentService"%>
<%@page import="com.tjoeun.main.vo.MainCommentVO"%>
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
%>
<jsp:useBean id="vo" class="com.tjoeun.main.vo.MainCommentVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
	int idx = Integer.parseInt(request.getParameter("idx"));
	int comidx = Integer.parseInt(request.getParameter("comidx"));
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	//	수정할 댓글에 수정하기 위해 원 댓글 내용 얻어옴
	MainCommentVO originalComment = MainCommentService.getInstance().selectByIdx(comidx);
	String upcomment = request.getParameter("upcomment");
	upcomment.replace(">", "%gt;");
	upcomment.replace("<", "%lt;");
	originalComment.setContent(upcomment.trim());
	// System.out.println("originalComment: " + originalComment);
	
	MainCommentService.getInstance().update(originalComment);

	response.sendRedirect("selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage);
%>

</body>
</html>