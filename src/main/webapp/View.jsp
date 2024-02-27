<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<script src="./js/setting.js" defer="defer"></script>
<title>소설 내용 PAGE</title>
<style type="text/css">
	#div0 {
		border: 1px solid black;
		height: 120px;
		width: 10%;
		padding: 2px;
		float: left;
	}
	
	#div1 {
		border: 1px solid black;
		height: 120px;
		width: 72%;
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
		height: 100rem;
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
	
	#div5 {
		border: 1px solid black;
		height: 5rem;
		border: 1px solid black;
		width: 97%;
		display: inline-block;
	}
</style>
</head>
<body>

<div class="container">
	<div>
		<div id="div0" style="background-color: purple;">로고</div>
		<div>
			<div id="div1">
				<table>
					<tr>
						<td style="border: 1px solid black; width: 50em; height: 2em;"
							colspan="3"></td>
					<tr>
						<td style="border: 1px solid black; height: 2em;"></td>
					</tr>
					<tr>
						<td style="border: 1px solid black; height: 3em;"></td>
					</tr>
				</table>
			</div>
		</div>
		<div id="divA" style="background-color: yellow">로그인</div>
	</div>
	
	<div id="div2" class="left" style="position: sticky; top:0rem; background-color: tomato;">
		<h4>소설 정보</h4><hr/>
		<div id="div2_1">소설 제목</div>
		<div id="div2_2">소설 설명</div>
		<div id="div2_3">검색바</div>
		<div>
			<input type="button" value="수정"/>
			<input type="button" value="삭제"/>
		</div>
	</div>
	<div id="div3">
		<div class="item left"></div>
		<div class="item center" style="background-color: silver">
			소설 내용<br/>
		</div>
		<div class="item right"></div>
	</div>
	<div id="div4" class="right" style="position: sticky; top:0rem; background-color: skyblue;">
		<h4>추천 소설 목록</h4><hr/>
		조회수 높은 소설 목록<br/>
		<ol>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ol><hr/>
		추천 높은 소설 목록<br/>
		<ol>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ol><hr/>
		새로운 소설 목록<br/>
		<ol>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
			<li></li>
		</ol><hr/>
	</div>
	
	<div id="div5">
		<form method="post" action="commentOK.jsp?currentPage=1" name="commentForm">
			<div id="div5-1" class="item" style="background-color: gray;">
				<tr>
					<th>댓글 목록</th>
					<c:set var="comment" value="${boardcommentList.list}"/>
					<!-- 댓글을 출력함 -->
					<c:set var="comment" value="${boardcommentList.list}"/>
					<!-- 댓글이 있는 경우 -->
					<c:if test="${comment.size() != 0}">
					<c:forEach var="co" items="${boardcommentList.list}">
					<fmt:formatDate var="codate" value="${co.writeDate}" pattern="yyyy/MM/dd a hh:mm:ss"/>
						<tr>
							<c:set var="name" value="${fn:replace(co.name, '<', '&lt;')}"/>
							<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
							<td colspan="3">${co.idx}. ${name}님이 ${codate}에 작성<br/><hr/>
							<c:set var="content" value="${fn:replace(co.content, '<', '&lt;')}"/>
							<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
							<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
							<div>${content}</div><br/>
							<td class="align-middle text-center">
								<!-- 자바스크립트 함수의 인수로 문자열을 전달할 경우 반드시 ''로 묶어야 함 -->
								<input type="button" value="댓글 수정" onclick="setting(${co.idx}, 2, '댓글 수정', '${name.trim()}', '${content}')"/>
								<input type="button" value="댓글 삭제" onclick="setting(${co.idx}, 3, '댓글 삭제', '${name.trim()}', '${content}')"/>
							</td>
						</tr>
					</c:forEach>
					</c:if>
					<!-- 댓글이 없는 경우 -->
					<c:if test="${comment.size() == 0}">
						<tr>
							<td colspan="4"><marquee>댓글이 없습니다</marquee></td>
						</tr>
					</c:if>
				</tr>
			</div>
			<!-- 화면에 보이면 안되는 부분 -->
			<!-- <tr style="display: none;"> -->
			<div>
			<tr>
				<td colspan="4">
					<!-- 수정 또는 삭제할 댓글의 글번호 -->
					idx: <input type="text" name="idx" value="${vo.idx}" size="1"/>
					<!-- 현재 댓글이 어떤 메인글의 댓글인가 -->
					gup: <input type="text" name="gup" value="${vo.idx}" size="1"/>
					<!-- 작업 모드, 1 → 댓글 저장, 2 → 댓글 수정, 3 → 댓글 삭제 -->
					mode: <input type="text" name="mode" value="1" size="1"/>
					<!-- 메인글이 표시되던 페이지 번호 -->
					currentPage: <input type="text" name="currentPage" value="${currentPage}" size="1"/>
				</td>
			</tr>
			</div>
			<div id="div5-2" style="border: 1px solid black; background-color: orange;">
				<!-- 댓글 입력, 수정, 삭제에 사용 -->
				<tr>
					<th style="width: 80px;">
						<label for="name">이름</label>
					</th>
					<td style="width: 270px;">
						<input id="name" type="text" name="name"/>
					</td>
				</tr>
				<tr>
					<th class="align-middle text-center" style="width: 80px;">
						<label for="content">내용</label>
					</th>
					<td colspan="3" style="width: 600px;">
					<textarea id="content" rows="5" name="content" style="resize: none;"></textarea>
				</tr>
				<tr class="table-dark">
					<td class="align-middle text-center" colspan="4">
						<input type="submit" name="title" value="댓글 저장"/>
						<input type="button" value="다시쓰기" onclick="setting(0, 1, '댓글 저장', '', '')"/>
					</td>
				</tr>
			</div>
		</form>
	</div>
</div>
</body>
</html>