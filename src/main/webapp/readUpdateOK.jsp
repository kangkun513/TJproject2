<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소설 내용 수정 PAGE</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script type="text/javascript" src="./js/board.js" defer="defer"></script>
<style type="text/css">
	
	.container {
		display: grid;
	}
	
	#div0 {
		border: 1px solid black;
		height: 120px;
		width: 17%;
		padding: 2px;
		float: left;
	}
	
	#div1 {
		border: 1px solid black;
		height: 120px;
		width: 65%;
		background-color: green;
		padding: 2px;
		float: left;
		display: inline-block;
	}
	
	#divA {
		border: 1px solid black;
		height: 120px;
		width: 15%;
		padding: 2px;
		display: inline-block;
	}
	
	#nav {
		border: 1px solid black;
		width: 97%;
		height: 3rem;
	}
	
	#div2 {
		width: 17%;
		height: 50rem;
		border: 1px solid black;
		float: left;
		position: relative;
	}
	
	#div2_1 {
		width: 85%;
		height: 100px;
		border: 2px solid black;
		background-color: lavender;
		display: inline-block;
		float: left;
		margin-left: 12px;
		margin-bottom: 10px;
	}
	
	#div2_2 {
		width: 85%;
		height: 100px;
		border: 2px solid black;
		background-color: lavender;
		display: inline-block;
		float: left;
		margin-left: 12px;
		margin-bottom: 10px;
	}
	
	#div2_3 {
		width: 85%;
		height: 100px;
		border: 2px solid black;
		background-color: lavender;
		display: inline-block;
		float: left;
		margin-left: 12px;
	}
	
	#div3 {
		width: 65%;
		float: left;
		border: 1px solid black;
	}
	
	#table1 {
		width: 95%;
		height: 95%;
		margin-left: 15px;
		margin-right: 15px;
	}
	
	.div3_tr1 {
		border: 1px solid black;
		background-color: lavender;
	}
	
	#div4 {
		width: 15%;
		height: 50rem;
		border: 1px solid black;
		float: left;
	}
	
</style>
</head>
<body>

<div class="container">
	<div>
		<div id="div0" style="background-color: purple;">로고
			<input type="button" value="Main으로" onclick="location.href='list.jsp'"/>
		</div>
		<div>
			<div id="div1">
				<table>
					<tr>
						<td style="border: 1px solid black; width: 10em; height: 2em;">
							1</td>
						<td style="border: 1px solid black; width: 10em;">1-1</td>
						<td style="border: 1px solid black; width: 10em;">1-2</td>
						<td style="border: 1px solid black; width: 10em;">1-3</td>
					<tr>
						<td style="border: 1px solid black; height: 2em;">2</td>
						<td style="border: 1px solid black;">2-1</td>
						<td style="border: 1px solid black;">2-2</td>
						<td style="border: 1px solid black;">2-3</td>
					</tr>
					<tr>
						<td style="border: 1px solid black; height: 3em;">3</td>
						<td style="border: 1px solid black;">3-1</td>
						<td style="border: 1px solid black;">3-2</td>
						<td style="border: 1px solid black;">3-3</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="login" id="divA" onclick="location.href='./login.jsp?backPage=3'"
			style="background-color: yellow; text-align: right; padding-top: 20px; padding-right: 20px">
			<input class="btn btn-primary" type="button" value="login" style="width: 35%"/></br>
			<input class="btn btn-dark" type="button" value="register" style="width: 50%"/>	
		</div>
	</div>
	
	<c:set var="boardvo" value="${Mainboard}" />
	
	<form action="selectByIdx.jsp" method="get">
	<div>
	<div style="display: none;">
		<input name="idx" value="${boardvo.idx}"/>
		<input name="currentPage" value="${currentPage}"/>
		<input name="job" value="updateOK"/>
	</div>
	<div id="div2" class="left" style="position: sticky; top:0rem; background-color: tomato;">
		<h4>소설 정보</h4><hr/>
		<label for="title"><div id="div2_1">
			글 제목<br/>
			<input id="title" name="subject" value="${boardvo.subject}" style="width: 100%;"/></div></label>
		<div id="div2_2">explain 소설설명</div>

		<div id="div2_3" align="center">
				<input class="category" type="radio" value="작성자">글쓴이 <input
					class="category" type="radio" value="제목" /> 제목 <input type="text"
					style="width: 90%; margin-bottom: 4%" /> <input
					class="btn btn-sm btn-outline-success" type="submit"
					style="width: 50%;" value="검색"/>
		</div>
		
		<div align="center">
			<input class="btn btn-primary btn-sm" type="submit" value="수정 완료"/>
			<input class="btn btn-secondary btn-sm" type="button" value="수정 취소" 
				onclick="location.href='selectByIdx.jsp?idx=${boardvo.idx}&currentPage=${currentPage}'"/>
		</div>
	</div>
	<div id="div3">
		<div class="center" style="background-color: silver">
			<h4>소설 내용</h4><hr/>
			<table style="width: 100%; border: 1px solid black;">
				<tr style="height: 2em;">
					<th>글 번호</th>
					<td name="idx">${boardvo.idx}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>글 그룹 번호</th>
					<td name="gup">${boardvo.gup}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>작성자 ID</th>
					<td name="id">${boardvo.id}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>카테고리</th>
					<td name="category">
						<select id="category" name="category" class="form-control" >
								<option selected="selected">${boardvo.category}</option>
								<option>공포</option>
								<option>스릴러</option>
								<option>미스테리</option>
								<option>순정</option>
								<option>코미디</option>
								<option>역사</option>
						</select>
					</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>조회수</th>
					<td name="hit">${boardvo.hit}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>추천수</th>
					<td name="good">${boardvo.good}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>작성 날짜</th>
					<fmt:formatDate var="Date" value="${boardvo.writeDate}" pattern="yyyy/MM/dd a h:mm:ss"/>
					<td name="writeDate">${Date}</td>
				</tr>
				<tr style="border: 1px solid black; height: 100%;">
					<th><label for="contents">내용</label></th>
					<td>
						<textarea class="form-control" id="contents" name="content"
							style="height: 100%; resize: none;">${boardvo.content}</textarea>
					</td>
				</tr>
			</table>
	</form>
				
			<div id="div5">
					<div id="div5_1" style="height: 12.5em; background-color: gray;"></div>
					<div id="div5_2" style="height: 15em; background-color: orange;"></div>
			</div>
		</div>
	</div>
	<div id="div4" class="right" style="position: sticky; top:0rem; background-color: skyblue;">
		<h4>추천 소설 목록</h4><hr/>
		조회수 높은 소설 목록<br/>
		<ol>
			<c:set var="list" value="${selectHit.list}" />
			<c:forEach var="vo" items="${list}">
				<c:if test="${vo.deleted == 'no'}">
				<li><a class="" href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
				${vo.getSubject()}(${vo.getHit()})</a></li>
				</c:if>
				<c:if test="${vo.deleted == 'yes'}">
				<li><a href="">삭제된 글입니다</a></li>
				</c:if>
			</c:forEach>
		</ol><hr/>
		추천 높은 소설 목록<br/>
		<ol>
			<c:set var="list" value="${selectGood.list}" />
			<c:forEach var="vo" items="${list}">
				<c:if test="${vo.deleted == 'no'}">
				<li><a class="" href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
				${vo.getSubject()}(${vo.getGood()})</a></li>
				</c:if>
				<c:if test="${vo.deleted == 'yes'}">
				<li><a href="">삭제된 글입니다</a></li>
				</c:if>
			</c:forEach>
		</ol><hr/>
		새로운 소설 목록<br/>
		<ol>
			<c:set var="list" value="${selectNew.list}" />
			<c:forEach var="vo" items="${list}">
				<fmt:formatDate var="writeDate" value="${vo.getWriteDate()}" pattern="MM/dd HH:mm:ss"/>
				<c:if test="${vo.deleted == 'no'}">
				<li><a class="" href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
				${vo.getSubject()}(${writeDate})</a></li>
				</c:if>
				<c:if test="${vo.deleted == 'yes'}">
				<li><a href="">삭제된 글입니다</a></li>
				</c:if>
			</c:forEach>
		</ol><hr/>
	</div>
	</div>
	
</div>
</body>
</html>