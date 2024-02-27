<%@page import="com.tjoeun.project2.service.boardcommentService"%>
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
	int mode = Integer.parseInt(request.getParameter("mode"));
	out.println("mode : " + mode);
	int currentPage = Integer.parseInt(request.getParameter("currentPage"));
	out.println("currentPage : " + currentPage);	
%>

<jsp:useBean id="co" class="com.tjoeun.project2.vo.boardcommentVO">
	<jsp:setProperty property="*" name="co"/>	
</jsp:useBean>

<%
	out.println("<script>");

	try {
		switch (mode) {
			case 1: // 댓글 저장
				out.println("alert('댓글 입력 " + (boardcommentService.getInstance().insertComment(co) ? "성공":"실패") + "')");
				break;
			/*
			case 2: // 댓글 수정
				out.println("alert('댓글 수정 " + (boardcommentService.getInstance().updateComment(co) ? "성공":"실패") + "')");
				break;
			case 3: // 댓글 삭제
				out.println("alert('댓글 삭제 " + (boardcommentService.getInstance().deleteComment(co) ? "성공":"실패") + "')");	
				break;
			*/
		}
	} catch (NullPointerException e) {
		out.println("alert(문제 발생)");
	}
	
	out.println("location.href='selectByIdx.jsp?idx=" + co.getGup() + "&currentPage" + currentPage + "&job=contentview'");
	out.println("</script>");

%>

</body>
</html>