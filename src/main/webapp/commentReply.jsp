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
	String content = request.getParameter("content");

	if(content == null || content.trim().equals("")) {
		int idx = Integer.parseInt(request.getParameter("voidx"));
		int comidx = Integer.parseInt(request.getParameter("comidx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		out.println("<script>");
		out.println("alert('" + comidx + "번 댓글 답글 실패')");
		out.println("location.href='selectByIdx.jsp?idx=" + idx + "&currentPage=" + currentPage + "'");
		out.println("</script>");
	} else {
		int voidx = Integer.parseInt(request.getParameter("voidx"));
		int currentPage = Integer.parseInt(request.getParameter("currentPage"));
		int comidx = Integer.parseInt(request.getParameter("comidx"));
		vo.setName("reply" + comidx);
		vo.setContent(content);
		vo.setGup(voidx);
		vo.setLev(2);
		System.out.println("vovo" + vo);
		MainCommentService.getInstance().reply(vo);
		
		response.sendRedirect("selectByIdx.jsp?idx=" + voidx + "&currentPage=" + currentPage);		
	}
%>

</body>
</html>