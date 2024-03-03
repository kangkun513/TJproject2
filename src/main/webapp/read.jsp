<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>소설 내용 PAGE</title>
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
	<div>
	<div id="div2" class="left" style="position: sticky; top:0rem; background-color: tomato;">
		<h4>소설 정보</h4><hr/>
		<div id="div2_1">
			<c:if test="${boardvo.deleted == 'no'}">
				<c:set var="subject" value="${fn:replace(boardvo.subject, '<', '&lt;')}"/>
				<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
				글 제목<br/><b>${subject}</b>
			</c:if>
			<c:if test="${boardvo.deleted == 'yes'}">
				글 제목<br/><b>삭제된 글입니다</b>
			</c:if>
		</div>

		<div id="div2_2">explain 소설설명</div>

		<div id="div2_3" align="center">
			<form action="#" method="post">
				<input class="category" type="radio" value="작성자">글쓴이 <input
					class="category" type="radio" value="제목" /> 제목 <input type="text"
					style="width: 90%; margin-bottom: 4%" /> <input
					class="btn btn-sm btn-outline-success" type="submit"
					style="width: 50%;" value="검색"/>
			</form>
		</div>
		
		<div align="center">
			<input class="btn btn-primary btn-sm" type="button" value="수정" 
				onclick="location.href='selectByIdx.jsp?idx=${boardvo.idx}&currentPage=${currentPage}&job=update'"/>
			<input class="btn btn-danger btn-sm" type="button" value="삭제" 
				onclick="location.href='selectByIdx.jsp?idx=${boardvo.idx}&currentPage=${currentPage}&job=delete'"/>
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
					<td name="category">${boardvo.category}</td>
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
				<tr style="border: 1px solid black;">
					<th>내용</th>
				
					<c:if test="${boardvo.deleted == 'no'}">
						<c:set var="content" value="${fn:replace(boardvo.content, '<', '&lt;')}"/>
						<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
						<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
						<td name="content">${content}</td>
					</c:if>
					<c:if test="${boardvo.deleted == 'yes'}">
						<td name="content">삭제된 글입니다</td>
					</c:if>
				</tr>
			</table>
				
				<div id="div5">
					<div id="div5_1" class="item" style="background-color: gray;">
						<h4>댓글 목록</h4><hr/>
						<!-- 댓글을 출력함 -->
						<c:set var="comment" value="${commentList.list}"/>
						
						<!-- 댓글이 있는 경우 -->
						<c:if test="${comment.size() != 0}">
							<c:set var="upidx" value="1" />
							<c:forEach var="co" items="${commentList.list}">
							<!-- 글 그룹 번호와 댓글 번호 그룹이 같을 경우 -->
							<c:if test="${co.gup == boardvo.gup}">
							<c:set var="commentForm" value="form${co.idx}"></c:set>
							<form action="commentUpdate.jsp" name="${commentForm}" method="post" id="${commentForm}">
							
							<div style="display: flex;">
								idx: <input type="text" name="idx" value="${idx}" size="1"/>
								comidx: <input type="text" id="comidx" name="comidx" value="${co.idx}" size="1"/>
								mode: <input type="text" name="mode" value="1" size="1"/>
								title: <input type="text" name="title" value="1"/>
								currentPage: <input type="text" name="currentPage" value="${currentPage}" size="1"/>
							</div>
							<fmt:formatDate var="codate" value="${co.writeDate}" pattern="yyyy/MM/dd a h:mm:ss"/>
								<c:set var="name" value="${fn:replace(co.name, '<', '&lt;')}"/>
								<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
								<c:set var="content" value="${fn:replace(co.content, '<', '&lt;')}"/>
								<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
								<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
								<div>${upidx}. </div><br/>
								<c:set var="upidx" value="${upidx + 1}" />
								<!-- 삭제된 댓글이 아닐 경우 표시 -->
								<c:if test="${co.deleted == 'no'}">
									<div>
										<div>${content}</div><br/>
										${name}님이 ${codate}에 작성<br/>
										<!-- 자바스크립트 함수의 인수로 문자열을 전달할 경우 반드시 ''로 묶어야 함 -->
										<input class="btn btn-primary btn-sm" type="button" value="댓글 수정" onclick="setting(1, '댓글 수정')"/>
										<input class="btn btn-danger btn-sm" type="button" value="댓글 삭제" 
											onclick="location.href='commentDelete.jsp?idx=${boardvo.idx}&commentidx=${co.idx}&currentPage=${currentPage}'"/>
										<input class="btn btn-warning btn-sm" type="button" value="답글 달기" onclick="setting(2, '댓글 삭제')"/><br/>
										<div id="commentUpdateForm" style="display: block;">
											<textarea class="form-control form-control-sm" type="text" id="upcomment" name="upcomment" rows="4"
												style="width: 50%; resize: none; display: inline-block;"></textarea>
											<div style="display: inline-block;">
												<input class="btn btn-primary btn-sm" type="submit" value="댓글 수정"/><br/>
												<input class="btn btn-secondary btn-sm" type="button" value="취소" onclick=""/>
											</div>
										</div>
									</div><hr/>
								</c:if>
								</form>
								<!-- 삭제된 댓글일 경우 표시 -->
								<c:if test="${co.deleted == 'yes'}">
									<div>삭제된 댓글입니다</div><hr/>
								</c:if>
							</c:if>
							</c:forEach>
						</c:if>
					</div><hr/>
					<!-- 댓글이 없는 경우 -->
					<div style="background-color: gray;">
						<c:if test="${comment.size() == 0}">
								<div><marquee><b>댓글이 없습니다</b></marquee></div><br/>
						</c:if>
					</div>
					<div id="div5_2" style="background-color: orange;">
						<form method="post" action="commentInsert.jsp" id="commentForm"
							onsubmit="return commentFormCheck(this)">
						<!-- 댓글 입력, 수정, 삭제에 사용 -->
							<h4>댓글 작성</h4><hr/>
							<table>
							<tr>
								<th class="align-middle text-center" style="width: 80px;">
									<label for="commentName">이름</label>
								</th>
								<td style="width: 270px;">
									<input class="form-control form-control-sm" id="commentName" type="text" name="name"/>
								</td>
							</tr>
							<tr>
								<th class="align-middle text-center" style="width: 80px;">
									<label for="commentcontent">내용</label>
								</th>
								<td colspan="3" style="width: 600px;">
								<textarea class="form-control form-control-sm" id="commentcontent" rows="4" name="content" style="resize: none;"></textarea>
								</td>
							</tr>
							<tr class="table-dark">
								<td class="align-middle text-center" colspan="2">
									<input class="btn btn-secondary btn-sm" type="submit" value="댓글 저장"/>
									<input class="btn btn-secondary btn-sm" type="button" value="다시쓰기"/>
								</td>
							</tr>
							</table>
							<!-- 화면에 보이면 안되는 부분 -->
							<table align="center" hidden="hidden">
								<tr>
									<td>
										<!-- 작성할 댓글의 글번호 -->
										idx: <input type="text" name="idx" value="${boardvo.idx}" size="1"/>
										<!-- 현재 댓글이 어떤 메인글의 댓글인가 -->
										gup: <input type="text" name="gup" value="${boardvo.idx}" size="1"/>
										<!-- 메인글이 표시되던 페이지 번호 -->
										currentPage: <input type="text" name="currentPage" value="${currentPage}" size="1"/>
									</td>
								</tr>
							</table>
						</form>
					</div>
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