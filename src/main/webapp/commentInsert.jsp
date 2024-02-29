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
//	read.jsp에서 넘겨받은 댓글 정보 테이블에 저장하는 메소드 호출
	MainCommentService.getInstance().insert(vo);
//	저장 후 페이지 넘김
	response.sendRedirect("commentList.jsp");
%>

</body>
</html>