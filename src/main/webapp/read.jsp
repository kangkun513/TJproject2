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
<link rel="stylesheet" href="./css/read.css"/>

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
		
		<c:set var="mainvo" value="${Mainboard}" />

		<div class="login" id="divA"
			style="background-color: yellow; text-align: right; padding-top: 20px; padding-right: 20px">
			<!-- 로그인하지 않은 상태 -->
			<c:if test="${loginCheck != 1}">
				<input class="btn btn-primary" type="button" value="login"
					style="width: 35%" onclick="location.href='./login.jsp?backPage=3&idx=${mainvo.idx}&currentPage=${currentPage}'" />
				<input class="btn btn-dark" type="button" value="register"
					style="width: 50%" onclick="location.href='./register.jsp'"/>
			</c:if>
			<!-- 로그인한 상태 -->
			<c:if test="${loginCheck == 1}">
				${loginInfoID}님 환영합니다
				<input class="btn btn-primary" type="button" value="logout"
					style="width: 35%" onclick="location.href='./logout.jsp?backPage=3&idx=${mainvo.idx}&currentPage=${currentPage}'" />
			</c:if>
		</div>
	</div>
	
	<div>
	<div id="div2" class="left" style="position: sticky; top:0rem; background-color: tomato;">
		<h4>소설 정보</h4><hr/>
		<div id="div2_1">
			소설 제목<br/>
			<c:if test="${mainvo.deleted == 'no'}">
				<c:set var="subject" value="${fn:replace(mainvo.subject, '<', '&lt;')}"/>
				<c:set var="subject" value="${fn:replace(subject, '>', '&gt;')}"/>
				<b>${subject}</b>
			</c:if>
			<c:if test="${mainvo.deleted == 'yes'}">
				<b>삭제된 글입니다</b>
			</c:if>
		</div>

		<div id="div2_2">explain 소설설명</div>

		<div id="div2_2" align="center">
			<form action="#" method="post">
				<input class="category" type="radio" value="작성자">글쓴이 <input
					class="category" type="radio" value="제목" /> 제목 <input type="text"
					style="width: 90%; margin-bottom: 4%" /> <input
					class="btn btn-sm btn-outline-success" type="submit"
					style="width: 50%;" value="검색"/>
			</form>
		</div>
		
		<div id="div2_2" align="center">
			<!-- 로그인 상태일 경우 -->
			<c:if test="${loginCheck == 1}">
				<!-- 게시글 아이디와 회원의 아이디가 같을 때 -->
				<c:if test="${mainvo.id == loginInfoID}">
				<input class="btn btn-primary btn-sm" type="button" value="수정"
					onclick="location.href='selectByIdx.jsp?idx=${mainvo.idx}&currentPage=${currentPage}&job=update'"/>
				<input class="btn btn-danger btn-sm" type="button" value="삭제" 
					onclick="location.href='selectByIdx.jsp?idx=${mainvo.idx}&currentPage=${currentPage}&job=delete'"/>
				</c:if>
				<!-- 게시글 아이디와 회원의 아이디가 다를 때 -->
				<c:if test="${mainvo.id != loginInfoID}">
					수정, 삭제 불가<br/>
					다른 회원이 작성한 글
				</c:if>
			</c:if>
			<!-- 로그아웃 상태일 경우 -->
			<c:if test="${loginCheck != 1}">
				글 수정, 삭제<br/>
				로그인하세요
			</c:if>
		</div>
		
		<div id="div2_3" align="center">
			<!-- 로그인 상태일 경우 -->
			<c:if test="${loginCheck == 1}">
				<!-- 게시글 아이디와 회원의 아이디가 다를 때 -->
				<c:if test="${mainvo.id != loginInfoID}">
					<input class="btn btn-info btn-lg" value="추천"/ style="height: 100%; width: 100%"
						onclick="location.href='selectByIdx.jsp?idx=${mainvo.idx}&currentPage=${currentPage}&job=good'"/>
				</c:if>
				<!-- 게시글 아이디와 회원의 아이디가 같을 때 -->
				<c:if test="${mainvo.id == loginInfoID}">
					추천 불가<br/>
					본인 글은 본인이 추천할 수 없음
				</c:if>
			</c:if>
			<!-- 로그아웃 상태일 경우 -->
			<c:if test="${loginCheck != 1}">
				추천<br/>
				로그인하세요
			</c:if>
		</div>
	</div>
	<div id="div3">
		<div class="center" style="background-color: silver">
			<h4>소설 내용</h4><hr/>
			<table style="width: 100%; border: 1px solid black;">
				<tr style="height: 2em;">
					<th>글 번호</th>
					<td name="idx">${mainvo.idx}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>글 그룹 번호</th>
					<td name="gup">${mainvo.gup}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>작성자 ID</th>
					<td name="id">${mainvo.id}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>카테고리</th>
					<td name="category">${mainvo.category}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>조회수</th>
					<td name="hit">${mainvo.hit}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>추천수</th>
					<td name="good">${mainvo.good}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>작성 날짜</th>
					<fmt:formatDate var="Date" value="${mainvo.writeDate}" pattern="yyyy/MM/dd a h:mm:ss"/>
					<td name="writeDate">${Date}</td>
				</tr>
				<tr style="border: 1px solid black;">
					<th>내용</th>
				
					<c:if test="${mainvo.deleted == 'no'}">
						<c:set var="content" value="${fn:replace(mainvo.content, '<', '&lt;')}"/>
						<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
						<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
						<td name="content">${content}</td>
					</c:if>
					<c:if test="${mainvo.deleted == 'yes'}">
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
							
							<c:set var="updateForm" value="updateform${co.idx}"></c:set>
							<c:set var="replyForm" value="replyform${co.idx}"></c:set>
							
							<fmt:formatDate var="codate" value="${co.writeDate}" pattern="yyyy/MM/dd a h:mm:ss"/>
								<c:set var="name" value="${fn:replace(co.name, '<', '&lt;')}"/>
								<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
								<c:set var="content" value="${fn:replace(co.content, '<', '&lt;')}"/>
								<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
								<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
								<div>
								
								${upidx}. 
								</div><br/>
								<c:set var="upidx" value="${upidx + 1}" />
								
								<!-- 삭제된 댓글이 아닐 경우 표시 -->
								<c:if test="${co.deleted != 'yes'}">
									<div>
										<div>${content}</div><br/>
										${name}님이 ${codate}에 작성<br/>
										<!-- 댓글 아이디와 회원 아이디가 같을 경우 -->
										<c:if test="${name == loginInfoID}">
											
											<input class="btn btn-primary btn-sm" type="button" value="댓글 수정" onclick="setting(${co.idx}, 1)"/>
											<input class="btn btn-danger btn-sm" type="button" value="댓글 삭제" 
												onclick="location.href='commentDelete.jsp?idx=${mainvo.idx}&commentidx=${co.idx}&currentPage=${currentPage}'"/>
											<input class="btn btn-warning btn-sm" type="button" value="답글 달기" onclick="setting(${co.idx}, 2)"/><br/>
											
											<form action="commentUpdate.jsp" name="${updateForm}" method="post" id="${updateForm}" style="display: none;">
											<textarea class="form-control form-control-sm" type="text" name="upcomment" rows="4"
												style="width: 50%; resize: none; display: inline-block;"></textarea>
											<div style="display: inline-block;">
												<input class="btn btn-primary btn-sm" type="submit" value="댓글 수정"/><br/>
												<input class="btn btn-secondary btn-sm" type="button" value="취소" onclick="setting(${co.idx}, 3)"/>
											</div>
											<div hidden="hidden">
												idx: <input type="text" name="voidx" value="${idx}" size="1" readonly="readonly"/>
												comidx: <input type="text" id="comidx" name="comidx" value="${co.idx}" size="1" readonly="readonly"/>
												mode: <input type="text" name="mode" value="1" size="1" readonly="readonly"/>
												currentPage: <input type="text" name="currentPage" value="${currentPage}" size="1" readonly="readonly"/>
											</div>
											</form>
											
											<form action="#" name="${replyForm}" method="post" id="${replyForm}" style="display: none;">
											<textarea class="form-control form-control-sm" type="text" name="content" rows="4"
												style="width: 50%; resize: none; display: inline-block;"></textarea>
											<div style="display: inline-block;">
												<input class="btn btn-warning btn-sm" type="submit" value="답글 달기"/><br/>
												<input class="btn btn-secondary btn-sm" type="button" value="취소" onclick="setting(${co.idx}, 3)"/>
											</div>
											<div hidden="hidden">
												idx: <input type="text" name="voidx" value="${idx}" size="1" readonly="readonly"/>
												comidx: <input type="text" id="comidx" name="comidx" value="${co.idx}" size="1" readonly="readonly"/>
												mode: <input type="text" name="mode" value="1" size="1" readonly="readonly"/>
												currentPage: <input type="text" name="currentPage" value="${currentPage}" size="1" readonly="readonly"/>
											</div>
											</form>
										</c:if>
										
									</div><hr/>
								</c:if>
								<!-- 삭제된 댓글일 경우 표시 -->
								<c:if test="${co.deleted == 'yes'}">
									<div>삭제된 댓글입니다</div><hr/>
								</c:if>
							
							</c:forEach>
						</c:if>
						<!-- 댓글이 없는 경우 -->
						<c:if test="${comment.size() == 0}">
							<div style="background-color: gray; height: 5em;">
								<marquee><b>댓글이 없습니다</b></marquee>
							</div>
						</c:if>
					</div>
					<!-- 댓글 입력, 수정, 삭제에 사용 -->
					<div id="div5_2" style="background-color: orange;">
					<form method="post" action="commentInsert.jsp" id="commentForm" onsubmit="return commentFormCheck(this)">
							<h4>댓글 작성</h4><hr/>
							<c:if test="${loginCheck == 1}">
								<table>
								<tr>
									<th class="align-middle text-center" style="width: 80px;">
										<label for="commentcontent">내용</label>
									</th>
									<td colspan="4" style="width: 600px;">
									<textarea class="form-control form-control-sm" id="commentcontent" rows="4" name="content" style="resize: none;"></textarea>
									</td>
								</tr>
								
								<tr class="table-dark">
									<td class="align-middle text-center" colspan="2">
										<input class="btn btn-secondary btn-sm" type="submit" value="댓글 저장"/>
										<input class="btn btn-secondary btn-sm" type="reset" value="다시쓰기"/>
									</td>
								</tr>
								</table>
							</c:if>
							<c:if test="${loginCheck != 1}">
								<div style="height: 10em">로그인하세요</div>
							</c:if>
							<!-- 화면에 보이면 안되는 부분 -->
							<table align="center" hidden="hidden">
								<tr>
									<td>
										<!-- 작성할 댓글의 글번호 -->
										idx: <input type="text" name="idx" value="${mainvo.idx}" size="1" readonly="readonly"/>
										<!-- 현재 댓글이 어떤 메인글의 댓글인가 -->
										gup: <input type="text" name="gup" value="${mainvo.idx}" size="1" readonly="readonly"/>
										<!-- 메인글이 표시되던 페이지 번호 -->
										currentPage: <input type="text" name="currentPage" value="${currentPage}" size="1" readonly="readonly"/>
										<!-- 해당 댓글을 작성하는 회원의 아이디 -->
										name: <input type="text" name="name" value="${loginInfoID}" readonly="readonly"/>
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