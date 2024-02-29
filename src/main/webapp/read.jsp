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
<script src="./js/setting.js" defer="defer"></script>
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
		<div id="div0" style="background-color: purple;">로고</div>
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
	
	<div>
	<div id="div2" class="left" style="position: sticky; top:0rem; background-color: tomato;">
		<h4>소설 정보</h4><hr/>
		<div id="div2_1">${subject}</div>

		<div id="div2_2">explain 소설설명</div>

		<div id="div2_3" align="center">
			<form action="#" method="post">
				<input class="category" type="radio" value="작성자">글쓴이 <input
					class="category" type="radio" value="제목" /> 제목 <input type="text"
					style="width: 90%; margin-bottom: 4%" /> <input
					class="btn btn-sm btn-outline-success" type="submit"
					style="width: 50%;" value="검색" />
			</form>
		</div>
		
		<div>
			<input class="btn btn-primary btn-sm" type="button" value="수정"/>
			<input class="btn btn-danger btn-sm" type="button" value="삭제"/>
		</div>
	</div>
	<div id="div3">
		<div class="center" style="background-color: silver">
			<h4>소설 내용</h4><hr/>
			<table style="width: 100%; border: 1px solid black;">
				<tr style="height: 2em;">
					<th>글 번호</th>
					<td name="idx">${idx}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>글 그룹 번호</th>
					<td name="gup">${gup}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>작성자 ID</th>
					<td name="id">${id}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>카테고리</th>
					<td name="category">${category}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>조회수</th>
					<td name="hit">${hit}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>추천수</th>
					<td name="good">${good}</td>
				</tr>
				<tr style="height: 2em; border: 1px solid black;">
					<th>작성 날짜</th>
					<td name="writeDate">${writeDate}</td>
				</tr>
				<tr style="border: 1px solid black;">
					<th>내용</th>
					<td name="content">${content}</td>
				</tr>
			</table>
				<div name="test용text" style="display: none;">
				<p>
					<b>111111111111111111</b><br/>
					What is Lorem Ipsum?<br/>
					Lorem Ipsum is simply dummy text of the printing and typesetting industry.<br/>
					Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,<br/>
					when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br/>
					It has survived not only five centuries, but also the leap into electronic typesetting,<br/>
					remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,<br/>
					and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br/>
				</p>
				<p>
					Why do we use it?<br/>
					It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<br/>
					The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,<br/>
					as opposed to using 'Content here, content here', making it look like readable English.<br/>
					Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,<br/>
					and a search for 'lorem ipsum' will uncover many web sites still in their infancy.<br/>
					Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br/>
				</p>
				<p>
					Where does it come from?<br/>
					Contrary to popular belief, Lorem Ipsum is not simply random text.<br/>
					It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.<br/>
					Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,<br/>
					looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage,<br/>
					and going through the cites of the word in classical literature, discovered the undoubtable source.<br/>
					Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero,<br/>
					written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.<br/>
					The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.<br/>
					The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.<br/>
					Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form,<br/>
					accompanied by English versions from the 1914 translation by H. Rackham.<br/>
				</p>
				<p>
					Where can I get some?<br/>
					There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,<br/>
					or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum,<br/>
					you need to be sure there isn't anything embarrassing hidden in the middle of text.<br/>
					All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,<br/>
					making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words,<br/>
					combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.<br/>
					The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.<br/>
				</p>
				<p>
					<b>2222222222222222</b><br/>
					What is Lorem Ipsum?<br/>
					Lorem Ipsum is simply dummy text of the printing and typesetting industry.<br/>
					Lorem Ipsum has been the industry's standard dummy text ever since the 1500s,<br/>
					when an unknown printer took a galley of type and scrambled it to make a type specimen book.<br/>
					It has survived not only five centuries, but also the leap into electronic typesetting,<br/>
					remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages,<br/>
					and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.<br/>
				</p>
				<p>
					Why do we use it?<br/>
					It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.<br/>
					The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters,<br/>
					as opposed to using 'Content here, content here', making it look like readable English.<br/>
					Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text,<br/>
					and a search for 'lorem ipsum' will uncover many web sites still in their infancy.<br/>
					Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).<br/>
				</p>
				<p>
					Where does it come from?<br/>
					Contrary to popular belief, Lorem Ipsum is not simply random text.<br/>
					It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old.<br/>
					Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia,<br/>
					looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage,<br/>
					and going through the cites of the word in classical literature, discovered the undoubtable source.<br/>
					Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero,<br/>
					written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance.<br/>
					The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.<br/>
					The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested.<br/>
					Sections 1.10.32 and 1.10.33 from "de Finibus Bonorum et Malorum" by Cicero are also reproduced in their exact original form,<br/>
					accompanied by English versions from the 1914 translation by H. Rackham.<br/>
				</p>
				<p>
					Where can I get some?<br/>
					There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour,<br/>
					or randomised words which don't look even slightly believable. If you are going to use a passage of Lorem Ipsum,<br/>
					you need to be sure there isn't anything embarrassing hidden in the middle of text.<br/>
					All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary,<br/>
					making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words,<br/>
					combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable.<br/>
					The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.<br/>
				</p>
				</div>
			<div id="div5">
					<div id="div5_1" class="item" style="background-color: gray;">
						<h4>댓글 목록</h4><hr/>
						<!-- 댓글을 출력함 -->
						<c:set var="comment" value="${commentList.list}"/>
						<!-- 댓글이 있는 경우 -->
						<c:if test="${comment.size() != 0}">
						<c:forEach var="co" items="${commentList.list}">
						<c:set var="commentForm" value="form${co.idx}"></c:set>
						<form action="commentUpdate.jsp" method="post" name="${commentForm}">
						<fmt:formatDate var="codate" value="${co.writeDate}" pattern="yyyy/MM/dd a hh:mm:ss"/>
							<c:set var="name" value="${fn:replace(co.name, '<', '&lt;')}"/>
							<c:set var="name" value="${fn:replace(name, '>', '&gt;')}"/>
							<c:set var="content" value="${fn:replace(co.content, '<', '&lt;')}"/>
							<c:set var="content" value="${fn:replace(content, '>', '&gt;')}"/>
							<c:set var="content" value="${fn:replace(content, enter, '<br/>')}"/>
							<div>${co.idx}. </div><br/>
							<div>${content}</div><br/>
							<div>
							${name}님이 ${codate}에 작성<br/>
							<!-- 자바스크립트 함수의 인수로 문자열을 전달할 경우 반드시 ''로 묶어야 함 -->
							<input class="btn btn-primary btn-sm" type="button" value="댓글 수정" onclick="#"/>
							<input class="btn btn-danger btn-sm" type="button" value="댓글 삭제" onclick="location.href='commentDelete.jsp?idx=${co.idx}'"/>
							<input class="btn btn-warning btn-sm" type="button" value="답글 달기" onclick="showReply()"/>
							<textarea class="reply form-control form-control-sm" type="text" id="reply" name="reply" rows="4" style="resize: none;"></textarea>
							<input class="btn btn-primary btn-sm" type="submit" value="댓글 수정" onclick="showRecomment()"/>
							<input class="btn btn-secondary btn-sm" type="submit" value="취소" onclick="hideRecomment()"/>
							</div><hr/>
						</form>
						</c:forEach>
						</c:if>
						<!-- 댓글이 없는 경우 -->
						<c:if test="${comment.size() == 0}">
								<div><marquee><b>댓글이 없습니다</b></marquee></div><br/>
						</c:if>
					</div>
					<div id="div5_2" style="background-color: orange;">
						<form method="post" action="commentInsert.jsp" id="commentForm" onsubmit="return commentFormCheck(this)">
						<!-- 댓글 입력, 수정, 삭제에 사용 -->
							<h4>댓글 작성</h4><hr/>
							<table>
							<tr>
								<th class="align-middle text-center" style="width: 80px;">
									<label for="name">이름</label>
								</th>
								<td style="width: 270px;">
									<input class="form-control form-control-sm" id="commentName" type="text" name="name"/>
								</td>
							</tr>
							<tr>
								<th class="align-middle text-center" style="width: 80px;">
									<label for="content">내용</label>
								</th>
								<td colspan="3" style="width: 600px;">
								<textarea class="form-control form-control-sm" id="content" rows="4" name="content" style="resize: none;"></textarea>
								</td>
							</tr>
							<tr class="table-dark">
								<td class="align-middle text-center" colspan="2">
									<input class="btn btn-secondary btn-sm" type="submit" value="댓글 저장"/>
									<input class="btn btn-secondary btn-sm" type="button" value="다시쓰기" onclick="setting(0, 1, '댓글 저장', '', '')"/>
								</td>
							</tr>
							</table>
						</form>
						<!-- 화면에 보이면 안되는 부분 -->
						<table align="center">
							<tr>
								<td>
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
						</table>
					</div>
			</div>
		</div>
	</div>
	<div id="div4" class="right" style="position: sticky; top:0rem; background-color: skyblue;">
		<h4>추천 소설 목록</h4><hr/>
		조회수 높은 소설 목록<br/>
		<ol>
			<c:set var="list" value="${rankList.list}"></c:set>
			<c:forEach var="vo" items="${list}">
				<li><a class="" href="#">${vo.getSubject()}(${vo.getHit()})</a></li>
			</c:forEach>
		</ol><hr/>
		추천 높은 소설 목록<br/>
		<ol>
			<c:set var="list" value="${rankList.list}"></c:set>
			<c:forEach var="vo" items="${list}">
				<li><a class="" href="#">${vo.getSubject()}(${vo.getGood()})</a></li>
			</c:forEach>
		</ol><hr/>
		새로운 소설 목록<br/>
		<ol>
			<fmt:formatDate var="writeDate" value="${vo.writeDate}" pattern="yyyy/MM/dd"/>
			<c:forEach var="vo" items="${list}">
				<li><a class="" href="#">${vo.getSubject()}(${writeDate})</a></li>
			</c:forEach>
		</ol><hr/>
	</div>
	</div>
	

	
	
</div>
</body>
</html>