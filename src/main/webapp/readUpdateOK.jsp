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
<link rel="stylesheet" href="./css/read.css"/>

</head>
<body>

<c:set var="mainvo" value="${Mainboard}" />
<div class="container">
	<div>
		<div id="div0" style="background-color: purple;">
			<input class="btn btn-light" type="button" value="Main으로" onclick="location.href='list.jsp'"
				style="width: 100%; height: 100%;"/>
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
						<td style="border: 1px solid black; height: 2em;">3</td>
						<td style="border: 1px solid black;">3-1</td>
						<td style="border: 1px solid black;">3-2</td>
						<td style="border: 1px solid black;">3-3</td>
					</tr>
				</table>
			</div>
		</div>
		<div class="login" id="divA"
			style="background-color: yellow; text-align: right; padding-top: 20px; padding-right: 20px">
			<!-- 로그인하지 않은 상태 -->
			<c:if test="${loginCheck != 1}">
				<input class="btn btn-primary" type="button" value="Login"
					style="width: 100px; height: 75%;" onclick="location.href='./login.jsp?backPage=3&idx=${mainvo.idx}&currentPage=${currentPage}'" />
				<input class="btn btn-dark" type="button" value="Register"
					style="width: 100px; height: 75%;" onclick="location.href='./register.jsp'"/>
			</c:if>
			<!-- 로그인한 상태 -->
			<c:if test="${loginCheck == 1}">
				${loginInfoID}님 환영합니다
				<input class="btn btn-primary" type="button" value="logout"
					style="width: 100px; height: 75%;" onclick="location.href='./logout.jsp?backPage=3&idx=${mainvo.idx}&currentPage=${currentPage}'" />
			</c:if>
		</div>
	</div>
	
	<form action="selectByIdx.jsp" method="get">
	<div style="display: none;">
		<input name="idx" value="${mainvo.idx}"/>
		<input name="currentPage" value="${currentPage}"/>
		<input name="job" value="updateOK"/>
	</div>
	<div id="div2" class="left" style="position: sticky; top:0rem; background-color: tomato;">
		<h4>소설 정보</h4><hr/>
		<div id="div2_1">
			<label for="title">
				소설 제목<br/>
				<input id="title" maxlength="100" name="subject" value="${mainvo.subject}" style="width: 100%;"/>
			</label>
		</div>
		<div id="div2_2">explain 소설설명</div>

		<div id="div2_2" align="center">
				<input class="category" type="radio" value="작성자">글쓴이 <input
					class="category" type="radio" value="제목" /> 제목 <input type="text"
					style="width: 90%; margin-bottom: 4%" /> <input
					class="btn btn-sm btn-outline-success" type="submit"
					style="width: 50%;" value="검색"/>
		</div>
		
		<div id="div2_3" align="center">
			<input class="btn btn-primary btn-sm" type="submit" value="수정 완료"/>
			<input class="btn btn-secondary btn-sm" type="button" value="수정 취소" 
				onclick="location.href='selectByIdx.jsp?idx=${mainvo.idx}&currentPage=${currentPage}'"/>
		</div>
	</div>
	<div id="div3">
		<div class="center" style="background-color: silver">
			<h4>소설 내용</h4><hr/>
			<table style="width: 100%; 
				border-top: 1px solid black;">
				<tr style="height: 2em;">
					<th>글 번호</th>
					<td name="idx">${mainvo.idx}</td>
				</tr>
				<tr style="height: 2em; border-top: 1px solid black;">
					<th>글 그룹 번호</th>
					<td name="gup">${mainvo.gup}</td>
				</tr>
				<tr style="height: 2em; border-top: 1px solid black;">
					<th>작성자 ID</th>
					<td name="id">${mainvo.id}</td>
				</tr>
				<tr style="height: 2em; border-top: 1px solid black;">
					<th>카테고리</th>
					<td name="category">
						<select id="category" name="category" class="form-control" >
								<option selected="selected">${mainvo.category}</option>
								<option>공포</option>
								<option>스릴러</option>
								<option>미스테리</option>
								<option>순정</option>
								<option>코미디</option>
								<option>역사</option>
						</select>
					</td>
				</tr>
				<tr style="height: 2em; border-top: 1px solid black;">
					<th>조회수</th>
					<td name="hit">${mainvo.hit}</td>
				</tr>
				<tr style="height: 2em; border-top: 1px solid black;">
					<th>추천수</th>
					<td name="good">${mainvo.good}</td>
				</tr>
				<tr style="height: 2em; border-top: 1px solid black;">
					<th>작성 날짜</th>
					<fmt:formatDate var="Date" value="${mainvo.writeDate}" pattern="yyyy/MM/dd a h:mm:ss"/>
					<td name="writeDate">${Date}</td>
				</tr>
				<tr style="border-top: 1px solid black;">
					<th><label for="contents">내용</label></th>
					<td>
						<textarea class="form-control" id="contents" name="content" maxlength="2000"
							style="height: 6.5em; resize: none;">${mainvo.content}</textarea>
					</td>
				</tr>
			</table>
				
			<div id="div5">
					<div id="div5_1" style="height: 13em; background-color: gray;"></div>
					<div id="div5_2" style="height: 12em; background-color: orange;"></div>
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
					<li>
						<div class="rankHyper">
							<a class="" href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
							${vo.getSubject()}(${vo.getHit()})</a>
						</div>
					</li>
				</c:if>
				<c:if test="${vo.deleted == 'yes'}">
					<li>
						<div class="rankHyper">
							<a href="">삭제된 글입니다</a>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ol><hr/>
		추천 높은 소설 목록<br/>
		<ol>
			<c:set var="list" value="${selectGood.list}" />
			<c:forEach var="vo" items="${list}">
				<c:if test="${vo.deleted == 'no'}">
				<li>
					<div class="rankHyper">
						<a class="" href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
						${vo.getSubject()}(${vo.getGood()})</a>
					</div>
				</li>
				</c:if>
				<c:if test="${vo.deleted == 'yes'}">
				<li>
					<div class="rankHyper">
						<a href="">삭제된 글입니다</a>
					</div>
				</li>
				</c:if>
			</c:forEach>
		</ol><hr/>
		새로운 소설 목록<br/>
		<ol>
			<c:set var="list" value="${selectNew.list}" />
			<c:forEach var="vo" items="${list}">
				<fmt:formatDate var="writeDate" value="${vo.getWriteDate()}" pattern="MM/dd HH:mm:ss"/>
				<c:if test="${vo.deleted == 'no'}">
					<li>
						<div class="rankHyper">
							<a class="" href="increment.jsp?idx=${vo.idx}&currentPage=${currentPage}">
							${vo.getSubject()}</a>
						</div>
					</li>
				</c:if>
				<c:if test="${vo.deleted == 'yes'}">
					<li>
						<div class="rankHyper">
							<a href="">삭제된 글입니다</a>
						</div>
					</li>
				</c:if>
			</c:forEach>
		</ol>
	</div>
	</form>
	
</div>
</body>
</html>