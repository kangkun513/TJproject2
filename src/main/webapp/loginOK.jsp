<%@page import="com.tjoeun.main.vo.MemberVO"%>
<%@page import="com.tjoeun.main.service.MainService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript" src="./js/mainjs.js"></script>
<title>로그인</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
	String id = request.getParameter("id");
	String password = request.getParameter("pw");
	
	MemberVO vo = new MemberVO(id, password);
	
	
	int loginCheck = MainService.getInstance().login(vo);
//	out.println(loginCheck);
	
	int backPage;
	try{
		backPage = Integer.parseInt(request.getParameter("backPage") );
	} catch (NumberFormatException e){
		backPage = 1;
	}
	
	out.println("<script>");
	if (loginCheck != 1) {
		out.println("alert('로그인 불가')");
		out.println("location.href='./login.jsp'");
	} else {
		session.setAttribute("loginInfoID", id);
		session.setAttribute("loginInfoPW", password);
		session.setAttribute("loginCheck", loginCheck);
		out.println(backPage);
		out.println("alert('로그인 성공')");
//		out.println("alert('"+ backPage +"')");

		if (backPage == 3) {
			int idx;
			int currentPage;
			try {
				idx = Integer.parseInt(request.getParameter("idx"));
				currentPage = Integer.parseInt(request.getParameter("currentPage"));		
			} catch (NumberFormatException e){
				idx = 1;
				currentPage = 1;
			}
			session.setAttribute("idx", idx);
			session.setAttribute("currentPage", currentPage);
			out.println("location.href='./goBack.jsp?backPage=" + backPage + "&idx=" + idx + "&currentPage=" + currentPage + "'");
		} else {
			out.println("location.href='./goBack.jsp?backPage=" + backPage +"'");		
		}
//		out.println("location.href='./goBack.jsp?backPage="+ backPage +"'");
	}
	out.println("</script>");
%>

</body>
</html>