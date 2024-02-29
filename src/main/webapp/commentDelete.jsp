<%@page import="com.tjoeun.TJproject2.service.MainCommentService"%>
<%@page import="com.tjoeun.TJproject2.vo.MainCommentVO"%>
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

//	삭제한 댓글에 삭제 완료 메시지 표시 위해 원 댓글 내용 얻어옴
	MainCommentVO originalComment = MainCommentService.getInstance().selectByIdx(vo.getIdx());
	// out.println(originalComment);
	// commentService.getInstance().delete(vo.getIdx());
	MainCommentService.getInstance().deleteMessage(vo.getIdx());
	// commentService.getInstance().deleteCheck(vo.getIdx());
	pageContext.forward("commentList.jsp");
%>

</body>
</html>