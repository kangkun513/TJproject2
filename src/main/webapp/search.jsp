<%@page import="com.tjoeun.main.service.MainService"%>
<%@page import="com.tjoeun.main.vo.MainList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
	request.setCharacterEncoding("UTF-8");
	
//	검색창에서 넘어오는 글 제목을 받음

	String searchTag = request.getParameter("searchTag").trim(); // 태그(작가,제목)
	String searchVal = request.getParameter("searchVal").trim(); // 검색어
//	out.println("searchTag: "+ searchTag);  
//	out.println("searchVal: "+ searchVal);
//	전체 목록에서 검색어를 포함한 글 목록을 찾는 메소드를 실행
	MainList searchList = MainService.getInstance().searchList(searchVal);
	out.println("searchList: "+ searchList);
	
// 찾은 글을 request 영역에 저장해서 메인글을 브라우저에 표시하는 페이지(SearchView.jsp)로 넘겨준다.
//	request.setAttribute("searchList", searchList);

//	pageContext.forward("SearchView.jsp");
	
%>

</body>
</html>