 <%@page import="com.tjoeun.TJproject2.vo.MainCommentList"%>
<%@page import="com.tjoeun.TJproject2.service.MainCommentService"%>
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

<jsp:useBean id="vo" class="com.tjoeun.TJproject2.vo.MainCommentVO">
	<jsp:setProperty property="*" name="vo"/>
</jsp:useBean>

<%
//	테이블에 저장된 댓글 목록을 얻어와서 commentList 클래스의 ArrayList에 저장한 후
//	CommentList 클래스 객체를 request 영역에 저장해서 read.jsp 페이지로 넘겨받음
	MainCommentList list = MainCommentService.getInstance().selectList();
	request.setAttribute("commentList", list);
	pageContext.forward("read.jsp");
%>

</body>
</html>